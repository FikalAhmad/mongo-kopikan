import { Sequelize } from "sequelize";

const db = new Sequelize("kopikan_db", "root", "", {
  host: "localhost",
  dialect: "mysql",
});

export default db;
