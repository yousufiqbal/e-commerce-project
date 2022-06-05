import { db } from '$lib/database/db'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const put = async ({ url, locals }) => {
    
  const address_id = url.searchParams.get('address_id')

  // make all non-deault
  await db.updateTable('addresses')
    .where('addresses.user_id', '=', locals.user_id)
    .set({ default: '0' }).execute()
    
  // then make this one default
  await db.updateTable('addresses')
    .where('addresses.address_id', '=', address_id)
    .where('addresses.user_id', '=', locals.user_id)
    .set({ default: '1' }).execute()

  return { status: 201, body: { message: 'Address changed to default' }}

}