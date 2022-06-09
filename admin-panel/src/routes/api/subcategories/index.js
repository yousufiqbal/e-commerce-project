import { db } from '$lib/database/db'
import { makeSubcategorySchema } from '$lib/others/schema'
import { internalError } from '$lib/others/utils'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request }) => {

  // TODO validations remaining..
  
  try {
    const body = await request.json()
    const category_ids = (await db.selectFrom('categories')
      .select('categories.category_id').execute()).map(category => category.category_id)
    const subcategorySchema = makeSubcategorySchema(category_ids)
    const subcategory = await subcategorySchema.validate(body, { abortEarly: false })
    await db.insertInto('categories').values(subcategory).execute()
    return { body: { message: 'Subcategory Added'} }
  } catch (error) {
    return internalError(error)
  }


}