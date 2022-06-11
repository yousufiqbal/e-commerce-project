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