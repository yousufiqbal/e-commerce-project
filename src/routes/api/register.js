import { db } from '$lib/database/db'
import { registerSchema } from '$lib/others/schema'
import bcryptjs from 'bcryptjs'
import cookie from 'cookie'
import jwt from 'jsonwebtoken'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request }) => {

  try {
    const body = await request.json()
    console.log('came')
    // General validation
    const user = await registerSchema.validate(body, { abortEarly: false })
    // Is email unique?
    const result = await db.selectFrom('users').where('users.email', '=', user.email)
      .selectAll().executeTakeFirst()
    if (result) throw new Error('Email already registered')
    // hash password
    const hashedPassword = await bcryptjs.hash(user.password)
    delete user.password
    // save user
    const user_id = await db.insertInto('users').values({
      ...user,
      password: hashedPassword
    })
    // login user using cookie
    const fact = jwt.sign({ user_id, name: user.name }, '}{}{34+_1+ad_-=][]')
    
    return {
      status: 201, headers: { 'set-cookie': cookie.serialize('fact', fact, { path: '/', maxAge: 7 * 86400 }) },
      body: { message: 'User Registered'}
    }
  } catch (error) {
    
  }
  
}