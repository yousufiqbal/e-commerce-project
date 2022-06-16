import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async () => {
  const users = await db.selectFrom('users')
    .select(['users.user_id', 'users.name', 'users.email', 'users.created'])
    .execute()

  return { body: { users }}
}