import { db } from '$lib/database/db'
import { brandSchema } from '$lib/others/schema'
import { internalError } from '$lib/others/utils'
import { kebabCase } from 'lodash-es'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request }) => {
  try {
    const body = await request.json()
    const brand = await brandSchema.validate(body, { abortEarly: false })
    brand.url_name = kebabCase(brand.name)
    await db.insertInto('brands').values(brand).execute()
    return { body: { message: 'Brand added' }}
  } catch (error) {
    return internalError(error)
  }
}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const put = async ({ request, url }) => {
  try {
    const brand_id = url.searchParams.get('brand_id')
    const body = await request.json()
    const brand = await brandSchema.validate(body, { abortEarly: false })
    brand.url_name = kebabCase(brand.name)
    await db.updateTable('brands')
      .where('brands.brand_id', '=', brand_id)
      .set(brand).execute()
    return { body: { message: 'Brand updated' }}
  } catch (error) {
    return internalError(error)
  }
}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const del = async ({ url }) => {
  try {
    // TODO donot remove brand if it contains children
    const brand_id = url.searchParams.get('brand_id')
    await db.deleteFrom('brands').where('brands.brand_id', '=', brand_id).execute()
    return { body: { message: 'Brand removed' }}
  } catch (error) {
    return internalError(error)
  }
}