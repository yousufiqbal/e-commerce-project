import { db } from '$lib/database/db'
import { beautifyDate, getRandomCode, internalError } from '$lib/others/utils'
import dayjs from 'dayjs'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request, locals }) => {

  const { address_id, payment_method } = await request.json()
  
  const address = await db.selectFrom('addresses')
    .select(['addresses.label', 'addresses.address', 'addresses.city'])
    .where('addresses.address_id', '=', address_id)
    .where('addresses.user_id', '=', locals.user_id)
    .executeTakeFirst()

  const completeAddress = address.address + ' - ' + address.city

  const user = await db.selectFrom('users').select('users.applied_promo_id')
    .where('users.user_id', '=', locals.user_id)
    .executeTakeFirst()

  // TODO Check promo validity.. product, stock, price, cost.. etc..
  let freePromo

  // TODO transaction..
  try {
    let order_id
    await db.transaction().execute(async trx => {

      const orders = await trx.selectFrom('orders')
        .where('orders.user_id', '=', locals.user_id)
        .selectAll().execute()
      
      if (orders.length == 0) {
        freePromo = true
        let code = getRandomCode(5).toUpperCase()
        // TODO check if this code already exist..
        await trx.insertInto('promos').values({
          code, max_discount: 100, percentage: 10, user_id: locals.user_id, status: 'available',
          validity: dayjs().add(30, 'days').format('YYYY-MM-DD HH:mm:ss')
        }).execute()
      }
    
      // Add order
      const { insertId } = await trx.insertInto('orders').values({
        address: completeAddress,
        payment_method,
        promo_id: user.applied_promo_id || null,
        user_id: locals.user_id
      }).executeTakeFirstOrThrow()
  
      order_id = Number(insertId)
  
      // Shifting cart_items to order_details (requires products table join)
      const cartItems = await trx.selectFrom('cart_items')
        .leftJoin('products', 'products.product_id', 'cart_items.product_id')
        .where('cart_items.user_id', '=', locals.user_id)
        .select(['cart_items.product_id', 'cart_items.quantity', 'products.unit_cost', 'products.price'])
        .execute()
  
      const details = []
  
      cartItems.forEach(item => {
        details.push({...item, order_id})
      })
  
      await trx.insertInto('order_details').values(details).execute()
  
      // Removing applied_promo_id..
      if (user.applied_promo_id) {
        await trx.updateTable('users')
          .where('users.user_id', '=', locals.user_id)
          .set({ applied_promo_id: null }).execute()
        }

      // Clearing cart..
      await trx.deleteFrom('cart_items')
        .where('cart_items.user_id', '=', locals.user_id)
        .execute()

      // Set order status to confirmed
      await trx.insertInto('order_statuses').values({
        order_id,
        status: 'confirmed',
      }).execute()

      // Send messsage
      await trx.insertInto('messages')
        .values({
          message: 'You order: ' + order_id + ' has been placed. You will (in-sha-Allah) receive it by ' + beautifyDate(dayjs().add(5, 'days')),
          type: 'order',
          user_id: locals.user_id
        }).execute()
  
      // TODO if promo used, comsume it.
    })

    return { status: 201, body: { message: order_id, freePromo } }
  } catch (error) {
    return internalError(error)
    
  }

 

}