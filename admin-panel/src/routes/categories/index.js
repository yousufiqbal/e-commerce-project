import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async () => {
  const categories = await db.selectFrom('categories').selectAll().execute()
  let data = []
  for (const category of categories) {
    if (category.parent_id == null) data.push({
      name: category.name,
      subcategories: categories.filter(subcategory => subcategory.parent_id == category.category_id)
    })
  }
 return { body: { categories: data }}
}