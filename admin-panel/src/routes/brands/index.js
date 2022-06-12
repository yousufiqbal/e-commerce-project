import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async () => {
  const brands = await db.selectFrom('brands')
    .selectAll().orderBy('brands.name').execute()
  return { body: { brands }}
}