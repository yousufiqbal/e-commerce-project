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

/** @type {import('@sveltejs/kit').RequestHandler} */
export const put = async ({ request, url }) => {
  
  try {
    const body = await request.json()
    const child = await childSchema.validate(body, { abortEarly: false })
    child.url_name = kebabCase(child.name)
    const child_id = url.searchParams.get('category_id')
    await db.updateTable('categories')
      .where('categories.category_id', '=', child_id)
      .set(child).execute()
    return { body: { message: 'Child updated '}}
  } catch (error) {
    return internalError(error)
  }

}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const del = async ({ url }) => {

  try {
    const category_id = url.searchParams.get('category_id')
    // check if it has any child
    // check if it has any product
    // In both cases do not remove it
    // TODO later..
    await db.deleteFrom('categories').where('categories.category_id', '=', category_id)
      .execute()
    return { body: { message: 'Child removed'}}
  } catch (error) {
    return internalError(error)
  }
}