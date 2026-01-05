-- ============================================
-- BƯỚC 6: INSERT DỮ LIỆU CORE
-- ============================================
-- Tables: users, categories, system_config
-- Các bảng không phụ thuộc foreign key

-- users: 8 rows
INSERT INTO users (id, email, password, full_name, role, address, created_at, otp, otp_expired, is_verified, dob, rating_score, rating_count) VALUES
  (12, 'admin@gmail.com', '$2b$10$tkqvwPxTZwIx2ctbpKeD9.VzK1/7Z9gP07NC.2C4AExIWVd/Hzqai', 'System Admin', 2, 'Headquarters', '2025-12-19T13:04:41.624Z', NULL, NULL, true, NULL, 0, 0),
  (13, 'seller@gmail.com', '$2b$10$y/TMFxiiWAOhoFiNbBI4PeQ88gfe785vydl38VMt33EKLRGfId4IS', 'Pro Seller', 1, 'Hanoi Store', '2025-12-19T13:04:41.960Z', NULL, NULL, true, NULL, 0, 0),
  (14, 'bidder1@gmail.com', '$2b$10$8sD5sFF1PQZ9CRIbX4PjXe50PC22bsGDqydG0.zfmiDIqQltoCCQO', 'Verified Bidder One', 1, 'Da Nang', '2025-12-19T13:04:42.299Z', NULL, NULL, true, NULL, -1, 1),
  (15, 'bidder2@gmail.com', '$2b$10$8cjZ/tvRri9qUuho1BsFyuV87BZs1ECgsdbKl1OXyypPluV6KWymW', 'Verified Bidder Two', 1, 'Ho Chi Minh', '2025-12-19T13:04:42.634Z', NULL, NULL, true, NULL, 0, 0),
  (16, 'bidder_new@gmail.com', '$2b$10$N8p.qgi7jltV7NDyy9uBAOXmj5K/Ioh7caUJQw.ZIwZazJWOM9GoG', 'Newbie Bidder', 0, 'Unknown', '2025-12-19T13:04:42.973Z', NULL, NULL, false, NULL, 0, 0),
  (17, 'pnthai23@clc.fitus.edu.vn', '$2b$10$gfG/al3dMuggarr8mETPA.Ryh3445XUayMp695aZ1gqFyUFvS25Ea', 'PHẠM NGỌC THÁI', 1, '497 Hoa Hao, Dien Hong Ward', '2025-12-19T07:45:58.267Z', NULL, '2025-12-19T15:00:57.621Z', true, NULL, 3, 3),
  (19, 'thaipham02082005@gmail.com', '$2b$10$RHsefwc2.I564GtD8AwK9.nvPSI5jpV4ogCpdkZsYpdkQAI9UjPcq', 'Pham Thai', 0, 'KTX bách khoa 497 Hòa Hảo', '2025-12-19T11:37:37.309Z', NULL, '2025-12-19T18:52:35.329Z', true, NULL, 15, 23),
  (20, 'pnthai02082005@gmail.com', '$2b$10$uhNve.UoW/yTrLwPalb/5OeNnOnZbx6dTYJmgIA3uOmqq5.dtQrZm', 'PHẠM NGỌC THÁI', 0, '497 Hoa Hao, Dien Hong Ward', '2026-01-04T14:25:49.612Z', NULL, '2026-01-04T21:40:46.109Z', true, NULL, 0, 0);

-- categories: 20 rows
INSERT INTO categories (id, name, parent_id) VALUES
  (1, 'Thiết bị điện tử', NULL),
  (2, 'Thời trang & Phụ kiện', NULL),
  (3, 'Đồng hồ & Trang sức', NULL),
  (4, 'Nhà cửa & Đời sống', NULL),
  (5, 'Thể thao & Dã ngoại', NULL),
  (6, 'Điện thoại di động', 1),
  (7, 'Laptop & Máy tính', 1),
  (8, 'Thời trang Nam', 2),
  (9, 'Thời trang Nữ', 2),
  (10, 'Đồng hồ đeo tay', 3),
  (11, 'Nội thất', 4),
  (12, 'Dụng cụ nhà bếp', 4),
  (13, 'Dụng cụ tập Gym', 5),
  (14, 'Du lịch & Camping', 5),
  (31, 'Sách và Tạp chí khoa học', NULL),
  (32, 'Sách', 31),
  (33, 'Tạp chí khoa học', 31),
  (40, 'Đồ chơi trẻ em', NULL),
  (41, 'Đồ chơi cho bé nam', 40),
  (42, 'Đồ chơi cho bé nữ', 40);

-- system_config: 4 rows
INSERT INTO system_config (config_key, config_value, description, updated_at, updated_by) VALUES
  ('product_highlight_minutes', '60', 'Minutes to highlight new products as "NEW"', '2025-12-19T19:32:12.026Z', NULL),
  ('auto_extend_duration', '10', 'Minutes to extend the auction', '2025-12-26T21:53:47.779Z', NULL),
  ('auto_extend_threshold', '5', 'Minutes before end to trigger auto extension', '2025-12-26T21:53:48.010Z', NULL),
  ('min_rating_percent', '80', 'Minimum rating percentage required to bid', '2025-12-26T21:53:48.240Z', NULL);

