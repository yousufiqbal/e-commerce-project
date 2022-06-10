import { db } from '$lib/database/db'
import { categorySchema } from '$lib/others/schema'
import { internalError } from '$lib/others/utils'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request }) => {
  try {
    const body = await request.json()
    const category = await categorySchema.validate(body, { abortEarly: false })
    await db.insertInto('categories').values(category).execute()
    return { body: { message: 'Category Added'} }
  } catch (error) {
    return internalError(error)
  }
}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const put = async ({ request, url }) => {
  try {
    const category_id = url.searchParams.get('category_id')
    const body = await request.json()
    const category = await categorySchema.validate(body, { abortEarly: false })
    await db.updateTable('categories')
      .where('categories.category_id', '=', category_id)
      .set(category).execute()
    return { body: { message: 'Category Updated'} }
  } catch (error) {
    return internalError(error)
  }
}