import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ locals }) => {
  console.log('child load')
  const messages = await db
    .selectFrom('messages')
    .where('messages.user_id', '=', locals.user_id)
    .orderBy('messages.created', 'desc')
    .selectAll().execute()
  return { body: { messages }}
}

