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
          .select(['categories.category_id', 'categories.name', sql`CONCAT(categories_cte.path, ' > ', categories.name)`]))
    ).selectFrom('categories_cte').selectAll().orderBy('path').execute()

  // Current path..
  if (params.mode == 'add') {
    const parent_id = url.searchParams.get('parent_id')
    const parent = categories.filter(category => category.category_id == parent_id)[0]
    return { body: { parent, categories }}
  }

  // View..
  // export let parent = {}
  // export let child = {
  //   parent_path: parent.path,
  //   parent_id: parent.category_id,
  //   name: ''
  // }

  // return {}

  // Current path..
  if (params.mode == 'edit') {
    const parent_id = url.searchParams.get('parent_id')
    const parent = categories.filter(category => category.category_id == parent_id)[0]
    const child_id = url.searchParams.get('child_id')
    const child = categories.filter(category => category.category_id == child_id)[0]
    child.parent_path = parent.path
    child.parent_id =  parent.category_id
    return { body: { categories, child }}
  }

}