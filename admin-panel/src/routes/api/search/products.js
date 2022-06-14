import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {
  let keyword = url.searchParams.get('keyword') || null
  if (!keyword) return { body: [] }
  const products = await db.selectFrom('products')
    .selectAll()
    .where('products.name', 'like', `%${keyword}%`)
    .limit(10).execute()
  return { body: products }
}