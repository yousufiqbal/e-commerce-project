import { db } from '$lib/database/db'
import dayjs from 'dayjs'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const put = async ({ locals, url }) => {

  const type = url.searchParams.get('type')

  const o = {
    'messages': 'last_messages_read',
    'orders': 'last_orders_read',
    'promos': 'last_promos_read',
    'wallets': 'last_wallets_read',
  }

  await db.updateTable('users')
    .where('users.user_id', '=', locals.user_id)
    .set({ [o[type]]: dayjs().format('YYYY-MM-DD HH:mm:ss')})
    .execute()

  return { status: 200 }
}