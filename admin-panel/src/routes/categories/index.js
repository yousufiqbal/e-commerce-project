import { db } from '$lib/database/db'
import { sql } from 'kysely'

`WITH recursive categories_cte AS (

	SELECT categories.category_id, categories.name, categories.url_name, categories.name AS path, categories.parent_id
	FROM categories
	WHERE categories.parent_id IS NULL
	
	UNION ALL 
	
	SELECT categories.category_id, categories.name, categories.url_name, CONCAT(categories_cte.path, ' > ', categories.name), categories.parent_id
	FROM categories_cte
	INNER JOIN categories ON categories.parent_id = categories_cte.category_id
	
)

SELECT *
FROM categories_cte`


/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async () => {

  const categories = await db.withRecursive('categories_cte', db => 
    db.selectFrom('categories')
      .where('categories.parent_id', 'is', null)
      .select(['categories.category_id', 'categories.name', 'categories.url_name', 'categories.name as path', 'categories.parent_id', 'categories.category_id as root_id'])
      .unionAll(
        db.selectFrom('categories_cte')
          .innerJoin('categories', 'categories.parent_id', 'categories_cte.category_id')
          .select(['categories.category_id', 'categories.name', 'categories.url_name', sql`CONCAT(categories_cte.path, ' > ', categories.name)`, 'categories.parent_id', 'categories_cte.root_id']))
    ).selectFrom('categories_cte').selectAll().orderBy('path').execute()

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