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
    console.log('came')
    // Is email unique?
    const result = await db.selectFrom('users').where('users.email', '=', user.email)
      .selectAll().executeTakeFirst()
    if (result) throw new Error('Email already registered')
    console.log(user)
    // hash password
    user.password = await bcryptjs.hash(user.password, 11)
    delete user.repeatPassword
    // save user
    const { insertId } = await db.insertInto('users').values(user, ).executeTakeFirst()
    console.log(Number(insertId))
    // login user using cookie
    const fact = jwt.sign({ user_id: Number(insertId), name: user.name }, '}{}{34+_1+ad_-=][]')
    
    return {
      status: 201, headers: { 'set-cookie': cookie.serialize('fact', fact, { path: '/', maxAge: 7 * 86400 }) },
      body: { message: 'User Registered'}
    }
  } catch (error) {
    console.log(error)
  }
  
}