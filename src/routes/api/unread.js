import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ locals }) => {

  const last = await db.selectFrom('users')
    .select(['users.last_messages_read', 'users.last_orders_read', 'users.last_promos_read', 'users.last_wallet_read'])
    .where('users.user_id', '=', locals.user_id)
    .executeTakeFirst()
    
    const { count } = db.fn

    const { totalMessages } = await db.selectFrom('messages')
    .select([count('messages.message_id').as('totalMessages')])
    .where('messages.user_id', '=', locals.user_id)
    .where('messages.created', '>', last.last_messages_read)
    .executeTakeFirst()
    
    const { totalPromos } = await db.selectFrom('promos')
    .select([count('promos.promo_id').as('totalPromos')])
    .where('promos.user_id', '=', locals.user_id)
    .where('promos.created', '>', last.last_promos_read)
    .executeTakeFirst()
    
    const { totalOrders } = await db.selectFrom('orders')
    .select([count('orders.order_id').as('totalOrders')])
    .where('orders.user_id', '=', locals.user_id)
    .where('orders.created', '>', last.last_orders_read)
    .executeTakeFirst()
    
    const { totalWallets } = await db.selectFrom('wallets')
    .select([count('wallets.wallet_id').as('totalWallets')])
    .where('wallets.user_id', '=', locals.user_id)
    .where('wallets.created', '>', last.last_wallet_read)
    .executeTakeFirst()

  return { body: { totalMessages, totalOrders, totalPromos, totalWallets }}

}