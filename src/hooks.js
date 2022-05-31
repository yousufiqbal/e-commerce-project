import { dev } from '$app/env'
import { db } from '$lib/database/db'
import cookie from 'cookie'
import jwt from 'jsonwebtoken'

/** @type {import('@sveltejs/kit').Handle} */
export const handle = async ({ event, resolve }) => {

  // Log URL & Method
  if (dev)  {
    console.log('----------------')
    console.log(event.request.method, event.request.url)
  }
  
  // Response
  return await resolve(event)

}

/** @type {import('@sveltejs/kit').GetSession} */
export const getSession = async ( event ) => {

  // Cookie
  const cookies = cookie.parse(event.request.headers.get('cookie') || '')
  const fact = cookies.fact || null
  const secret = import.meta.env.VITE_SECRET

  if (fact && jwt.verify(fact, secret)) {
    // User or Guest..
    const payload = jwt.decode(fact)
    if (payload.user_id) return { user_id: payload.user_id, name: payload.name }
    if (payload.guest_id) return { guest_id: payload.guest_id, name: 'Account' }
  } else {
    // Not Both..
    return { user_id: null, name: null }
  }


}