import { db } from '$lib/database/db'
import dayjs from 'dayjs'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request, locals }) => {
  
  // Checking fair usage..
  const trials = await db.selectFrom('trials').selectAll()
    .where('trials.user_id', '=', locals.user_id)
    .where('trials.created', '>=', dayjs().subtract(30, 'minutes').format('YYYY-MM-DD HH:mm'))
    .execute()

  // Add trial
  await db.insertInto('trials').values({
    for: 'promo',
    user_id: locals.user_id
  }).execute()

  if (trials.length >= 3) {
    return {
      status: 401, body: { message: 'Too many trials. Checkback later' }
    }
  }

  const { code } = await request.json()

  const promo = await db.selectFrom('promos')
    .selectAll()
    .where('promos.code', '=', code)
    .where('promos.user_id', '=', locals.user_id)
    .where('promos.status', '=', 'available')
    .executeTakeFirst()

  if (!promo) return {
    status: 401, body: { message: 'Invalid promo code' }
  }

  await db.updateTable('users').set({
    applied_promo_id: promo.promo_id
  }).where('users.user_id', '=', locals.user_id).execute()

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