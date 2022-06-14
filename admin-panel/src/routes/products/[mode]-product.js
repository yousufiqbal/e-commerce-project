import { db } from '$lib/database/db'
import { sql } from 'kysely'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url, params }) => {

  // Getting categories with paths..
  const categories = await db.withRecursive('categories_cte', db => 
    db.selectFrom('categories')
      .where('categories.parent_id', 'is', null)
      .select(['categories.category_id', 'categories.name', 'categories.name as path'])
      .unionAll(
        db.selectFrom('categories_cte')
          .innerJoin('categories', 'categories.parent_id', 'categories_cte.category_id')
          .select(['categories.category_id', 'categories.name', sql`CONCAT(categories_cte.path, '  →  ', categories.name)`]))
    ).selectFrom('categories_cte').selectAll().orderBy('path').execute()

  // Getting brands..
  const brands = await db.selectFrom('brands').selectAll().orderBy('brands.name').execute()

  // Getting Constants..
  const constantsRaw = await db.selectFrom('constants').selectAll().execute()
  let constants = {}
  for (const constant of constantsRaw) {
    constants[constant.name] = constant.value
  }

  // Getting product if in edit mode..
  let product = {}
  if (params.mode == 'edit') {
    const product_id = url.searchParams.get('product_id')
    product = await db.selectFrom('products').where('products.product_id', '=', product_id)
      .selectAll().executeTakeFirst()
    // TODO set these.. category_path: '', brand_name: '', category_id: null, brand_id: null
  }
  
  return { body: { categories, brands, constants, product }}

}

