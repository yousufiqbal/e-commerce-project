import { db } from '$lib/database/db'

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

  // TODO transaction..

    await db.transaction().execute(async trx => {
    
      // Add order
      const { insertId } = await trx.insertInto('orders').values({
        address: completeAddress,
        payment_method,
        promo_id: user.applied_promo_id,
        user_id: locals.user_id
      }).executeTakeFirstOrThrow()
  
      const order_id = Number(insertId)
  
      // Shifting cart_items to order_details (requires products table)
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

      // Removing cart_items and applied_promo_code 
      await db.updateTable('users').where('users.user_id', '=', locals.user_id)
      .set({ applied_promo_id: null }).execute()
      await db.deleteFrom('cart_items').where('cart_items.user_id', '=', locals.user_id).execute()
  
    })
 
  return { status: 201, body: { message: order_id } }

}