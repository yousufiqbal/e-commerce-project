import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ locals }) => {

  const wallets = await db
    .selectFrom('wallets')
    .where('wallets.user_id', '=', locals.user_id)
    .orderBy('wallets.created', 'desc')
    .selectAll().execute()

  let inside = wallets.map(wallet => wallet.in).reduce((a, b) => +a + +b, 0)
  let outside = wallets.map(wallet => wallet.out).reduce((a, b) => +a + +b, 0)
  let total = inside - outside

  return { body: { wallets, total }}

}

