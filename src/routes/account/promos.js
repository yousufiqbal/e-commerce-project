import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ locals, url }) => {

  const status = url.searchParams.get('status') || 'available'

  let counts = { available: 0, consumed: 0, expired: 0 }

  const allPromos = await db
    .selectFrom('promos')
    .selectAll()
    .where('promos.user_id', '=', locals.user_id)
    .execute()

  for (const promo of allPromos) counts[promo.status]++

  const promos = await db
    .selectFrom('promos')
    .where('promos.user_id', '=', locals.user_id)
    .where('promos.status', '=', status)
    .orderBy('promos.created', 'desc')
    .selectAll().execute()

  return { body: { promos, counts }}
  
}

