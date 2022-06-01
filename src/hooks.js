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
  
  // Cookie
  const cookies = cookie.parse(event.request.headers.get('cookie') || '')
  const fact = cookies.fact || null
  const secret = import.meta.env.VITE_SECRET

  if (fact && jwt.verify(fact, secret)) {
    
    // User or Guest..
    const payload = jwt.decode(fact)
    if (payload.user_id) event.locals = payload
    if (payload.guest_id) event.locals = payload

  } else {
    // Not Both..
    event.locals = {}
  }

  // Response
  return await resolve(event)

}

/** @type {import('@sveltejs/kit').GetSession} */
export const getSession = async ( event ) => {

  return event.locals

}