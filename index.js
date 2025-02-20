import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import UserRoute from "./routes/UserRoute.js";
import ProductRoute from "./routes/ProductRoute.js";
import cookieParser from "cookie-parser";

dotenv.config();
const app = express();

try {
  console.log("Database Connected...");
} catch (error) {
  console.log(error);
}

// const allowedOrigins = ["https://kopikan.vercel.app/"];
// // Enable CORS middleware with custom options
// app.use(
//   cors({
//     origin: (origin, callback) => {
//       // Check if the request's origin is in the allowedOrigins array
//       if (allowedOrigins.includes(origin) || !origin) {
//         callback(null, true); // Allow the request
//       } else {
//         callback(new Error("Not allowed by CORS")); // Deny the request
//       }
//     },
//   })
// );

app.use(cookieParser());
app.use(
  cors({
    origin: (origin, callback) => {
      callback(null, true);
    },
    credentials: true,
    methods: ["GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"],
    allowedHeaders: ["Content-Type", "Authorization"],
  })
);
app.use(express.json());
app.use(UserRoute);
app.use(ProductRoute);
app.listen(process.env.PORT, () => console.log("Server up and running..."));
