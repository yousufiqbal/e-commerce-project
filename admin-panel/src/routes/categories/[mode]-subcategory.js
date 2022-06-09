import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({  }) => {

  const categories = await db.selectFrom('categories')
    .select(['categories.category_id', 'categories.name', 'categories.url_name'])
    .where('categories.parent_id', 'is', null)
    .execute()

  console.log(categories)

  return { body: { categories }}

}