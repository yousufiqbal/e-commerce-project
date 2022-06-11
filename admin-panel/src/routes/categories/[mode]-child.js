import { db } from '$lib/database/db'
import { sql } from 'kysely'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {

  // All categories path (for changing current parent)
  const categories = await db.withRecursive('categories_cte', db => 
    db.selectFrom('categories')
      .where('categories.parent_id', 'is', null)
      .select(['categories.category_id', 'categories.name as path'])
      .unionAll(
        db.selectFrom('categories_cte')
          .innerJoin('categories', 'categories.parent_id', 'categories_cte.category_id')
          .select(['categories.category_id', sql`CONCAT(categories_cte.path, ' > ', categories.name)`]))
    ).selectFrom('categories_cte').selectAll().orderBy('path').execute()

  // Current path..
  const parent_id = url.searchParams.get('parent_id')
  const parent = categories.filter(category => category.category_id == parent_id)[0]

  return { body: { parent, categories }}
}