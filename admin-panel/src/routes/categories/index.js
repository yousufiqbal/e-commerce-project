import { db } from '$lib/database/db'
import { sql } from 'kysely'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {

  const sort = url.searchParams.get('sort') || 'alphabetically'
  const categories = await db.withRecursive('categories_cte', db => 
    db.selectFrom('categories')
      .where('categories.parent_id', 'is', null)
      .select(['categories.category_id', 'categories.name', 'categories.url_name', 'categories.name as path', 'categories.parent_id', 'categories.category_id as root_id', 'categories.created'])
      .unionAll(
        db.selectFrom('categories_cte')
          .innerJoin('categories', 'categories.parent_id', 'categories_cte.category_id')
          .select(['categories.category_id', 'categories.name', 'categories.url_name', sql`CONCAT(categories_cte.path, ' &nbsp; &rarr; &nbsp; ', categories.name)`, 'categories.parent_id', 'categories_cte.root_id', 'categories.created']))
    ).selectFrom('categories_cte').selectAll()
    .if(sort == 'alphabetically', qb => qb.orderBy('path'))
    .if(sort == 'date-ascending', qb => qb.orderBy('created', 'asc'))
    .if(sort == 'date-descending', qb => qb.orderBy('created', 'desc'))
    .execute()

    const roots = categories.filter(category => category.parent_id == null)
    let data = []

    for (const root of roots) {
      data.push({
        name: root.name,
        parent_id: root.category_id,
        children: categories.filter(category => category.root_id == root.category_id && category.parent_id != null)
      })
    }

    return { body: { categories: data }}
  
}