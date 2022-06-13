import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {
  const page = url.searchParams.get('page') || 1
  const limit = url.searchParams.get('limit') || 20
  const products = await db.selectFrom('products')
    .limit(limit).offset((page - 1) * limit)
    .selectAll().execute()
  const { count } = db.fn
  const { total } = await db.selectFrom('products').select([count('products.product_id').as('total')]).executeTakeFirst()
  return { body: { products, total }}
}