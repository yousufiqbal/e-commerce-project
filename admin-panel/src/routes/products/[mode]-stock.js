import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {

  const product_id = url.searchParams.get('product_id') || null

  // Getting product if ID given as query param..
  const product = product_id ? await db.selectFrom('products').selectAll()
    .where('products.product_id', '=', product_id).executeTakeFirst() : {}

  // Constants
  const constantsRaw = await db.selectFrom('constants').selectAll().execute()
  let constants = {}
  for (const constant of constantsRaw) {
    constants[constant.name] = constant.value
  }

  return { body: { constants, product }}

}