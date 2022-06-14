import { db } from '$lib/database/db'
import { sql } from 'kysely'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async () => {
  `SELECT orders.order_id, orders.payment_method, orders.created,
  SUM(order_details.quantity) items, SUM(order_details.quantity * order_details.price) total_amount,
  (SUM(order_details.quantity * order_details.price) - SUM(order_details.quantity * order_details.unit_cost))
  AS profit
  FROM orders
  LEFT JOIN order_details USING (order_id)
  GROUP BY orders.order_id`
  const { sum } = db.fn
  const orders = await db.selectFrom('orders')
    .leftJoin('order_details', 'order_details.order_id', 'orders.order_id')
    .groupBy('orders.order_id')
    .select(['orders.order_id', 'orders.payment_method', 'orders.created', sql`SUM(order_details.quantity) items, SUM(order_details.quantity * order_details.price) total_amount,
    (SUM(order_details.quantity * order_details.price) - SUM(order_details.quantity * order_details.unit_cost)) as profit`])
    .execute()
    console.log(orders)
  return { body: { orders }}
}