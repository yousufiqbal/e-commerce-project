import { db } from '$lib/database/db'
import { addressSchema } from '$lib/others/schema'
import { internalError } from '$lib/others/utils'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request, locals }) => {

  /**
   * If first address entry, make it default
   */
  
  try {
    const body = await request.json()
    const address = await addressSchema.validate(body, { abortEarly: false })
    const addresses = await db.selectFrom('addresses')
      .where('addresses.user_id', '=', locals.user_id)
      .selectAll().execute()
    await db.insertInto('addresses').values({
      ...address, 'user_id': locals.user_id, default: addresses.length == 0 ? '1' : '0'
    }).execute()
    return { status: 201, body: { message: 'Address added' }}
  } catch (error) {
    return internalError(error)
  }

}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const put = async ({ request, locals, url }) => {

  // Don't trust default..
  
  try {
    const address_id = url.searchParams.get('address_id')
    const body = await request.json()
    const address = await addressSchema.validate(body, { abortEarly: false })
    await db.updateTable('addresses')
      .where('addresses.address_id', '=', address_id)
      .where('addresses.user_id', '=', locals.user_id)
      .set({ ...address, user_id: locals.user_id})
      .execute()
    return { status: 201, body: { message: 'Address updated' }}
  } catch (error) {
    return internalError(error)
  }

}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const del = async ({ locals, url }) => {

  try {
    const address_id = url.searchParams.get('address_id')
    await db.deleteFrom('addresses')
      .where('addresses.address_id', '=', address_id)
      .where('addresses.user_id', '=', locals.user_id)
      .execute()
    return { status: 201, body: { message: 'Address removed' }}
  } catch (error) {
    return internalError(error)
  }

}