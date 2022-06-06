import { Kysely, MysqlDialect } from "kysely";
import { createPool } from 'mysql2'



// interface Database {
//   activities: Activities
//   addresses: Addresses
// }

// You'd create one of these when you start your app.
export const db = new Kysely<Database>({
  dialect: new MysqlDialect({
    pool: createPool({
      host: '127.0.0.1',
      port: 3306,
      user: 'root',
      password: '486426486426',
      database: 'fast-ecommerce'
    })
  })
})