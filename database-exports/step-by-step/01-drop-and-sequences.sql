-- ============================================
-- BƯỚC 1: XÓA VÀ TẠO SEQUENCES
-- ============================================

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

-- Drop tables first (CASCADE will drop triggers and constraints)
DROP TABLE IF EXISTS watchlists CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS upgrade_requests CASCADE;
DROP TABLE IF EXISTS transactions CASCADE;
DROP TABLE IF EXISTS system_config CASCADE;
DROP TABLE IF EXISTS ratings CASCADE;
DROP TABLE IF EXISTS questions CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS product_images CASCADE;
DROP TABLE IF EXISTS product_desc_updates CASCADE;
DROP TABLE IF EXISTS product_bans CASCADE;
DROP TABLE IF EXISTS messages CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS bids CASCADE;

-- Drop functions (after tables)
DROP FUNCTION IF EXISTS update_product_search_vector CASCADE;
DROP FUNCTION IF EXISTS update_user_rating_cache CASCADE;
DROP FUNCTION IF EXISTS update_transaction_timestamp CASCADE;

-- Create sequences for auto-increment
CREATE SEQUENCE IF NOT EXISTS bids_id_seq;
CREATE SEQUENCE IF NOT EXISTS categories_id_seq;
CREATE SEQUENCE IF NOT EXISTS messages_id_seq;
CREATE SEQUENCE IF NOT EXISTS product_desc_updates_id_seq;
CREATE SEQUENCE IF NOT EXISTS product_images_id_seq;
CREATE SEQUENCE IF NOT EXISTS products_id_seq;
CREATE SEQUENCE IF NOT EXISTS questions_id_seq;
CREATE SEQUENCE IF NOT EXISTS ratings_id_seq;
CREATE SEQUENCE IF NOT EXISTS transactions_id_seq;
CREATE SEQUENCE IF NOT EXISTS upgrade_requests_id_seq;
CREATE SEQUENCE IF NOT EXISTS users_id_seq;
