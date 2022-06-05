import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async () => {

  const required = ['whatsapp', 'phone', 'email', 'timings']

  const constants = await db.selectFrom('constants')
    .select(['constants.name', 'constants.value']).where('constants.name', 'in', required)
    .execute()

  let data = {}

  for (const constant of constants) {
    data[constant.name] = constant.value
  }

  return { body: { constants: data }}

}