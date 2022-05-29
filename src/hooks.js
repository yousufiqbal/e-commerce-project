import { dev } from '$app/env'
import { db } from '$lib/database/db'
import cookie from 'cookie'
import jwt from 'jsonwebtoken'

/** @type {import('@sveltejs/kit').Handle} */
export const handle = async ({ event, resolve }) => {
  
  if (dev)  {

    // Log URL & Method
    console.log('----------------')
    console.log(event.request.method, event.request.url)

  }
  
  const response = await resolve(event)
  return response


}

/** @type {import('@sveltejs/kit').GetSession} */
export const getSession = async (event) => {

  const cookies = cookie.parse(event.request.headers.get('cookie') || '')
  const fact = cookies?.fact
  const secret = import.meta.env.VITE_SECRET
  
  try {
    const sub = jwt.verify(fact, secret)
    console.log(jwt.decode(fact))
    const { given_name } = await db.selectFrom('users')
      .where('users.sub', '=', sub)
      .executeTakeFirst()
    return { user: given_name }
  } catch (error) {
    return { user: false }
  }

}