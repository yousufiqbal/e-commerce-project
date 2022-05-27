import { db } from '$lib/database/db'
import { sql } from 'kysely'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ params }) => {

  console.log(params.url_name)

  const product = await db.selectFrom('products')
    .leftJoin('stocks', 'stocks.product_id', 'products.product_id')
    .select(['products.name', 'products.url_name', 'products.price', 'products.description', sql`SUM(stocks.quantity_remaining)`.as('stock')])
    .where('products.url_name', '=', params.url_name)
    .executeTakeFirst()

  return {
    body: { product }
  }
}