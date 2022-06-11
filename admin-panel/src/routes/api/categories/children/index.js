import { db } from '$lib/database/db'
import { childSchema } from '$lib/others/schema'
import { internalError } from '$lib/others/utils'
import { kebabCase } from 'lodash-es'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request }) => {
  
  try {
    const body = await request.json()
    const child = await childSchema.validate(body, { abortEarly: false })
    child.url_name = kebabCase(child.name)
    await db.insertInto('categories').values(child).execute()
    return { body: { message: 'Child added '}}
  } catch (error) {
    return internalError(error)
  }

}