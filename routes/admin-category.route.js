import express from "express";
import * as categoryService from "../services/category.service.js";

const router = express.Router();

router.get("/", async function (req, res) {
  const list = await categoryService.findAll();
  res.render("vwAdminCategory/list", { 
    categories: list,
    empty: list.length === 0
  });
});

router.post("/delete", async function (req, res) {
    const id = req.body.id;
  const numProducts = await categoryService.countProductsByCatId(id);
  
  if (numProducts > 0) {
      const list = await categoryService.findAll();
      return res.render("vwAdminCategory/list", { 
          categories: list,
          empty: list.length === 0,
          err_message: `Không thể xóa! Danh mục này đang chứa ${numProducts} sản phẩm.`
      });
  }
  await categoryService.del(req.body.id);
  res.redirect("/admin/categories");
});

router.get("/edit", async function (req, res) {
  const id = req.query.id;
  const category = await categoryService.findById(id);
  if (!category) {
    return res.redirect("/admin/categories");
  }
  const rootCategories  = await categoryService.findRootCategories();

  res.render("vwAdminCategory/edit", { 
      category: category,
      allCategories: rootCategories
  });
});

router.post("/edit", async function (req, res) {
  const id = req.body.id;
  const entity ={
    name: req.body.name,
    parent_id: req.body.parent_id || null
  }
  await categoryService.patch(id, entity);
  res.redirect("/admin/categories");
});

router.get("/add", async function (req, res) {
  const rootCategories  = await categoryService.findRootCategories();
  res.render("vwAdminCategory/add", {
      rootCategories: rootCategories
  });
});

router.post("/add", async function (req, res) {
  const entity = {
    name: req.body.name,
    parent_id: req.body.parent_id || null
  }
  await categoryService.add(entity);
  res.redirect("/admin/categories");
});

export default router;