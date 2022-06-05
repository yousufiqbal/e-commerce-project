import { db } from '$lib/database/db'
import { loginSchema } from '$lib/others/schema'
import { internalError } from '$lib/others/utils'
import bcryptjs from 'bcryptjs'
import dayjs from 'dayjs'
import jwt from 'jsonwebtoken'
import cookie from 'cookie'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request, locals, clientAddress }) => {

  const body = await request.json()

  try {

    // Checking fair usage..
    const guestTrials = await db.selectFrom('guest_trials').selectAll()
      .where('guest_trials.guest_id', '=', locals.guest_id)
      .where('guest_trials.for', '=', 'login')
      .where('guest_trials.created', '>=', dayjs().subtract(30, 'minutes').format('YYYY-MM-DD HH:mm'))
      .execute()

    if (guestTrials.length >= 3) {
      return {
        status: 401, body: { message: 'Too many trials. Checkback later' }
      }
    }

    // Adding trial..
    await db.insertInto('guest_trials').values({
      for: 'login',
      guest_id: locals.guest_id,
      ip: clientAddress,
      detail: JSON.stringify(body)
    }).execute()

    // general validataion
    const credential = await loginSchema.validate(body, { abortEarly: false})
    // check email
    const user = await db.selectFrom('users').selectAll().where('users.email', '=', credential.email).executeTakeFirst()
    if (!user) {
      return { status: 401, body: { message: 'Incorrect email or password' } }
    }
    // check password
    if (!await bcryptjs.compare(credential.password, user.password)) {
      return { status: 401, body: { message: 'Incorrect email or password' } }
    }
    // if user has empty cart... shift guest cart to him else not..
    // login
    const payload = { user_id: user.user_id, name: user.name }
    const fact = jwt.sign(payload, import.meta.env.VITE_SECRET)
    return {
      status: 201, headers: { 'set-cookie': cookie.serialize('fact', fact, { path: '/', maxAge: 7 * 86400 }) },
      body: { payload }
    }
  } catch (error) {
    return internalError(error)
  }
}