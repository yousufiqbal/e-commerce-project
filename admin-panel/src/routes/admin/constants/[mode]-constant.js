import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url, params }) => {
  if (params.mode == 'edit') {
    const constant_id = url.searchParams.get('constant_id')
    const constant = await db.selectFrom('constants')
      .selectAll()
      .where('constants.constant_id', '=', constant_id)
      .executeTakeFirst()
    return { body: { constant }}
  }
  return {}
}