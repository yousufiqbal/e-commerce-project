import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async () => {

  const categories = await db.selectFrom('categories')
    .select(['categories.name', 'categories.url_name'])
    .orderBy('categories.name')
    .where('categories.parent_id', 'is', null)
    .execute()

  return {
    body: { categories }
  }
}