import jwt from 'jsonwebtoken'
import cookie from 'cookie'
import { db } from '$lib/database/db'

let Decoded = { iss: '', nbf: 0, aud: '', sub: '', email: '', email_verified: true, azp: '', name: '', picture: '', given_name: '', family_name: '', iat: 0, exp: 0, jti: '' }

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request }) => {
  
  // 1. Decode credential post sign-in success
  const body = await request.json()
  /** @type {Decoded} */
  const decoded = jwt.decode(body.credential)

  // 2. Check if user has verfied email
  if (!decoded.email_verified) return {
    body: { status: 404, message: 'You are not verified at Google.' }
  }

  // check if new or old user
  const alreadyAUser = await db.selectFrom('users').where('users.sub', '=', decoded.sub).executeTakeFirst()

  if (!alreadyAUser) {
    // 3. Save user into database
    await db.insertInto('users').values({
      sub: decoded.sub,
      email: decoded.email,
      name: decoded.name,
      picture: decoded.picture,
      given_name: decoded.given_name,
      family_name: decoded.family_name
    }).execute()
  }

  // 4. login user saving his sub id into jwt and jwt into cookie
  const payload = jwt.sign(decoded.sub, '!@#}{@#$/.,;```a}{|sd')
  
  return {
    status: 200,
    body: { name: decoded.given_name },
    headers: {
      'set-cookie': cookie.serialize('fact', payload, { maxAge: 7 * 24 * 60 * 1000, path: '/' })
    }
  }

}

// /** @type {import('@sveltejs/kit').RequestHandler} */
// export const get = async ({ request }) => {
//   console.log('came-to-get')
//   return {}
// }