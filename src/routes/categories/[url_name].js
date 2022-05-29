import { db } from '$lib/database/db'
import { sql } from 'kysely'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ params, url }) => {

  // Get subcategories
  const subcategories = await db
    .selectFrom('categories as c1')
    .leftJoin('categories as c2', 'c1.parent_id', 'c2.category_id')
    .where('c2.url_name', '=', params.url_name)
    .select(['c1.category_id', 'c1.name', 'c1.url_name'])
    .execute()

  let categories = []
    
  // If no type or type == 'all'.. get this parent and children category IDs in an array
  if (!url.searchParams.get('type') || url.searchParams.get('type') == 'all') {

    // Get parent category_id
    const parent = await db.selectFrom('categories')
      .select('categories.category_id')
      .where('categories.url_name', '=', params.url_name).executeTakeFirst()

      console.log(params)

    categories.push(parent.category_id)

    // Get children_id
    const children = await db.selectFrom('categories')
      .select(['categories.category_id'])
      .where('categories.parent_id', '=', parent.category_id).execute()

    categories.push(...children.map(category => category.category_id))

  } else {

    // If type != 'all' get particular category in an array
    const category = await db.selectFrom('categories')
      .where('categories.url_name', '=', url.searchParams.get('type'))
      .select('categories.category_id')
      .executeTakeFirst()

    categories.push(category.category_id)

  }

  // Get products for chosen category / subcategory
  const products = await db.selectFrom('products')
    .select(['products.product_id', 'products.name', 'products.url_name', 'products.price', 'products.description', 'products.stock', 'products.fair_quantity']) 
    .where('products.category_id', 'in', categories)
    .execute()

  return {
    body: { subcategories: [{ name: 'All', url_name: 'all' }, ...subcategories], products }
  }
}