import { db } from '$lib/database/db'
import { parentSchema } from '$lib/others/schema'
import { internalError } from '$lib/others/utils'
import { kebabCase } from 'lodash-es'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request }) => {
  try {
    const body = await request.json()
    const parent = await parentSchema.validate(body, { abortEarly: false })
    parent.url_name = kebabCase(parent.name)
    await db.insertInto('categories').values(parent).execute()
    return { body: { message: 'Parent Added'} }
  } catch (error) {
    return internalError(error)
  }
}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const put = async ({ request, url }) => {
  try {
    const category_id = url.searchParams.get('category_id')
    const body = await request.json()
    const parent = await parentSchema.validate(body, { abortEarly: false })
    parent.url_name = kebabCase(parent.name)
    await db.updateTable('categories')
      .where('categories.category_id', '=', category_id)
      .set(parent).execute()
    return { body: { message: 'Parent edited'} }
  } catch (error) {
    return internalError(error)
  }
}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const del = async ({ url }) => {
  try {
    console.log('came')
    const category_id = url.searchParams.get('category_id')
    // Check if it has any children or products
    // If it has donot remove it.. later.. TODO
    const children = await db.selectFrom('categories').selectAll()
      .where('categories.parent_id', '=', category_id).execute()
    if (children.length != 0) {
      return { status: 401, body: { message: 'Parent contains children. Remove them first'}}
    }
    await db.deleteFrom('categories').where('categories.category_id', '=', category_id)
      .execute()
    return { body: { message: 'Parent removed' }}
  } catch (error) {
    return internalError(error)
  }
}