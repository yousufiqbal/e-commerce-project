import { db } from '$lib/database/db'
import { internalError } from '$lib/others/utils'
import fs from 'fs/promises'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request, url }) => {

  try {
    const product_id = url.searchParams.get('product_id')
    const product = await db.selectFrom('products').select(['products.url_name']).where('products.product_id', '=', product_id).executeTakeFirst()
    const body = await request.json()
    const { image } = body
    const base64Image = image.split(',')[1]
    await fs.writeFile(`static/products/${product.url_name}.jpg`, base64Image, 'base64')
    return { body: { message: 'Image Uploaded'}}
  } catch (error) {
    return internalError(error)
  }

}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const del = async ({ url }) => {

  try {
    const product_id = url.searchParams.get('product_id')
    const product = await db.selectFrom('products').select(['products.url_name']).where('products.product_id', '=', product_id).executeTakeFirst()
    await fs.unlink(`static/products/${product.url_name}.jpg`)
    return { body: { message: 'Image Removed'}}
  } catch (error) {
    return internalError(error)
  }

}