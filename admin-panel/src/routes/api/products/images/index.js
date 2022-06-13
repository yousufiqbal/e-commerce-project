import { db } from '$lib/database/db'
import { convertToBase64, internalError } from '$lib/others/utils'
import fs from 'fs/promises'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request, url }) => {

  try {
    const product_id = url.searchParams.get('product_id')
    const product = await db.selectFrom('products').selectAll()
      .where('products.product_id', '=', product_id).executeTakeFirst()
    const body = await request.json()
    const { image } = body
    const filename = product.url_name + '.jpg'
    const base64Image = convertToBase64(image)
    await fs.writeFile(filename, base64Image, 'base64')
    return { body: { message: 'Image Uploaded'}}
  } catch (error) {
    return internalError(error)
  }

}