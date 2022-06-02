import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ locals }) => {
  
  const user = await db.selectFrom('users')
    .select('users.applied_promo_id')
    .where('users.user_id', '=', locals.user_id)
    .executeTakeFirst()
    
  if (user.applied_promo_id) {
    const promo = await db.selectFrom('promos')
      .selectAll()
      .where('promos.promo_id', '=', user.applied_promo_id)
      .where('promos.user_id', '=', locals.user_id).executeTakeFirst()
    return { body: { promo }}
  } 

  return {
    body: { promo: { code: '' } }
  }

}