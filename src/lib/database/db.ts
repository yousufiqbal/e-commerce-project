import { Kysely, MysqlDialect } from "kysely";
import { createPool } from 'mysql2'

interface Activities {
  'activity': string;
  'activity_id'?: number;
  'admin_id': number;
  'created'?: Date;
}
interface Addresses {
  'address': string;
  'address_id'?: number;
  'city': string;
  'created'?: Date;
  'default': any;
  'label': string;
  'user_id': number;
}
interface Admins {
  'admin_id'?: number;
  'contact': string;
  'created'?: Date;
  'email': string;
  'firstname': string;
  'lastname': string;
  'password': string;
  'privileges'?: any;
}
interface Brands {
  'brand_id'?: number;
  'created'?: Date;
  'name': string;
  'url_name': string;
}
interface CartItems {
  'cart_item'?: number;
  'created'?: Date;
  'quantity': number;
  'stock_id': number;
  'user_id': number;
}
interface Categories {
  'category_id'?: number;
  'created'?: Date;
  'name': string;
  'parent_id': number | null;
  'url_name': string;
}
interface GuestCartItems {
  'cart_item'?: number;
  'created'?: Date;
  'guest_id': number;
  'quantity': number;
  'stock_id': number;
}
interface Guests {
  'created': Date;
  'guest_id'?: number;
}
interface Messages {
  'created': Date;
  'message': string;
  'message_id'?: number;
  'type': string;
  'user_id': number;
}
interface OrderDetails {
  'order_detail_id'?: number;
  'order_id': number;
  'price': number;
  'quantity': number;
  'stock_id': number;
}
interface OrderStatuses {
  'created': Date;
  'description': number | null;
  'order_id': number;
  'order_status_id'?: number;
  'status': string;
}
interface Orders {
  'created'?: Date;
  'order_id'?: number;
  'promo_id': number;
  'user_id': number;
}
interface Products {
  'brand_id': number;
  'category_id': number;
  'created'?: Date;
  'description': string;
  'name': string;
  'price'?: number;
  'product_id'?: number;
  'url_name': string;
}
interface Promos {
  'code': string;
  'consumed'?: number;
  'created'?: Date;
  'max_discount'?: number;
  'percentage': number;
  'promo_id'?: number;
  'user_id': number;
  'validity': Date;
}
interface Stocks {
  'created'?: Date;
  'product_id': number;
  'quantity_came': number;
  'quantity_remaining': number;
  'stock_id'?: number;
  'unit_cost': number;
}
interface Users {
  'applied_promo_id': number | null;
  'contact': string;
  'created'?: Date;
  'email': string;
  'last_messages_read': Date | null;
  'last_orders_read': Date | null;
  'last_promos_read': Date | null;
  'last_wallet_read': Date | null;
  'name': string;
  'password': string;
  'user_id'?: number;
}

interface Validations {
  'admin_id': number;
  'created'?: Date;
  'purpose': any;
  'uuid': string;
  'validation_id'?: number;
  'validity': Date;
}
interface Wallets {
  'created'?: Date;
  'in'?: number;
  'out'?: number;
  'user_id': number;
  'wallet_id'?: number;
}
interface Wishlists {
  'created'?: Date;
  'product_id': number;
  'user_id': number;
  'wishlist_id'?: number;
}



interface Database {
  activities: Activities
  addresses: Addresses
  admins: Admins
  brands: Brands
  cartItems: CartItems
  categories: Categories
  guestCartItems: GuestCartItems
  guests: Guests
  messages: Messages
  orderDetails: OrderDetails
  orderStatuses: OrderStatuses
  orders: Orders
  products: Products
  promos: Promos
  stocks: Stocks
  users: Users
  validations: Validations
  wallets: Wallets
  wishlists: Wishlists
}

// You'd create one of these when you start your app.
export const db = new Kysely<Database>({
  dialect: new MysqlDialect({
    pool: createPool({
      host: 'localhost',
      user: 'root',
      password: '486426486426',
      database: 'fast-ecommerce'
    })
  })
})