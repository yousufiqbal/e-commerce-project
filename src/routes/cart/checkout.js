import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ locals }) => {

  if (!locals.user_id) {
    return { status: 301, headers: { Location : '/user/login' } }
  }

  const address = await db.selectFrom('addresses')
    .selectAll()
    .where('addresses.user_id', '=', locals.user_id)
    .where('addresses.default', '=', '1')
    .executeTakeFirst()

  return { body: { address }}
}