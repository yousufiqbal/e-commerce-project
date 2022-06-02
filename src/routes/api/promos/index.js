import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request, locals }) => {

  const { code } = await request.json()

  const promo = await db.selectFrom('promos')
    .selectAll()
    .where('promos.code', '=', code)
    .where('promos.user_id', '=', locals.user_id)
    .executeTakeFirst()

  if (!promo) return {
    status: 401, body: { message: 'Invalid promo code' }
  }

  await db.updateTable('users').set({
    applied_promo_id: promo.promo_id
  }).where('users.user_id', '=', locals.user_id)
  .execute()

  return {
    status: 201, body: { message: 'Promo added!' }
  }

}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const del = async ({ locals }) => {
  await db.updateTable('users')
    .where('users.user_id', '=', locals.user_id)
    .set({ applied_promo_id: null})
    .execute()
  return { status: 200, body: { message: 'Promo removed.'}}
}