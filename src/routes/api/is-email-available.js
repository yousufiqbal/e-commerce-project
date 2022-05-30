import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request }) => {
  const body = await request.json()
  const user = await db.selectFrom('users')
    .select('users.user_id')
    .where('users.email', '=', body.email).executeTakeFirst()
  if (user) {
    return { status: 200, body: false }
  } else {
    return { status: 200, body: true }
  }
}