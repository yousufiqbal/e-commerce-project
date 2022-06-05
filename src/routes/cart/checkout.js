import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ locals }) => {

  if (!locals.user_id) {
    return { status: 301, headers: { Location : '/user/login?next=/cart/checkout' } }
  }

  const address = await db.selectFrom('addresses')
    .selectAll()
    .where('addresses.user_id', '=', locals.user_id)
    .where('addresses.default', '=', '1')
    .executeTakeFirst()

    
    const user = await db.selectFrom('users')
    .select('users.applied_promo_id')
    .where('users.user_id', '=', locals.user_id)
    .executeTakeFirst()
    
    if (user.applied_promo_id) {
    const promo = await db.selectFrom('promos')
      .selectAll()
      .where('promos.promo_id', '=', user.applied_promo_id)
      .where('promos.user_id', '=', locals.user_id).executeTakeFirst()
      return { body: { promo, address }}
    } 
    
  return {
    body: { promo: { code: '' }, address }
  }

}