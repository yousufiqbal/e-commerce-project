import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ params, url }) => {
  if (params.mode == 'edit') {
    const category_id = url.searchParams.get('category_id') || ''
    const category = await db.selectFrom('categories')
      .select(['categories.category_id', 'categories.name', 'categories.url_name'])
      .where('categories.category_id', '=', category_id)
      .executeTakeFirst()
    console.dir(category)
    return { body: { category } }
  }
  return {}
}