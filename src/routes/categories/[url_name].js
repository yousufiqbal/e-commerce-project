import { db } from '$lib/database/db'
import { sql } from 'kysely'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ params, url }) => {

  // get category_id
  const parent = await db.selectFrom('categories')
    .where('categories.url_name', '=', params.url_name)
    .select('categories.category_id')
    .executeTakeFirst()

  // Fetch sub-categories to display in pills
  const subcategories = await db.selectFrom('categories')
    .where('categories.parent_id', '=', parent.category_id)
    .select(['categories.name', 'categories.url_name'])
    .execute()

  // Current chosen category (parent or child)
  const { category_id } = await db.selectFrom('categories')
    .where('categories.url_name', '=', url.searchParams.get('type') || params.url_name)
    .selectAll()
    .executeTakeFirst()

  const products = await db.selectFrom('products')
    .leftJoin('stocks', 'stocks.product_id', 'products.product_id')
    .select(['products.product_id', 'products.name', 'products.fair_quantity', 'products.url_name', 'products.price', 'products.description', sql`SUM(stocks.quantity_remaining)`.as('stock')]) 
    .groupBy('products.product_id')
    .where('products.category_id', '=', category_id)
    .execute()

    console.log(products.map(product => product.stock))

  return {
    body: { subcategories: [{ name: 'All', url_name: 'all' }, ...subcategories], products }
  }
}