import { db } from '$lib/database/db'
import { sql } from 'kysely'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {

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

  // Pagination
  const page = url.searchParams.get('page') || 1
  const limit = url.searchParams.get('limit') || 20

  // Getting Products..
  const products = await db.selectFrom('products')
    .limit(limit).offset((page - 1) * limit)
    .selectAll().execute()
  const { count } = db.fn
  const { total } = await db.selectFrom('products').select([count('products.product_id').as('total')]).executeTakeFirst()
  
  // Getting parents..
  const parents = await db.selectFrom('categories')
      .where('categories.parent_id', 'is', null)
      .selectAll().execute()

  // Getting current category
  const category_id = url.searchParams.get('category_id') || null
  const category = categories.filter(category => category.category_id == category_id)[0] || 'No Category Selected'

  return { body: { products, total, categories, brands, parents, category }}

}
