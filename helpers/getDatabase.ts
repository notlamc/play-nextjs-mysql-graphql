import { createPool } from "mysql";

const database = createPool({
  waitForConnections: true,

  connectionLimit: 10,

  host: process.env.APP_DATABASE_HOST,

  user: process.env.APP_DATABASE_USERNAME,

  password: process.env.APP_DATABASE_PASSWORD,

  database: process.env.APP_DATABASE_NAME,

  timezone: "+00:00",

  debug: false,
});

export default database;
