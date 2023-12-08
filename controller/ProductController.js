import { ObjectId } from "mongodb";
import db from "../config/Database.js";

export const getProducts = async (req, res) => {
  try {
    const products = await db.collection("products").find({}).toArray();
    res.status(200).json(products);
  } catch (error) {
    console.log(error.message);
  }
};

export const getProductById = async (req, res) => {
  try {
    const product = await db
      .collection("products")
      .findOne({ _id: new ObjectId(req.params.id) });
    res.status(200).json(product);
  } catch (error) {
    console.log(error.message);
  }
};

export const createProduct = async (req, res) => {
  const { image, title, price, desc, category } = req.body;
  try {
    await db.collection("products").insertOne({
      _id: new ObjectId(),
      image: image,
      title: title,
      price: price,
      desc: desc,
      category: category,
    });
    res.status(201).json({ msg: "Product Created" });
  } catch (error) {
    console.log(error.message);
  }
};

export const updateProduct = async (req, res) => {
  try {
    const updates = {
      $set: req.body,
    };
    await db.collection("products").updateOne(
      {
        _id: new ObjectId(req.params.id),
      },
      updates
    );
    res.status(200).json({ msg: "Product Updated" });
  } catch (error) {
    console.log(error.message);
  }
};

export const deleteProduct = async (req, res) => {
  try {
    await db.collection("products").deleteOne({
      _id: new ObjectId(req.params.id),
    });
    res.status(200).json({ msg: "Product Deleted" });
  } catch (error) {
    console.log(error.message);
  }
};
