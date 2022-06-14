import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async () => {

  // Temp
  const product = await db.selectFrom('products').selectAll()
    .where('products.product_id', '=', 27).executeTakeFirst()

  // Constants
  const constantsRaw = await db.selectFrom('constants').selectAll().execute()
  let constants = {}
  for (const constant of constantsRaw) {
    constants[constant.name] = constant.value
  }

  return { body: { constants, product }}

}