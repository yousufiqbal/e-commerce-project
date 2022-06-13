import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {
  const product_id = url.searchParams.get('product_id')
  const product = await db.selectFrom('products')
    .select(['products.name'])
    .where('products.product_id', '=', product_id).executeTakeFirst() 
  return { body: { product }}
}