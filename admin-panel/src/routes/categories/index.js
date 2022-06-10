import { db } from '$lib/database/db'
import { sql } from 'kysely'


/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async () => {

  const result = await db.withRecursive('counts', db => 
    db
      .selectFrom('categories')
      .select(['categories.category_id', 'categories.name as parent', 'categories.name', 'categories.name as path', 'categories.url_name'])
      .where('categories.parent_id', 'is', null)
      .unionAll(
        db.selectFrom('categories')
          .innerJoin('counts', 'counts.category_id', 'categories.parent_id')
          .select(['categories.category_id', 'counts.parent', 'categories.name', sql`CONCAT(counts.path, ' &rarr; ', categories.name)`.as('path'), 'counts.url_name'])
      )
  )
  
  // Use
  .selectFrom('counts').orderBy('counts.path').selectAll().execute()

  const parents = [...new Set(result.map(category => ({name: category.parent, category_id: category.category_id})))]
  let data = []
  for (const parent of parents) {
    data.push({
      parent: parent.name,
      category_id: parent.category_id,
      children: result.filter(category => category.parent == parent.name && category.name != parent.name)
    })
  }

  return { body: { categories: data }}
}