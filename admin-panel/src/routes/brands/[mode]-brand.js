import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ params, url }) => {
  if (params.mode == 'edit') {
    const brand_id = url.searchParams.get('brand_id')
    const brand = await db.selectFrom('brands')
      .where('brands.brand_id', '=', brand_id)
      .selectAll().executeTakeFirst()
    return { body: { brand } }
  }
  return {}
}