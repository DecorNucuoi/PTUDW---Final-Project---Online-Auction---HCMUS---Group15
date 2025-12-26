-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- Migration: Add Missing Tables and Columns
-- Purpose: Complete database schema for Online Auction project
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

-- 1. ADD MISSING COLUMNS TO EXISTING TABLES
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

-- Add columns to users table
ALTER TABLE users ADD COLUMN IF NOT EXISTS dob DATE;
ALTER TABLE users ADD COLUMN IF NOT EXISTS rating_score FLOAT DEFAULT 0;
ALTER TABLE users ADD COLUMN IF NOT EXISTS rating_count INT DEFAULT 0;

-- Add columns to products table
ALTER TABLE products ADD COLUMN IF NOT EXISTS search_vector TSVECTOR;
ALTER TABLE products ADD COLUMN IF NOT EXISTS allow_newbie BOOLEAN DEFAULT TRUE;

-- 2. CREATE NEW TABLES
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

-- Table: product_images (Quản lý ảnh sản phẩm)
CREATE TABLE IF NOT EXISTS product_images (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    image_url VARCHAR(500) NOT NULL,
    is_thumbnail BOOLEAN DEFAULT FALSE,
    display_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_product_images_product 
        FOREIGN KEY (product_id) 
        REFERENCES products(id) 
        ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_product_images_product ON product_images(product_id);

-- Table: product_desc_updates (Lịch sử cập nhật mô tả)
CREATE TABLE IF NOT EXISTS product_desc_updates (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_desc_updates_product 
        FOREIGN KEY (product_id) 
        REFERENCES products(id) 
        ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_desc_updates_product ON product_desc_updates(product_id);

-- Table: product_bans (Danh sách bidder bị chặn)
CREATE TABLE IF NOT EXISTS product_bans (
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (product_id, user_id),
    CONSTRAINT fk_bans_product 
        FOREIGN KEY (product_id) 
        REFERENCES products(id) 
        ON DELETE CASCADE,
    CONSTRAINT fk_bans_user 
        FOREIGN KEY (user_id) 
        REFERENCES users(id) 
        ON DELETE CASCADE
);

-- Table: transactions (Quy trình thanh toán - Section 7)
CREATE TABLE IF NOT EXISTS transactions (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL UNIQUE, -- 1-to-1 with product
    buyer_id INT NOT NULL,
    seller_id INT NOT NULL,
    final_price DECIMAL(15, 2) NOT NULL,
    status INT DEFAULT 0,
    -- 0: Chờ thanh toán
    -- 1: Đã thanh toán (buyer upload proof)
    -- 2: Đã gửi hàng (seller confirm + tracking)
    -- 3: Đã nhận hàng (buyer confirm)
    -- 4: Hoàn tất (đã đánh giá)
    -- 5: Đã hủy
    shipping_address TEXT,
    payment_proof TEXT,
    shipping_tracking TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_transactions_product 
        FOREIGN KEY (product_id) 
        REFERENCES products(id) 
        ON DELETE CASCADE,
    CONSTRAINT fk_transactions_buyer 
        FOREIGN KEY (buyer_id) 
        REFERENCES users(id),
    CONSTRAINT fk_transactions_seller 
        FOREIGN KEY (seller_id) 
        REFERENCES users(id)
);

CREATE INDEX IF NOT EXISTS idx_transactions_buyer ON transactions(buyer_id);
CREATE INDEX IF NOT EXISTS idx_transactions_seller ON transactions(seller_id);
CREATE INDEX IF NOT EXISTS idx_transactions_status ON transactions(status);

-- Table: messages (Chat giữa buyer & seller)
CREATE TABLE IF NOT EXISTS messages (
    id SERIAL PRIMARY KEY,
    transaction_id INT NOT NULL,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_messages_transaction 
        FOREIGN KEY (transaction_id) 
        REFERENCES transactions(id) 
        ON DELETE CASCADE,
    CONSTRAINT fk_messages_sender 
        FOREIGN KEY (sender_id) 
        REFERENCES users(id),
    CONSTRAINT fk_messages_receiver 
        FOREIGN KEY (receiver_id) 
        REFERENCES users(id)
);

CREATE INDEX IF NOT EXISTS idx_messages_transaction ON messages(transaction_id);
CREATE INDEX IF NOT EXISTS idx_messages_created ON messages(created_at DESC);

-- Table: system_config (Cấu hình hệ thống)
CREATE TABLE IF NOT EXISTS system_config (
    config_key VARCHAR(100) PRIMARY KEY,
    config_value TEXT NOT NULL,
    description TEXT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    CONSTRAINT fk_config_updater 
        FOREIGN KEY (updated_by) 
        REFERENCES users(id)
);

-- 3. CREATE INDEXES FOR PERFORMANCE
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

-- Full-text search index
CREATE INDEX IF NOT EXISTS idx_product_search 
    ON products USING GIN(search_vector);

-- Products search indexes
CREATE INDEX IF NOT EXISTS idx_products_category ON products(category_id);
CREATE INDEX IF NOT EXISTS idx_products_seller ON products(seller_id);
CREATE INDEX IF NOT EXISTS idx_products_status ON products(status);
CREATE INDEX IF NOT EXISTS idx_products_end_time ON products(end_time);

-- Bids indexes
CREATE INDEX IF NOT EXISTS idx_bids_product ON bids(product_id);
CREATE INDEX IF NOT EXISTS idx_bids_bidder ON bids(bidder_id);

-- Ratings indexes
CREATE INDEX IF NOT EXISTS idx_ratings_rated_user ON ratings(rated_user_id);

-- 4. INSERT DEFAULT SYSTEM CONFIG
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

INSERT INTO system_config (config_key, config_value, description) VALUES
    ('auto_extend_threshold', '5', 'Minutes before end to trigger auto extension'),
    ('auto_extend_duration', '10', 'Minutes to extend the auction'),
    ('min_rating_percent', '80', 'Minimum rating percentage required to bid'),
    ('product_highlight_minutes', '60', 'Minutes to highlight new products as "NEW"')
ON CONFLICT (config_key) DO NOTHING;

-- 5. CREATE TRIGGERS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

-- Trigger: Auto update search_vector when product name/description changes
CREATE OR REPLACE FUNCTION update_product_search_vector()
RETURNS TRIGGER AS $$
BEGIN
    NEW.search_vector := to_tsvector('simple', COALESCE(NEW.name, '') || ' ' || COALESCE(NEW.description, ''));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_product_search_update ON products;
CREATE TRIGGER trigger_product_search_update
    BEFORE INSERT OR UPDATE OF name, description ON products
    FOR EACH ROW
    EXECUTE FUNCTION update_product_search_vector();

-- Trigger: Auto update user rating cache when rating is added/updated
CREATE OR REPLACE FUNCTION update_user_rating_cache()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE users SET
        rating_score = (
            SELECT COALESCE(SUM(score), 0) 
            FROM ratings 
            WHERE rated_user_id = NEW.rated_user_id
        ),
        rating_count = (
            SELECT COUNT(*) 
            FROM ratings 
            WHERE rated_user_id = NEW.rated_user_id
        )
    WHERE id = NEW.rated_user_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_rating_cache_update ON ratings;
CREATE TRIGGER trigger_rating_cache_update
    AFTER INSERT OR UPDATE ON ratings
    FOR EACH ROW
    EXECUTE FUNCTION update_user_rating_cache();

-- Trigger: Auto update transaction updated_at timestamp
CREATE OR REPLACE FUNCTION update_transaction_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_transaction_timestamp ON transactions;
CREATE TRIGGER trigger_transaction_timestamp
    BEFORE UPDATE ON transactions
    FOR EACH ROW
    EXECUTE FUNCTION update_transaction_timestamp();

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- Migration completed!
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
