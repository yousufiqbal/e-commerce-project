import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ params, locals }) => {

  const order_id = params.number

  const order = await db.selectFrom('orders')
    .selectAll()
    .where('orders.order_id', '=', order_id)
    .where('orders.user_id', '=', locals.user_id)
    .executeTakeFirst()

  const promo = await db.selectFrom('promos')
    .selectAll()
    .where('promo_id', '=', order.promo_id)
    .executeTakeFirst()

  const statuses = await db.selectFrom('order_statuses')
    .selectAll()
    .where('order_statuses.order_id', '=', order_id)
    .execute()

  const items = await db.selectFrom('order_details')
    .leftJoin('products', 'products.product_id', 'order_details.product_id')
    .where('order_details.order_id', '=', order_id)
    .select(['order_details.product_id', 'order_details.quantity', 'order_details.price', 'products.name', 'products.url_name']).execute()

    console.log(items)

  return { body: { order, promo, statuses, items }}
  
}