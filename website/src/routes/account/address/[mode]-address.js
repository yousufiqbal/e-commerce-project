import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url, params }) => {
  if (params.mode == 'add') return {}
  const address_id = url.searchParams.get('address_id')
  const address = await db.selectFrom('addresses')
    .selectAll()
    .where('addresses.address_id', '=', address_id)
    .executeTakeFirst()
  return { body: { address }}
}