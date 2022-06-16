import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {
  const user_id = url.searchParams.get('user_id')
  const user = await db.selectFrom('users')
    .where('users.user_id', '=', user_id)
    .select(['name', 'email', 'created']).executeTakeFirst()
  return { body: user }
}