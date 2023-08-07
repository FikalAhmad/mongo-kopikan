import { Sequelize } from "sequelize";

const db = new Sequelize({
  username: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  database: process.env.DATABASE,
  host: process.env.DB_HOST,
  dialect: "mysql",
});

export default db;
