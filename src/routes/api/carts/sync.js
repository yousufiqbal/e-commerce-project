import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request, locals }) => {

  // User or Guest
  let table
  if (locals.guest_id) table = 'guest_cart_items'
  if (locals.user_id) table = 'cart_items'

  const body = await request.json()

  let data = []

  body.forEach(item => {
    data.push({
      user_id: locals.user_id,
      product_id: item.product_id,
      quantity: item.quantity,
    })
  })

  // !!! TODO !!! VERIFY THIS CART !!!

  await db.transaction().execute(async trx => {

    await trx.deleteFrom(table)
      .where(`${table}.user_id`, '=', locals.user_id)
      .execute()
      
    await trx.insertInto(table)
      .values(data).execute()

  })

  const cartItems = await db.selectFrom(table)
    .where(`${table}.user_id`, '=', locals.user_id || locals.guest_id)
    .leftJoin('products', 'products.product_id', `${table}.product_id`)
    .select(['products.product_id', 'products.name',  'products.url_name', `${table}.quantity`, 'products.price'])
    .execute()

  return { body: cartItems }
  
}