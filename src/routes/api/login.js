import { db } from '$lib/database/db'
import { loginSchema } from '$lib/others/schema'
import { internalError } from '$lib/others/utils'
import bcryptjs from 'bcryptjs'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request }) => {

  try {
    // general validataion
    const body = await request.json()
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