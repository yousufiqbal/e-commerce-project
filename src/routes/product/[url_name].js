import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ params }) => {

  const product = await db.selectFrom('products')
    .select(['products.product_id', 'products.name', 'products.url_name', 'products.price', 'products.description', 'products.stock', 'products.fair_quantity'])
    .where('products.url_name', '=', params.url_name)
    .executeTakeFirst()

  return {
    body: { product }
  }
}