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
    jwt.verify(fact, secret)
    const payload = jwt.decode(fact)
    console.log(payload)
    return { user_id: payload.user_id, name: payload.name }
  } catch (error) {
    return { user_id: null, name: null }
  }

}