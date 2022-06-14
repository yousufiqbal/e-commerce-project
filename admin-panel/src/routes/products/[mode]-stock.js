import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async () => {

  // Products
  const products = await db.selectFrom('products')
    .select(['products.product_id','products.name', 'products.sku'])
    .orderBy('products.name', 'asc').execute()
  
  // Constants
  const constantsRaw = await db.selectFrom('constants').selectAll().execute()
  let constants = {}
  for (const constant of constantsRaw) {
    constants[constant.name] = constant.value
  }

  return { body: { products, constants }}

}