import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import db from "../config/Database.js";
import { ObjectId } from "mongodb";

export const getUsers = async (req, res) => {
  try {
    let users = await db.collection("users").find({}).toArray();
    res.status(200).json(users);
  } catch (error) {
    console.log(error.message);
  }
};

export const getUserById = async (req, res) => {
  try {
    let user = await db
      .collection("users")
      .findOne({ _id: new ObjectId(req.params.id) });
    if (!user) res.send("Not Found").status(404);
    else res.status(200).json(user);
  } catch (error) {
    console.log(error.message);
  }
};

export const updateUser = async (req, res) => {
  try {
    const updates = {
      $set: req.body,
    };
    let user = await db.collection("users").updateOne(
      {
        _id: new ObjectId(req.params.id),
      },
      updates
    );
    res.send(user).status(200);
  } catch (error) {
    console.log(error.message);
  }
};

export const Register = async (req, res) => {
  const { name, email, password, confPassword } = req.body;
  if (password !== confPassword)
    return res
      .status(400)
      .json({ msg: "Password dan Confirm Password tidak cocok" });
  const salt = await bcrypt.genSalt();
  const hashPassword = await bcrypt.hash(password, salt);
  await db.collection("users").insertOne({
    _id: new ObjectId(),
    fullname: name,
    email: email,
    password: hashPassword,
    refresh_token: null,
  });
  res.json({ msg: "Register Berhasil" });
};

export const Login = async (req, res) => {
  try {
    const user = await db.collection("users").findOne({
      email: req.body.email,
    });
    if (!user) {
      return res.status(400).json({ msg: "Email not found" });
    }
    const match = await bcrypt.compare(req.body.password, user.password);
    if (!match) {
      return res.status(400).json({ msg: "Wrong Password" });
    }
    const userId = user._id;
    const name = user.name;
    const email = user.email;
    const accessToken = jwt.sign(
      { userId, name, email },
      process.env.ACCESS_TOKEN_SECRET,
      {
        expiresIn: "20s",
      }
    );
    const refreshToken = jwt.sign(
      { userId, name, email },
      process.env.REFRESH_TOKEN_SECRET,
      {
        expiresIn: "1d",
      }
    );
    await db
      .collection("users")
      .updateOne(
        { _id: new ObjectId(userId) },
        { $set: { refresh_token: refreshToken } }
      );
    res.cookie("refreshToken", refreshToken, {
      httpOnly: true,
      maxAge: 24 * 60 * 60 * 1000, // 1 day in milliseconds
      // secure: true // Uncomment if using HTTPS
    });
    res.json({ accessToken });
  } catch (error) {
    // Handle any errors that occur during the process
    console.error(error);
    res.status(500).json({ msg: "Internal Server Error" });
  }
};

export const Logout = async (req, res) => {
  const refreshToken = req.cookies.refreshToken;
  if (!refreshToken) return res.sendStatus(204);
  const user = await db
    .collection("users")
    .findOne({ refresh_token: refreshToken });
  if (!user[0]) return res.sendStatus(204);
  const userId = user[0]._id;
  await db
    .collection("users")
    .updateOne({ _id: ObjectId(userId) }, { $set: { refresh_token: null } });
  res.clearCookie("refreshToken");
  return res.sendStatus(200);
};
