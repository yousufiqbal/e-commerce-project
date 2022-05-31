import { db } from '$lib/database/db'
import jwt from 'jsonwebtoken'
import cookie from 'cookie'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async () => {

  // Making Guest..
  const { insertId } = await db.insertInto('guests').values({}).executeTakeFirst()
  const payload = { guest_id: Number(insertId), name: 'Account' }
  const fact = jwt.sign(payload, import.meta.env.VITE_SECRET)
  
  // Response
  return {
    status: 201,
    body: { payload },
    headers: { 'set-cookie': cookie.serialize('fact', fact, { path: '/', maxAge: 7 * 86400 }) }
  }
}