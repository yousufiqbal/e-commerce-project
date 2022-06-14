import { db } from '$lib/database/db'
import fs from 'fs'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {
  const product_id = url.searchParams.get('product_id')
  const product = await db.selectFrom('products')
    .select(['products.name', 'products.url_name'])
    .where('products.product_id', '=', product_id).executeTakeFirst()

  return { body: { product }}
}