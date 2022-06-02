import { db } from '$lib/database/db'
import { registerSchema } from '$lib/others/schema'
import { internalError } from '$lib/others/utils'
import bcryptjs from 'bcryptjs'
import cookie from 'cookie'
import jwt from 'jsonwebtoken'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request, locals }) => {

  try {
    const body = await request.json()

    // General validation
    const user = await registerSchema.validate(body, { abortEarly: false })

    // Is email unique?
    const result = await db.selectFrom('users').where('users.email', '=', user.email)
      .selectAll().executeTakeFirst()
    if (result) throw new Error('Email already registered')

    // hash password
    user.password = await bcryptjs.hash(user.password, 11)
    delete user.repeatPassword

    // save user
    const { insertId } = await db.insertInto('users').values(user).executeTakeFirst()
    const user_id = Number(insertId)
    const payload = { user_id, name: user.name }

    // TODO make this transactional
    // convert guest to user (cart, wishlist.. transfer)
    const previousGuestCart = await db.selectFrom('guest_cart_items').select(['guest_cart_items.created', 'guest_cart_items.user_id', 'guest_cart_items.product_id', 'guest_cart_items.quantity'])
      .where('guest_cart_items.user_id', '=', locals.guest_id).execute()
    previousGuestCart.forEach(item => {
      item.user_id = user_id
    })
    await db.insertInto('cart_items').values(previousGuestCart).execute()

    // remove guest and related info
    await db.deleteFrom('guest_cart_items').where('guest_cart_items.user_id', '=', locals.guest_id).execute()
    await db.deleteFrom('guests').where('guests.guest_id', '=', locals.guest_id).execute()

    // login user using cookie
    const fact = jwt.sign(payload, import.meta.env.VITE_SECRET)
    return {
      status: 201, headers: { 'set-cookie': cookie.serialize('fact', fact, { path: '/', maxAge: 7 * 86400 }) },
      body: { payload }
    }
  } catch (error) {
    return internalError(error)
  }
  
}