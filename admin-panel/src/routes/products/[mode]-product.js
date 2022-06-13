import { db } from '$lib/database/db'
import { sql } from 'kysely'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url, params }) => {

  // All categories path (for changing current parent)
  const categories = await db.withRecursive('categories_cte', db => 
    db.selectFrom('categories')
      .where('categories.parent_id', 'is', null)
      .select(['categories.category_id', 'categories.name', 'categories.name as path'])
      .unionAll(
        db.selectFrom('categories_cte')
          .innerJoin('categories', 'categories.parent_id', 'categories_cte.category_id')
          .select(['categories.category_id', 'categories.name', sql`CONCAT(categories_cte.path, '  →  ', categories.name)`]))
    ).selectFrom('categories_cte').selectAll().orderBy('path').execute()

  // Brands
  const brands = await db.selectFrom('brands').selectAll().orderBy('brands.name').execute()

  // Constants
  const constantsRaw = await db.selectFrom('constants').selectAll().execute()
  let constants = {}
  for (const constant of constantsRaw) {
    constants[constant.name] = constant.value
  }
  
  return { body: { categories, brands, constants }}

}