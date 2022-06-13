import { db } from '$lib/database/db'
import { makeProductSchema } from '$lib/others/schema'
import { internalError } from '$lib/others/utils'
import { kebabCase } from 'lodash-es'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request }) => {
  try {
    const body = await request.json()
    const categories = await db.selectFrom('categories').selectAll().execute()
    const brands = await db.selectFrom('brands').selectAll().execute()
    const productSchema = makeProductSchema(categories, brands)
    const product = await productSchema.validate(body, { abortEarly: false })
    product.url_name = kebabCase(product.name)
    await db.insertInto('products').values(product).execute()
    return { body: { message: 'Product Added' }}
  } catch (error) {
    return internalError(error)
  }
}