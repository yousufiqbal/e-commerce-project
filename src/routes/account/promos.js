import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ locals }) => {

  const promos = await db
    .selectFrom('promos')
    .where('promos.user_id', '=', locals.user_id)
    .orderBy('promos.created', 'desc')
    .selectAll().execute()

  return { body: { promos }}
  
}

