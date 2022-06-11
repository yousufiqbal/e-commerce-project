import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url, params }) => {

  
  const categories = await db.selectFrom('categories')
  .select(['categories.category_id', 'categories.name', 'categories.url_name'])
  .where('categories.parent_id', 'is', null)
  .execute()

  if (params.mode == 'edit') {
    const subcategory_id = url.searchParams.get('subcategory_id')
    const subcategory = await db.selectFrom('categories')
      .leftJoin('categories as parent', 'parent.parent_id', 'categories.parent_id')
      .where('categories.category_id', '=', subcategory_id)
      .where('categories.parent_id', 'is not', null)
      .select(['parent.category_id', 'parent.name as category_name', 'categories.name', 'categories.url_name'])
      .executeTakeFirst()
      return { body: { categories, subcategory }}
  }

  return { body: { categories }}

}