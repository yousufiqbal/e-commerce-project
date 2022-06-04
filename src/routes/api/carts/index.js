import { db } from '$lib/database/db'
import { internalError } from '$lib/others/utils'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ locals }) => {

  // User or Guest
  let table
  if (locals.guest_id) table = 'guest_cart_items'
  if (locals.user_id) table = 'cart_items'

  const cartItems = await db.selectFrom(table)
    .where(`${table}.user_id`, '=', locals.user_id || locals.guest_id)
    .leftJoin('products', 'products.product_id', `${table}.product_id`)
    .select(['products.product_id', 'products.name',  'products.url_name', `${table}.quantity`, 'products.price'])
    .orderBy('products.name', 'asc')
    .execute()

  return { body: cartItems }

}

// Adding new item..
/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ url, locals }) => {

  try {

    // User or Guest
    let table
    if (locals.guest_id) table = 'guest_cart_items'
    if (locals.user_id) table = 'cart_items'

    // TODO many validations remaining..
    const product_id = url.searchParams.get('product_id')
    const product = await db.selectFrom('products')
      .where('products.product_id', '=', product_id)
      .selectAll().executeTakeFirst()
    await db.insertInto(table).values({
      user_id: locals.user_id || locals.guest_id,
      product_id: product.product_id,
      quantity: 1
    }).execute()
    return { status: 201, body: { message: 'Item added' }}
  } catch (error) {
    return internalError(error)
  }
}

// Adding previous item..
/** @type {import('@sveltejs/kit').RequestHandler} */
export const put = async ({ url, locals }) => {
  try {

    // User or Guest
    let table
    if (locals.guest_id) table = 'guest_cart_items'
    if (locals.user_id) table = 'cart_items'

    // TODO many validations remaining..
    const product_id = url.searchParams.get('product_id')

    const cartItem = await db.selectFrom(table)
      .where(`${table}.user_id`, '=', locals.user_id || locals.guest_id)
      .where(`${table}.product_id`, '=', product_id)
      .select([`${table}.quantity`])
      .executeTakeFirst();

    await db.updateTable(table)
      .where(`${table}.product_id`, '=', product_id)
      .where(`${table}.user_id`, '=', locals.user_id || locals.guest_id)
      .set({ 'quantity': +cartItem.quantity + 1 })
      .execute()
    return { status: 201, body: { message: 'Item updated' }}
  } catch (error) {
    return internalError(error)
  }
}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const del = async ({ url, locals }) => {

  try {

    // User or Guest
    let table
    if (locals.guest_id) table = 'guest_cart_items'
    if (locals.user_id) table = 'cart_items'

    const product_id = url.searchParams.get('product_id')
    const cartItem = await db.selectFrom(table)
      .where(`${table}.user_id`, '=', locals.user_id || locals.guest_id)
      .where(`${table}.product_id`, '=', product_id)
      .selectAll().executeTakeFirst()

    if (cartItem.quantity >= 2) {
      await db.updateTable(table)
        .where(`${table}.product_id`, '=', product_id)
        .where(`${table}.user_id`, '=', locals.user_id || locals.guest_id)
        .set({ quantity: cartItem.quantity - 1}).execute()
    } else {
      await db.deleteFrom(table)
        .where(`${table}.user_id`, '=', locals.user_id || locals.guest_id)
        .where(`${table}.product_id`, '=', product_id)
        .execute()
    }

    return { body: { message: 'Item Decreased / Removed' }}

  } catch (error) {
    return internalError(error)
  }
}