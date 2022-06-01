import { db } from '$lib/database/db'
import dayjs from 'dayjs'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const put = async ({ locals }) => {
  // messages have been read
  await db.updateTable('users')
    .where('users.user_id', '=', locals.user_id)
    .set({ last_messages_read: dayjs().format('YYYY-MM-DD HH:mm:ss')})
    .execute()
}