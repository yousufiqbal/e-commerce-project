import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {

  const keyword = url.searchParams.get('keyword')
  if (!keyword) return { status: 200, body: [] }
  
  const suggestions = await db.selectFrom('products')
    .where('products.name', 'like', `%${keyword}%`)
    .selectAll()
    .limit(5)
    .execute()

  return { body: suggestions }

}