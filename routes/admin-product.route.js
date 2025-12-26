import express from "express";
import * as productService from "../services/product.service.js";
import * as categoryService from "../services/category.service.js";
import db from "../utils/db.js";

const router = express.Router();

/**
 * GET /admin/products
 * List all products (including soft-deleted ones)
 */
router.get("/", async function (req, res) {
  const list = await productService.findAllWithSellerName();
  
  // Add transaction status for each product
  const productsWithStatus = await Promise.all(list.map(async (product) => {
    // Check if product has transaction
    const transaction = await db('transactions')
      .where('product_id', product.id)
      .first();
    
    // Determine if can delete
    const canDelete = product.status === 2 && (!transaction || transaction.status === 4);
    
    return {
      ...product,
      has_transaction: !!transaction,
      transaction_status: transaction ? transaction.status : null,
      can_delete: canDelete
    };
  }));
  
  res.render("vwAdminProduct/list", { 
    products: productsWithStatus,
    empty: list.length === 0
  });
});

/**
 * GET /admin/products/detail/:id
 * View product details
 */
router.get("/detail/:id", async function (req, res) {
  try {
    const id = req.params.id;
    const product = await productService.findDetailById(id);
    
    if (!product) {
      req.session.errorMessage = 'Không tìm thấy sản phẩm!';
      return res.redirect('/admin/products');
    }
    
    // Get product images
    const images = await productService.findImages(id);
    
    // Get bid history
    const bids = await productService.findBidHistory(id);
    
    // Get category
    const category = await categoryService.findById(product.category_id);
    
    res.render("vwAdminProduct/detail", {
      product: product,
      images: images,
      bids: bids,
      category: category
    });
  } catch (error) {
    console.error('Error loading product detail:', error);
    req.session.errorMessage = 'Lỗi khi tải thông tin sản phẩm!';
    res.redirect('/admin/products');
  }
});

/**
 * POST /admin/products/soft-delete
 * Soft delete product (set status = -1)
 * Only allowed if:
 * - Product status = 2 (ended)
 * - AND (no transaction OR transaction completed with ratings)
 */
router.post("/soft-delete", async function (req, res) {
  try {
    const id = req.body.id;
    
    // Check product status
    const product = await productService.findById(id);
    if (!product) {
      req.session.errorMessage = 'Không tìm thấy sản phẩm!';
      return res.redirect("/admin/products");
    }
    
    // Validation 1: Product must be ended (status = 2)
    if (product.status !== 2) {
      req.session.errorMessage = 'Chỉ được gỡ bỏ sản phẩm đã kết thúc đấu giá!';
      return res.redirect("/admin/products");
    }
    
    // Validation 2: Check transaction status
    const transaction = await db('transactions')
      .where('product_id', id)
      .first();
    
    if (transaction) {
      // If transaction exists, must be completed with ratings (status = 4)
      if (transaction.status !== 4) {
        req.session.errorMessage = 'Không thể gỡ bỏ! Giao dịch chưa hoàn tất (cần cả 2 bên đánh giá).';
        return res.redirect("/admin/products");
      }
    }
    
    // All validations passed - proceed with soft delete
    await productService.softDelete(id);
    
    req.session.successMessage = `Đã gỡ bỏ sản phẩm "${product.name}" thành công!`;
    res.redirect("/admin/products");
  } catch (error) {
    console.error('Error soft deleting product:', error);
    req.session.errorMessage = 'Lỗi hệ thống khi gỡ bỏ sản phẩm. Vui lòng thử lại!';
    res.redirect("/admin/products");
  }
});

/**
 * POST /admin/products/restore
 * Restore soft-deleted product
 */
router.post("/restore", async function (req, res) {
  try {
    const id = req.body.id;
    
    const product = await productService.findById(id);
    if (!product) {
      req.session.errorMessage = 'Không tìm thấy sản phẩm!';
      return res.redirect("/admin/products");
    }
    
    await productService.restore(id);
    
    req.session.successMessage = `Đã khôi phục sản phẩm "${product.name}" thành công!`;
    res.redirect("/admin/products");
  } catch (error) {
    console.error('Error restoring product:', error);
    req.session.errorMessage = 'Lỗi hệ thống khi khôi phục sản phẩm. Vui lòng thử lại!';
    res.redirect("/admin/products");
  }
});

/**
 * POST /admin/products/hard-delete
 * Permanently delete product (only for soft-deleted products)
 */
router.post("/hard-delete", async function (req, res) {
  try {
    const id = req.body.id;
    
    // Check if product is soft-deleted first
    const product = await productService.findById(id);
    if (!product) {
      req.session.errorMessage = 'Không tìm thấy sản phẩm!';
      return res.redirect("/admin/products");
    }
    
    if (product.status !== -1) {
      req.session.errorMessage = 'Chỉ có thể xóa vĩnh viễn sản phẩm đã bị gỡ bỏ! Vui lòng gỡ bỏ trước.';
      return res.redirect("/admin/products");
    }
    
    const productName = product.name;
    await productService.del(id);
    
    req.session.successMessage = `Đã xóa vĩnh viễn sản phẩm "${productName}" khỏi hệ thống!`;
    res.redirect("/admin/products");
  } catch (error) {
    console.error('Error hard deleting product:', error);
    req.session.errorMessage = 'Lỗi hệ thống khi xóa sản phẩm. Vui lòng thử lại!';
    res.redirect("/admin/products");
  }
});

export default router;