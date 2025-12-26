-- Migration: Add allow_newbie field to products table
-- Date: 2025-12-19
-- Description: Thêm field allow_newbie để seller có thể chọn cho phép người mua chưa có rating tham gia đấu giá

ALTER TABLE products 
ADD COLUMN IF NOT EXISTS allow_newbie BOOLEAN DEFAULT true;

-- Cập nhật tất cả sản phẩm hiện tại mặc định cho phép newbie
UPDATE products 
SET allow_newbie = true 
WHERE allow_newbie IS NULL;

-- Comment
COMMENT ON COLUMN products.allow_newbie IS 'Cho phép người mua chưa có rating tham gia đấu giá';
