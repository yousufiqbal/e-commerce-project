import { db } from '$lib/database/db'
import dayjs from 'dayjs'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ locals }) => {

  const format = 'MMM DD, YYYY'

  const messages = await db
    .selectFrom('messages')
    .where('messages.user_id', '=', locals.user_id)
    .orderBy('messages.created', 'desc')
    .selectAll().execute()

  const dates = messages.map(message => dayjs(message.created).format(format))
  const uniqueDates = [...new Set(dates)]
  
  let data = []
  
  uniqueDates.forEach(date => {
    data.push({
      title: date, messages: messages.filter(message => date == dayjs(message.created).format(format))
    })
  })

  const today = dayjs().format(format)
  const yesterday = dayjs().subtract(1, 'day').format(format)

  data.forEach(el => {
    if (el.title == today) el.title = 'Today'
    if (el.title == yesterday) el.title = 'Yesterday'
  })

  return { body: { messages: data }}

}