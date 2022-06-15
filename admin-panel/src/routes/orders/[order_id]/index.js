import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ params }) => {

  console.log('came2me')

  const order_id = params.order_id

  // Getting order..
  const order = await db.selectFrom('orders')
    .where('orders.order_id', '=', order_id)
    .selectAll().executeTakeFirst()
    
  // Getting order details..
  const order_details = await db.selectFrom('order_details')
    .where('order_details.order_id', '=', order_id)
    .leftJoin('products', 'products.product_id', 'order_details.product_id')
    .selectAll().execute()
    
  // Getting order statuses..
  const statuses = await db.selectFrom('order_statuses')
    .where('order_statuses.order_id', '=', order_id)
    .orderBy('order_statuses.created', 'desc')
    .selectAll().execute()

  return { body: { order, order_details, statuses }}

}