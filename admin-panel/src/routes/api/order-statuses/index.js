import { db } from '$lib/database/db'
import { internalError } from '$lib/others/utils'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request, url }) => {

  const map = {
    'confirm': 'confirmed',
    'dispatch': 'dispatched',
    'receive': 'received',
    'cancel': 'cancelled',
  }

  // TODO validate that order is not previously set to current status..
  try {
    const order_id = url.searchParams.get('order_id')
    const { status } = await request.json()
    await db.insertInto('order_statuses')
      .values({
        status: map[status],
        order_id
      }).execute()
    return { body: { message: `Order ${map[status]}`}}
  } catch (error) {
    return internalError(error)
  }
}