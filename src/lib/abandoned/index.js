// For Google Sign In button..

import { knex } from '$lib/database/db'
import jwt from 'jsonwebtoken'
import cookie from 'cookie'

let Decoded = { iss: '', nbf: 0, aud: '', sub: '', email: '', email_verified: true, azp: '', name: '', picture: '', given_name: '', family_name: '', iat: 0, exp: 0, jti: '' }

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request }) => {

  const body = await request.text()
  const credential = new URLSearchParams(body).get('credential')

  /** @type {Decoded} */
  const decoded = jwt.decode(credential)

  // Check if user has verfied email
  if (!decoded.email_verified) return {
    body: { status: 404, message: 'You are not verified at Google. Cannot continue.' }
  }

  // Check if new or old user
  const alreadyAUser = await knex('users').where('sub', decoded.sub).first()

  if (!alreadyAUser) {
    // Save user into database
    await knex('users').insert({
      sub: decoded.sub,
      email: decoded.email,
      name: decoded.name,
      picture: decoded.picture,
      given_name: decoded.given_name,
      family_name: decoded.family_name
    })
  }

  // Login user saving his sub id into jwt and jwt into cookie
  const payload = jwt.sign(decoded.sub, '!@#}{@#$/.,;```a}{|sd')
  
  return {
    // body: { name: decoded.given_name },
    status: 303,
    headers: {
      'set-cookie': cookie.serialize('fact', payload, { maxAge: 7 * 24 * 60 * 1000, path: '/' }),
      location: `/account`
    }
  }
  
}