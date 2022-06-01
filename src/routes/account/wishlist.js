import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ locals }) => {
  const wishlist = await db
    .selectFrom('wishlists')
    .innerJoin('products', 'products.product_id', 'wishlists.product_id')
    .where('wishlists.user_id', '=', locals.user_id)
    .orderBy('wishlists.created', 'desc')
    .select(['products.product_id', 'products.name', 'products.url_name', 'products.price', 'products.stock', 'products.fair_quantity', 'wishlists.wishlist_id'])
    .execute()

  return { body: { wishlist }}
}

