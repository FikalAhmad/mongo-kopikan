import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import db from "./config/Database.js";
import UserRoute from "./routes/UserRoute.js";
import ProductRoute from "./routes/ProductRoute.js";
import cookieParser from "cookie-parser";
// import Users from "./models/UserModel.js";
// import Products from "./models/ProductModel.js";

dotenv.config();
const app = express();

try {
  await db.authenticate();
  console.log("Database Connected...");
  // Users.sync();
  // Products.sync();
} catch (error) {
  console.log(error);
}

app.use(cookieParser());
app.use(cors({ credentials: true, origin: "http://localhost:5173" }));
app.use(express.json());
app.use(UserRoute);
app.use(ProductRoute);
app.listen(5000, () => console.log("Server up and running..."));
