import express from "express";
import * as categoryService from "../services/category.service.js";
import { redirectWithSuccess, redirectWithError } from "../utils/redirect.js";

const router = express.Router();

/**
 * GET /admin/categories
 * List all categories
 */
router.get("/", async function (req, res) {
  const list = await categoryService.findAll();
  
  // Add product count for each category
  const categoriesWithCount = await Promise.all(list.map(async (cat) => {
    const products = await categoryService.findProductsByCatId(cat.id);
    return {
      ...cat,
      product_count: products.length
    };
  }));
  
  res.render("vwAdminCategory/list", { 
    categories: categoriesWithCount,
    empty: list.length === 0
  });
});

/**
 * GET /admin/categories/detail/:id
 * View category details with all products
 */
router.get("/detail/:id", async function (req, res) {
  try {
    const id = req.params.id;
    const category = await categoryService.findById(id);
    
    if (!category) {
      req.session.errorMessage = 'Không tìm thấy danh mục!';
      return res.redirect('/admin/categories');
    }
    
    // Get all products in this category
    const products = await categoryService.findProductsByCatId(id);
    
    // Get parent category if exists
    let parentCategory = null;
    if (category.parent_id) {
      parentCategory = await categoryService.findById(category.parent_id);
    }
    
    // Get subcategories if this is a parent
    const subcategories = await categoryService.findSubcategories(id);
    
    res.render("vwAdminCategory/detail", {
      category: category,
      parentCategory: parentCategory,
      subcategories: subcategories,
      products: products,
      productCount: products.length
    });
  } catch (error) {
    console.error('Error loading category detail:', error);
    req.session.errorMessage = 'Lỗi khi tải thông tin danh mục!';
    res.redirect('/admin/categories');
  }
});

/**
 * POST /admin/categories/delete
 * Delete category (only if no products)
 */
router.post("/delete", async function (req, res) {
  try {
    const id = req.body.id;
    const numProducts = await categoryService.countProductsByCatId(id);
    
    if (numProducts > 0) {
      req.session.errorMessage = `Không thể xóa! Danh mục này đang chứa ${numProducts} sản phẩm.`;
      return res.redirect("/admin/categories");
    }
    
    // Check if category has subcategories
    const subcategories = await categoryService.findSubcategories(id);
    if (subcategories && subcategories.length > 0) {
      req.session.errorMessage = `Không thể xóa! Danh mục này có ${subcategories.length} danh mục con.`;
      return res.redirect("/admin/categories");
    }
    
    await categoryService.del(id);
    redirectWithSuccess(req, res, "/admin/categories", 'Đã xóa danh mục thành công!');
  } catch (error) {
    console.error('Error deleting category:', error);
    redirectWithError(req, res, "/admin/categories", 'Lỗi khi xóa danh mục!');
  }
});

/**
 * GET /admin/categories/edit
 * Show edit form
 */
router.get("/edit", async function (req, res) {
  const id = req.query.id;
  const category = await categoryService.findById(id);
  if (!category) {
    req.session.errorMessage = 'Không tìm thấy danh mục!';
    return res.redirect("/admin/categories");
  }
  const rootCategories = await categoryService.findRootCategories();

  res.render("vwAdminCategory/edit", { 
      category: category,
      allCategories: rootCategories
  });
});

/**
 * POST /admin/categories/edit
 * Update category
 */
router.post("/edit", async function (req, res) {
  try {
    const id = req.body.id;
    
    // Validation: check if name is empty
    if (!req.body.name || req.body.name.trim() === '') {
      req.session.errorMessage = 'Tên danh mục không được để trống!';
      return res.redirect(`/admin/categories/edit?id=${id}`);
    }
    
    const entity = {
      name: req.body.name.trim(),
      parent_id: req.body.parent_id || null
    };
    
    await categoryService.patch(id, entity);
    redirectWithSuccess(req, res, "/admin/categories", 'Đã cập nhật danh mục thành công!');
  } catch (error) {
    console.error('Error updating category:', error);
    redirectWithError(req, res, "/admin/categories", 'Lỗi khi cập nhật danh mục!');
  }
});

/**
 * GET /admin/categories/add
 * Show add form
 */
router.get("/add", async function (req, res) {
  const rootCategories = await categoryService.findRootCategories();
  res.render("vwAdminCategory/add", {
      rootCategories: rootCategories
  });
});

/**
 * POST /admin/categories/add
 * Create new category
 */
router.post("/add", async function (req, res) {
  try {
    // Validation: check if name is empty
    if (!req.body.name || req.body.name.trim() === '') {
      req.session.errorMessage = 'Tên danh mục không được để trống!';
      return res.redirect('/admin/categories/add');
    }
    
    const entity = {
      name: req.body.name.trim(),
      parent_id: req.body.parent_id || null
    };
    
    await categoryService.add(entity);
    redirectWithSuccess(req, res, "/admin/categories", 'Đã thêm danh mục mới thành công!');
  } catch (error) {
    console.error('Error adding category:', error);
    redirectWithError(req, res, "/admin/categories", 'Lỗi khi thêm danh mục!');
  }
});

export default router;