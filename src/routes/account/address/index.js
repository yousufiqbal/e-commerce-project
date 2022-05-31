import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async () => {
  const addresses = await db.selectFrom('addresses').selectAll().execute()
  return { body: { addresses }}
}

