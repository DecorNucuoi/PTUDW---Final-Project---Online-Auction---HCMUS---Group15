-- ============================================
-- MIGRATION: PERFORMANCE OPTIMIZATION INDEXES
-- Purpose: Add composite indexes for common query patterns
-- Date: 2026-01-01
-- Expected improvement: 20-40% faster queries
-- Note: Removed CONCURRENTLY to allow running in transaction
-- ============================================

-- Products table indexes
-- For active product listings filtered by status and end_time
CREATE INDEX IF NOT EXISTS idx_products_status_end_time
    ON products(status, end_time) WHERE status = 1;

-- For category browsing with active products
CREATE INDEX IF NOT EXISTS idx_products_category_status
    ON products(category_id, status) WHERE status = 1;

-- For seller's product management
CREATE INDEX IF NOT EXISTS idx_products_seller_status
    ON products(seller_id, status);

-- For winner's won products
CREATE INDEX IF NOT EXISTS idx_products_winner_status
    ON products(winner_id, status) WHERE winner_id IS NOT NULL;

-- Bids table indexes
-- For bid history with price ordering (most common query)
CREATE INDEX IF NOT EXISTS idx_bids_product_price
    ON bids(product_id, price DESC, status) WHERE status = 1;

-- For user's bidding history
CREATE INDEX IF NOT EXISTS idx_bids_bidder_created
    ON bids(bidder_id);

-- Product images indexes
-- For fetching thumbnail quickly
CREATE INDEX IF NOT EXISTS idx_product_images_thumbnail
    ON product_images(product_id, is_thumbnail) WHERE is_thumbnail = true;

-- For fetching all images in display order
CREATE INDEX IF NOT EXISTS idx_product_images_display
    ON product_images(product_id, display_order);

-- Ratings table indexes
-- For user rating calculations (used in getRatingPoint)
CREATE INDEX IF NOT EXISTS idx_ratings_rated_user
    ON ratings(rated_user_id, score);

-- For product rating context
CREATE INDEX IF NOT EXISTS idx_ratings_product
    ON ratings(product_id);

-- Questions table indexes
-- For product Q&A section
CREATE INDEX IF NOT EXISTS idx_questions_product_created
    ON questions(product_id);

-- Transactions table indexes
-- For buyer's transaction list
CREATE INDEX IF NOT EXISTS idx_transactions_buyer_status
    ON transactions(buyer_id, status);

-- For seller's transaction list
CREATE INDEX IF NOT EXISTS idx_transactions_seller_status
    ON transactions(seller_id, status);

-- For product-specific transaction lookup
CREATE INDEX IF NOT EXISTS idx_transactions_product
    ON transactions(product_id);

-- Watchlist indexes
-- For user's watchlist with product details
CREATE INDEX IF NOT EXISTS idx_watchlists_user
    ON watchlists(user_id);

-- Product bans indexes
-- For checking if user is banned from bidding
CREATE INDEX IF NOT EXISTS idx_product_bans_check
    ON product_bans(product_id, user_id);

-- Upgrade requests indexes
-- For admin approval workflow
CREATE INDEX IF NOT EXISTS idx_upgrade_requests_status
    ON upgrade_requests(status);

-- Messages indexes (for chat system)
CREATE INDEX IF NOT EXISTS idx_messages_transaction
    ON messages(transaction_id);

CREATE INDEX IF NOT EXISTS idx_messages_conversation
    ON messages(sender_id, receiver_id);

