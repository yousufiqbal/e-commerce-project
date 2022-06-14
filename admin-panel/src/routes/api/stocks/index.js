import { db } from '$lib/database/db'
import { stockSchema } from '$lib/others/schema'
import { internalError } from '$lib/others/utils'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request, url }) => {
  try {
    const body = await request.json()
    const newStock = await stockSchema.validate(body, { abortEarly: false })
    // Getting average cost..
    const product_id = url.searchParams.get('product_id')
    const product = await db.selectFrom('products')
      .where('products.product_id', '=', product_id).selectAll().executeTakeFirst()
    const averageCost = Math.ceil(((newStock.stock * newStock.unit_cost) + (product.stock * product.unit_cost)) / (+newStock.stock + +product.stock)
    )
    // Adding..
    await db.updateTable('products').where('products.product_id', '=', product_id)
      .set({
        price: newStock.price,
        stock: +product.stock + +newStock.stock,
        unit_cost: averageCost,
      }).execute()
    return { body: { message: 'Stock added' }}
  } catch (error) {
    return internalError(error)
  }
}