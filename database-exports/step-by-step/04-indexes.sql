-- ============================================
-- BƯỚC 4: TẠO INDEXES (35 indexes)
-- ============================================

CREATE INDEX idx_bids_bidder ON public.bids USING btree (bidder_id);
CREATE INDEX idx_bids_bidder_created ON public.bids USING btree (bidder_id);
CREATE INDEX idx_bids_product ON public.bids USING btree (product_id);
CREATE INDEX idx_bids_product_price ON public.bids USING btree (product_id, price DESC, status) WHERE (status = 1);
CREATE INDEX idx_messages_conversation ON public.messages USING btree (sender_id, receiver_id);
CREATE INDEX idx_messages_created ON public.messages USING btree (created_at DESC);
CREATE INDEX idx_messages_transaction ON public.messages USING btree (transaction_id);
CREATE INDEX idx_messages_users ON public.messages USING btree (sender_id, receiver_id);
CREATE INDEX idx_product_bans_check ON public.product_bans USING btree (product_id, user_id);
CREATE INDEX idx_desc_updates_product ON public.product_desc_updates USING btree (product_id);
CREATE INDEX idx_product_images_display ON public.product_images USING btree (product_id, display_order);
CREATE INDEX idx_product_images_product ON public.product_images USING btree (product_id);
CREATE INDEX idx_product_images_thumbnail ON public.product_images USING btree (product_id, is_thumbnail) WHERE (is_thumbnail = true);
CREATE INDEX idx_product_search ON public.products USING gin (search_vector);
CREATE INDEX idx_products_category ON public.products USING btree (category_id);
CREATE INDEX idx_products_category_status ON public.products USING btree (category_id, status) WHERE (status = 1);
CREATE INDEX idx_products_end_time ON public.products USING btree (end_time);
CREATE INDEX idx_products_seller ON public.products USING btree (seller_id);
CREATE INDEX idx_products_seller_status ON public.products USING btree (seller_id, status);
CREATE INDEX idx_products_status ON public.products USING btree (status);
CREATE INDEX idx_products_status_end_time ON public.products USING btree (status, end_time) WHERE (status = 1);
CREATE INDEX idx_products_winner_status ON public.products USING btree (winner_id, status) WHERE (winner_id IS NOT NULL);
CREATE INDEX idx_questions_product_created ON public.questions USING btree (product_id);
CREATE INDEX idx_ratings_product ON public.ratings USING btree (product_id);
CREATE INDEX idx_ratings_rated_user ON public.ratings USING btree (rated_user_id);
CREATE INDEX idx_transactions_buyer ON public.transactions USING btree (buyer_id);
CREATE INDEX idx_transactions_buyer_status ON public.transactions USING btree (buyer_id, status);
CREATE INDEX idx_transactions_product ON public.transactions USING btree (product_id);
CREATE INDEX idx_transactions_seller ON public.transactions USING btree (seller_id);
CREATE INDEX idx_transactions_seller_status ON public.transactions USING btree (seller_id, status);
CREATE INDEX idx_transactions_status ON public.transactions USING btree (status);
CREATE INDEX idx_upgrade_requests_status ON public.upgrade_requests USING btree (status);
CREATE INDEX idx_watchlists_user ON public.watchlists USING btree (user_id);
