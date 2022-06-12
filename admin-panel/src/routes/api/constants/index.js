import { db } from '$lib/database/db'
import { constantSchema } from '$lib/others/schema'
import { internalError } from '$lib/others/utils'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request }) => {
  try {
    console.log('came')
    const body = await request.json()
    const constant = await constantSchema.validate(body, { abortEarly: false })
    await db.insertInto('constants').values(constant).execute()
    return { body: { message: 'Constant added' }}
  } catch (error) {
    return internalError(error)
  }
}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const put = async ({ request, url }) => {
  try {
    const constant_id = url.searchParams.get('constant_id')
    const body = await request.json()
    const constant = await constantSchema.validate(body, { abortEarly: false })
    await db.updateTable('constants').set(constant)
      .where('constants.constant_id', '=', constant_id).execute()
    return { body: { message: 'Constant edited' }}
  } catch (error) {
    return internalError(error)
  }
}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const del = async ({ url }) => {
  try {
    console.log(1)
    const constant_id = url.searchParams.get('constant_id')
    await db.deleteFrom('constants').where('constants.constant_id', '=', constant_id).execute()
    return { body: { message: 'Constant removed' }}
  } catch (error) {
    console.log(error)
    return internalError(error)
  }
}