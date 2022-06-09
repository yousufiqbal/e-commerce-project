import { db } from '$lib/database/db'
import { categorySchema } from '$lib/others/schema'
import { internalError } from '$lib/others/utils'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request }) => {
  
  try {
    const body = await request.json()
    console.log(body)
    const category = await categorySchema.validate(body, { abortEarly: false })
    await db.insertInto('categories').values(category).execute()
    return { body: { message: 'Category Added'} }
  } catch (error) {
    return internalError(error)
  }


}