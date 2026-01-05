-- ============================================
-- BƯỚC 9: CẬP NHẬT SEQUENCES
-- ============================================
-- Set sequences to correct values after data insert

SELECT setval('bids_id_seq', COALESCE((SELECT MAX(id) FROM bids), 1), true);
SELECT setval('categories_id_seq', COALESCE((SELECT MAX(id) FROM categories), 1), true);
SELECT setval('messages_id_seq', COALESCE((SELECT MAX(id) FROM messages), 1), true);
SELECT setval('product_desc_updates_id_seq', COALESCE((SELECT MAX(id) FROM product_desc_updates), 1), true);
SELECT setval('product_images_id_seq', COALESCE((SELECT MAX(id) FROM product_images), 1), true);
SELECT setval('products_id_seq', COALESCE((SELECT MAX(id) FROM products), 1), true);
SELECT setval('questions_id_seq', COALESCE((SELECT MAX(id) FROM questions), 1), true);
SELECT setval('ratings_id_seq', COALESCE((SELECT MAX(id) FROM ratings), 1), true);
SELECT setval('transactions_id_seq', COALESCE((SELECT MAX(id) FROM transactions), 1), true);
SELECT setval('upgrade_requests_id_seq', COALESCE((SELECT MAX(id) FROM upgrade_requests), 1), true);
SELECT setval('users_id_seq', COALESCE((SELECT MAX(id) FROM users), 1), true);
