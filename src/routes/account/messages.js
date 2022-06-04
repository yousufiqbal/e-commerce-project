import { db } from '$lib/database/db'
import dayjs from 'dayjs'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ locals }) => {

  const messages = await db
    .selectFrom('messages')
    .where('messages.user_id', '=', locals.user_id)
    .orderBy('messages.created', 'desc')
    .selectAll().execute()

  const dates = messages.map(message => dayjs(message.created).format('YYYY-MM-DD'))
  const uniqueDates = [...new Set(dates)]

  
  let data = []
  
  uniqueDates.forEach(date => {
    data.push({
      title: date, messages: messages.filter(message => date == dayjs(message.created).format('YYYY-MM-DD'))
    })
  })

  const today = dayjs().format('YYYY-MM-DD')
  const yesterday = dayjs().subtract(1, 'day').format('YYYY-MM-DD')

  data.forEach(el => {
    if (el.title == today) el.title = 'Today'
    if (el.title == yesterday) el.title = 'Yesterday'
  })

  return { body: { messages: data }}

}