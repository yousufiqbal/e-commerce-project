import { db } from '$lib/database/db'
import { sql } from 'kysely'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {

  const type = url.searchParams.get('type') || 'ordered'

  const { max } = db.fn

   const orders = await db.with('last_statuses', db => 
    db.selectFrom('order_statuses')
      .selectAll()
      .where('order_statuses.order_status_id', 'in', qb => 
        qb.selectFrom('order_statuses')
          .select(max('order_statuses.order_status_id'))
          .groupBy('order_statuses.order_id')))
      
    .selectFrom('orders')
    .leftJoin('order_details', 'order_details.order_id', 'orders.order_id')
    .leftJoin('users', 'users.user_id', 'orders.user_id')
    .leftJoin('last_statuses', 'last_statuses.order_id', 'orders.order_id')
    .if(type, qb => qb.where('last_statuses.status', '=', type))
    .groupBy('orders.order_id').orderBy('orders.created', 'desc')
    .select(['orders.order_id', 'orders.payment_method', 'orders.created', sql`SUM(order_details.quantity) items, SUM(order_details.quantity * order_details.price) total_amount,
    (SUM(order_details.quantity * order_details.price) - SUM(order_details.quantity * order_details.unit_cost)) as profit`, 'users.name'])
    .execute()

  return { body: { orders }}

}