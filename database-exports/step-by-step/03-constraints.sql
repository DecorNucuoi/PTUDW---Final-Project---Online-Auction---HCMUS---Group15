-- ============================================
-- BƯỚC 3: THÊM CONSTRAINTS (PK, UNIQUE, FK)
-- ============================================

-- First, add all PRIMARY KEYS
ALTER TABLE bids ADD PRIMARY KEY (id);
ALTER TABLE categories ADD PRIMARY KEY (id);
ALTER TABLE messages ADD PRIMARY KEY (id);
ALTER TABLE product_bans ADD PRIMARY KEY (product_id, user_id);
ALTER TABLE product_desc_updates ADD PRIMARY KEY (id);
ALTER TABLE product_images ADD PRIMARY KEY (id);
ALTER TABLE products ADD PRIMARY KEY (id);
ALTER TABLE questions ADD PRIMARY KEY (id);
ALTER TABLE ratings ADD PRIMARY KEY (id);
ALTER TABLE system_config ADD PRIMARY KEY (config_key);
ALTER TABLE transactions ADD PRIMARY KEY (id);
ALTER TABLE upgrade_requests ADD PRIMARY KEY (id);
ALTER TABLE users ADD PRIMARY KEY (id);
ALTER TABLE watchlists ADD PRIMARY KEY (user_id, product_id);

-- Then add UNIQUE constraints
ALTER TABLE transactions ADD CONSTRAINT transactions_product_id_key
    UNIQUE (product_id);
ALTER TABLE users ADD CONSTRAINT users_email_key
    UNIQUE (email);

-- Finally, add FOREIGN KEYS (after all PKs exist)
ALTER TABLE bids ADD CONSTRAINT bids_bidder_id_fkey
    FOREIGN KEY (bidder_id)
    REFERENCES users(id);
ALTER TABLE bids ADD CONSTRAINT bids_product_id_fkey
    FOREIGN KEY (product_id)
    REFERENCES products(id);
ALTER TABLE categories ADD CONSTRAINT categories_parent_id_fkey
    FOREIGN KEY (parent_id)
    REFERENCES categories(id)
    ON DELETE SET NULL;
ALTER TABLE messages ADD CONSTRAINT fk_messages_receiver
    FOREIGN KEY (receiver_id)
    REFERENCES users(id);
ALTER TABLE messages ADD CONSTRAINT fk_messages_sender
    FOREIGN KEY (sender_id)
    REFERENCES users(id);
ALTER TABLE messages ADD CONSTRAINT fk_messages_transaction
    FOREIGN KEY (transaction_id)
    REFERENCES transactions(id)
    ON DELETE CASCADE;
ALTER TABLE product_bans ADD CONSTRAINT fk_bans_product
    FOREIGN KEY (product_id)
    REFERENCES products(id)
    ON DELETE CASCADE;
ALTER TABLE product_bans ADD CONSTRAINT fk_bans_user
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE;
ALTER TABLE product_desc_updates ADD CONSTRAINT fk_desc_updates_product
    FOREIGN KEY (product_id)
    REFERENCES products(id)
    ON DELETE CASCADE;
ALTER TABLE product_images ADD CONSTRAINT fk_product_images_product
    FOREIGN KEY (product_id)
    REFERENCES products(id)
    ON DELETE CASCADE;
ALTER TABLE products ADD CONSTRAINT products_category_id_fkey
    FOREIGN KEY (category_id)
    REFERENCES categories(id);
ALTER TABLE products ADD CONSTRAINT products_seller_id_fkey
    FOREIGN KEY (seller_id)
    REFERENCES users(id);
ALTER TABLE products ADD CONSTRAINT products_winner_id_fkey
    FOREIGN KEY (winner_id)
    REFERENCES users(id);
ALTER TABLE questions ADD CONSTRAINT questions_product_id_fkey
    FOREIGN KEY (product_id)
    REFERENCES products(id);
ALTER TABLE questions ADD CONSTRAINT questions_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);
ALTER TABLE ratings ADD CONSTRAINT ratings_product_id_fkey
    FOREIGN KEY (product_id)
    REFERENCES products(id);
ALTER TABLE ratings ADD CONSTRAINT ratings_rated_user_id_fkey
    FOREIGN KEY (rated_user_id)
    REFERENCES users(id);
ALTER TABLE ratings ADD CONSTRAINT ratings_rater_id_fkey
    FOREIGN KEY (rater_id)
    REFERENCES users(id);
ALTER TABLE system_config ADD CONSTRAINT fk_config_updater
    FOREIGN KEY (updated_by)
    REFERENCES users(id);
ALTER TABLE transactions ADD CONSTRAINT fk_transactions_buyer
    FOREIGN KEY (buyer_id)
    REFERENCES users(id);
ALTER TABLE transactions ADD CONSTRAINT fk_transactions_product
    FOREIGN KEY (product_id)
    REFERENCES products(id)
    ON DELETE CASCADE;
ALTER TABLE transactions ADD CONSTRAINT fk_transactions_seller
    FOREIGN KEY (seller_id)
    REFERENCES users(id);
ALTER TABLE upgrade_requests ADD CONSTRAINT upgrade_requests_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);
ALTER TABLE watchlists ADD CONSTRAINT watchlists_product_id_fkey
    FOREIGN KEY (product_id)
    REFERENCES products(id);
ALTER TABLE watchlists ADD CONSTRAINT watchlists_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);
