import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async () => {
  const constants = await db.selectFrom('constants')
    .selectAll().execute()
  return { body: { constants }}
}