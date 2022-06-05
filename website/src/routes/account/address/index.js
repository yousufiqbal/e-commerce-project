import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ locals }) => {
  const addresses = await db
    .selectFrom('addresses')
    .where('addresses.user_id', '=', locals.user_id)
    .orderBy('addresses.default', 'desc')
    .selectAll().execute()
  return { body: { addresses }}
}

