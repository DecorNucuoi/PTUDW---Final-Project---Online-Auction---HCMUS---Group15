import express from "express";
import * as productService from "../services/product.service.js";

const router = express.Router();

router.get("/", async function (req, res) {
  const list = await productService.findAllWithSellerName();
  res.render("vwAdminProduct/list", { 
    products: list,
    empty: list.length === 0
  });
});

router.post("/delete", async function (req, res) {
  await productService.del(req.body.id);
  res.redirect("/admin/products");
});

export default router;