import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url, params }) => {
  const parent_id = url.searchParams.get('parent_id')
  const parent = await db.selectFrom('categories')
    .where('categories.category_id', '=', parent_id)
    .selectAll()
    .executeTakeFirst()

  return { body: { parent }}
}