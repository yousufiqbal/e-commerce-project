import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ locals }) => {

  const orders = await db.selectFrom('orders')
    .selectAll()
    .where('orders.user_id', '=', locals.user_id)
    .orderBy('orders.created', 'desc')
    .execute()

  return { body: { orders }}
}