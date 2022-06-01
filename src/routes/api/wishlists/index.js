import { db } from '$lib/database/db'
import { internalError } from '$lib/others/utils'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ url, locals }) => {

  try {
    const product_id = url.searchParams.get('product_id')
    await db.insertInto('wishlists').values({
      product_id, user_id: locals.user_id
    }).execute()
    return { status: 201, body: { message: 'Added to wishlist' }}
  } catch (error) {
    return internalError(error)
  }
}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const del = async ({ url, locals }) => {

  try {
    const product_id = url.searchParams.get('product_id')
    await db.deleteFrom('wishlists')
      .where('wishlists.product_id', '=', product_id)
      .where('wishlists.user_id', '=', locals.user_id)
      .execute()
    return { status: 201, body: { message: 'Removed from wishlist' }}
  } catch (error) {
    return internalError(error)
  }
}