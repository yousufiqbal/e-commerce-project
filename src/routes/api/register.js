import { db } from '$lib/database/db'
import { registerSchema } from '$lib/others/schema'
import bcryptjs from 'bcryptjs'
import cookie from 'cookie'
import jwt from 'jsonwebtoken'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request }) => {

  try {
    const body = await request.json()
    // General validation
    const user = await registerSchema.validate(body, { abortEarly: false })
    // Is email unique?
    const result = await db.selectFrom('users').where('users.email', '=', user.email)
      .selectAll().executeTakeFirst()
    if (result) throw new Error('Email already registered')
    // hash password
    user.password = await bcryptjs.hash(user.password, 11)
    delete user.repeatPassword
    // save user
    const { insertId } = await db.insertInto('users').values(user).executeTakeFirst()
    const payload = { user_id: Number(insertId), name: user.name }
    // login user using cookie
    const fact = jwt.sign(payload, import.meta.env.VITE_SECRET)
    return {
      status: 201, headers: { 'set-cookie': cookie.serialize('fact', fact, { path: '/', maxAge: 7 * 86400 }) },
      body: { payload }
    }
  } catch (error) {
    console.log(error)
  }
  
}