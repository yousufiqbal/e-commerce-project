import { db } from '$lib/database/db'
import { internalError } from '$lib/others/utils'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async () => {

  const cartItems = await db.selectFrom('cart_items')
    .leftJoin('products', 'products.product_id', 'cart_items.product_id')
    .select(['products.product_id', 'products.name',  'products.url_name', 'cart_items.quantity', 'products.price'])
    .execute()

  return { body: cartItems }

}

// Adding new item..
/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ url, session }) => {
  try {
    // TODO many validations remaining..
    const product_id = url.searchParams.get('product_id')
    const product = await db.selectFrom('products').where('products.product_id', '=', product_id)
      .selectAll().executeTakeFirst()
    await db.insertInto('cart_items').values({
      user_id: session.user_id,
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
export const put = async ({ url }) => {
  try {
    // TODO many validations remaining..
    const product_id = url.searchParams.get('product_id')
    const cartItem = await db.selectFrom('cart_items')
    .where('cart_items.product_id', '=', product_id)
      .select(['cart_items.quantity'])
      .executeTakeFirst();
    await db.updateTable('cart_items')
      .where('cart_items.product_id', '=', product_id)
      .set({
        'quantity': +cartItem.quantity + 1
      })
      .execute()
    return { status: 201, body: { message: 'Item updated' }}
  } catch (error) {
    return internalError(error)
  }
}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const del = async ({ url }) => {

  try {

    const product_id = url.searchParams.get('product_id')
    const cartItem = await db.selectFrom('cart_items').where('cart_items.product_id', '=', product_id)
      .selectAll().executeTakeFirst()

    if (cartItem.quantity >= 2) {
      await db.updateTable('cart_items').where('cart_items.product_id', '=', product_id)
        .set({ quantity: cartItem.quantity - 1}).execute()
    } else {
      await db.deleteFrom('cart_items').where('cart_items.product_id', '=', product_id)
        .execute()
    }

    return { body: { message: 'Item Decreased / Removed' }}

  } catch (error) {
    return internalError(error)
  }
}