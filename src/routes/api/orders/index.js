import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request, locals }) => {

  const { address_id, payment_method } = await request.json()
  
  const address = await db.selectFrom('addresses')
    .select(['addresses.label', 'addresses.address', 'addresses.city'])
    .where('addresses.address_id', '=', address_id)
    .where('addresses.user_id', '=', locals.user_id)
    .executeTakeFirst()

  const completeAddress = address.address + ' - ' + address.city

  const user = await db.selectFrom('users').select('users.applied_promo_id')
    .where('users.user_id', '=', locals.user_id)
    .executeTakeFirst()

  // Check promo validity.. etc..

  // TODO transaction..
  const { insertId } = await db.insertInto('orders').values({
    address: completeAddress,
    payment_method,
    promo_id: user.applied_promo_id,
    user_id: locals.user_id
  }).executeTakeFirst()

  return { status: 201, body: { message: Number(insertId) } }

}