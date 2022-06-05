import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {
  
  const page = 1, limit = 20
  const keyword = url.searchParams.get('keyword') || ''

  if (!keyword) return { body: { results: [] }}
  
  const results = await db.selectFrom('products')
    .where('products.name', 'like', `%${keyword}%`)
    .select(['products.name', 'products.product_id', 'products.stock', 'products.url_name', 'products.price', 'products.fair_quantity'])
    .limit(limit).offset((page - 1) * limit)
    .execute()

  return { body: { results } }
}