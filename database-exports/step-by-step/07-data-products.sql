-- ============================================
-- BƯỚC 7: INSERT DỮ LIỆU PRODUCTS
-- ============================================
-- Tables: products, upgrade_requests
-- Phụ thuộc: users, categories

-- products: 120 rows
INSERT INTO products (id, name, seller_id, category_id, description, start_price, step_price, buy_now_price, current_price, end_time, status, winner_id, created_at, allow_newbie, auto_extend, search_vector) VALUES
  (47, 'MacBook Air M2 13inch 2024 Midnight', 13, 7, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 1 - 4102</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '800000', '10000', NULL, '820000', '2026-01-13T23:59:00.000Z', 1, 14, '2025-12-19T13:04:44.102Z', true, true, '''1'':18 ''13inch'':4 ''2024'':5 ''4102'':19 ''a'':9 ''adipiscing'':26 ''air'':2 ''amet'':24 ''bị'':14 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''ipsum'':21 ''is'':8 ''lorem'':20 ''m2'':3 ''macbook'':1 ''midnight'':6 ''product'':17 ''sit'':23 ''this'':7 ''thiết'':13 ''tử'':16 ''điện'':15'),
  (48, 'Samsung Galaxy M54 5G 8GB 256GB', 13, 6, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 2 - 4613</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '1000000', '10000', NULL, '1070000', '2026-01-15T13:16:00.000Z', 1, 15, '2025-12-19T13:04:44.613Z', true, false, '''2'':18 ''256gb'':6 ''4613'':19 ''5g'':4 ''8gb'':5 ''a'':9 ''adipiscing'':26 ''amet'':24 ''bị'':14 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''galaxy'':2 ''ipsum'':21 ''is'':8 ''lorem'':20 ''m54'':3 ''product'':17 ''samsung'':1 ''sit'':23 ''this'':7 ''thiết'':13 ''tử'':16 ''điện'':15'),
  (49, 'Xiaomi 13T Pro 12GB 256GB', 13, 6, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 3 - 5113</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '990000', '10000', NULL, '1030000', '2026-01-14T03:17:00.000Z', 1, 14, '2025-12-19T13:04:45.114Z', true, true, '''12gb'':4 ''13t'':2 ''256gb'':5 ''3'':17 ''5113'':18 ''a'':8 ''adipiscing'':25 ''amet'':23 ''bị'':13 ''consectetur'':24 ''description'':10 ''detailed'':9 ''dolor'':21 ''elit'':26 ''for'':11 ''ipsum'':20 ''is'':7 ''lorem'':19 ''pro'':3 ''product'':16 ''sit'':22 ''this'':6 ''thiết'':12 ''tử'':15 ''xiaomi'':1 ''điện'':14'),
  (50, 'Realme GT 5 Pro 12GB 256GB', 13, 6, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 4 - 5608</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '390000', '10000', NULL, '570000', '2026-01-12T01:24:00.000Z', 1, 14, '2025-12-19T13:04:45.608Z', true, true, '''12gb'':5 ''256gb'':6 ''4'':18 ''5'':3 ''5608'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''bị'':14 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''gt'':2 ''ipsum'':21 ''is'':8 ''lorem'':20 ''pro'':4 ''product'':17 ''realme'':1 ''sit'':23 ''this'':7 ''thiết'':13 ''tử'':16 ''điện'':15'),
  (51, 'Dell Inspiron 16 Plus 7630 i7', 13, 7, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 5 - 6103</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '970000', '10000', NULL, '1080000', '2026-01-15T12:59:00.000Z', 1, 14, '2025-12-19T13:04:46.103Z', true, true, '''16'':3 ''5'':18 ''6103'':19 ''7630'':5 ''a'':9 ''adipiscing'':26 ''amet'':24 ''bị'':14 ''consectetur'':25 ''dell'':1 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''i7'':6 ''inspiron'':2 ''ipsum'':21 ''is'':8 ''lorem'':20 ''plus'':4 ''product'':17 ''sit'':23 ''this'':7 ''thiết'':13 ''tử'':16 ''điện'':15'),
  (52, 'LG Gram 17 inch Siêu Nhẹ 1.35kg', 13, 7, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 6 - 6605</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '380000', '10000', NULL, '550000', '2026-01-12T14:09:00.000Z', 1, 12, '2025-12-19T13:04:46.605Z', true, false, '''1.35'':7 ''17'':3 ''6'':20 ''6605'':21 ''a'':11 ''adipiscing'':28 ''amet'':26 ''bị'':16 ''consectetur'':27 ''description'':13 ''detailed'':12 ''dolor'':24 ''elit'':29 ''for'':14 ''gram'':2 ''inch'':4 ''ipsum'':23 ''is'':10 ''kg'':8 ''lg'':1 ''lorem'':22 ''nhẹ'':6 ''product'':19 ''sit'':25 ''siêu'':5 ''this'':9 ''thiết'':15 ''tử'':18 ''điện'':17'),
  (53, 'MacBook Pro M3 14inch 2024 Space Gray', 13, 7, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 7 - 7109</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '820000', '10000', NULL, '850000', '2026-01-18T08:13:00.000Z', 1, 12, '2025-12-19T13:04:47.109Z', true, true, '''14inch'':4 ''2024'':5 ''7'':19 ''7109'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''bị'':15 ''consectetur'':26 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''gray'':7 ''ipsum'':22 ''is'':9 ''lorem'':21 ''m3'':3 ''macbook'':1 ''pro'':2 ''product'':18 ''sit'':24 ''space'':6 ''this'':8 ''thiết'':14 ''tử'':17 ''điện'':16'),
  (54, 'MSI Creator Z16P Studio Laptop', 13, 7, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 8 - 7615</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '850000', '10000', NULL, '1020000', '2026-01-17T17:08:00.000Z', 1, 16, '2025-12-19T13:04:47.615Z', true, false, '''7615'':18 ''8'':17 ''a'':8 ''adipiscing'':25 ''amet'':23 ''bị'':13 ''consectetur'':24 ''creator'':2 ''description'':10 ''detailed'':9 ''dolor'':21 ''elit'':26 ''for'':11 ''ipsum'':20 ''is'':7 ''laptop'':5 ''lorem'':19 ''msi'':1 ''product'':16 ''sit'':22 ''studio'':4 ''this'':6 ''thiết'':12 ''tử'':15 ''z16p'':3 ''điện'':14'),
  (55, 'Lenovo ThinkPad X1 Carbon Gen 11', 13, 7, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 9 - 8165</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '390000', '10000', NULL, '420000', '2026-01-14T13:24:00.000Z', 1, 16, '2025-12-19T13:04:48.165Z', true, true, '''11'':6 ''8165'':19 ''9'':18 ''a'':9 ''adipiscing'':26 ''amet'':24 ''bị'':14 ''carbon'':4 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''gen'':5 ''ipsum'':21 ''is'':8 ''lenovo'':1 ''lorem'':20 ''product'':17 ''sit'':23 ''thinkpad'':2 ''this'':7 ''thiết'':13 ''tử'':16 ''x1'':3 ''điện'':15'),
  (56, 'Asus Vivobook S 15 OLED i7', 13, 7, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 10 - 8686</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        <div style="margin-top: 20px; border-top: 1px dashed #ccc; padding-top: 10px;">
            <p>
                <span style="background-color: #fff3cd; padding: 5px 10px; border-radius: 5px; font-weight: bold;">
                    ✏️ Cập nhật ngày: 22:12:59 19/12/2025
                </span>
            </p>
        </div>
    <p>test th&ecirc;m v&agrave;o m&ocirc; tả xem như thế n&agrave;o</p>', '910000', '10000', NULL, '30000', '2026-01-13T09:09:00.000Z', 1, 17, '2025-12-19T13:04:48.686Z', true, false, '''10'':18 ''12'':32 ''15'':4 ''19/12/2025'':34 ''22'':31 ''59'':33 ''8686'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''asus'':1 ''bị'':14 ''consectetur'':25 ''cập'':28 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''i7'':6 ''ipsum'':21 ''is'':8 ''lorem'':20 ''m'':37,40 ''n'':45 ''ngày'':30 ''như'':43 ''nhật'':29 ''o'':39,46 ''oled'':5 ''product'':17 ''s'':3 ''sit'':23 ''test'':35 ''th'':36 ''this'':7 ''thiết'':13 ''thế'':44 ''tả'':41 ''tử'':16 ''v'':38 ''vivobook'':2 ''xem'':42 ''điện'':15'),
  (57, 'Asus ROG Strix G16 Gaming Laptop', 13, 7, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 11 - 9190</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '360000', '10000', NULL, '0', '2026-01-14T12:37:00.000Z', 1, NULL, '2025-12-19T13:04:49.190Z', true, true, '''11'':18 ''9190'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''asus'':1 ''bị'':14 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''g16'':4 ''gaming'':5 ''ipsum'':21 ''is'':8 ''laptop'':6 ''lorem'':20 ''product'':17 ''rog'':2 ''sit'':23 ''strix'':3 ''this'':7 ''thiết'':13 ''tử'':16 ''điện'':15'),
  (58, 'Razer Blade 15 Advanced Gaming', 13, 7, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 12 - 9690</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '440000', '10000', NULL, '530000', '2026-01-13T05:10:00.000Z', 1, 15, '2025-12-19T13:04:49.690Z', true, false, '''12'':17 ''15'':3 ''9690'':18 ''a'':8 ''adipiscing'':25 ''advanced'':4 ''amet'':23 ''blade'':2 ''bị'':13 ''consectetur'':24 ''description'':10 ''detailed'':9 ''dolor'':21 ''elit'':26 ''for'':11 ''gaming'':5 ''ipsum'':20 ''is'':7 ''lorem'':19 ''product'':16 ''razer'':1 ''sit'':22 ''this'':6 ''thiết'':12 ''tử'':15 ''điện'':14'),
  (59, 'Surface Laptop Studio 2 i7 RTX 4050', 13, 7, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 13 - 0188</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '790000', '10000', NULL, '880000', '2026-01-18T07:15:00.000Z', 1, 15, '2025-12-19T13:04:50.188Z', true, false, '''0188'':20 ''13'':19 ''2'':4 ''4050'':7 ''a'':10 ''adipiscing'':27 ''amet'':25 ''bị'':15 ''consectetur'':26 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''i7'':5 ''ipsum'':22 ''is'':9 ''laptop'':2 ''lorem'':21 ''product'':18 ''rtx'':6 ''sit'':24 ''studio'':3 ''surface'':1 ''this'':8 ''thiết'':14 ''tử'':17 ''điện'':16'),
  (60, 'iPhone 13 128GB Midnight Chính Hãng', 13, 6, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 14 - 0689</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '760000', '10000', NULL, '790000', '2026-01-18T13:50:00.000Z', 1, 16, '2025-12-19T13:04:50.690Z', true, true, '''0689'':19 ''128gb'':3 ''13'':2 ''14'':18 ''a'':9 ''adipiscing'':26 ''amet'':24 ''bị'':14 ''chính'':5 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''hãng'':6 ''iphone'':1 ''ipsum'':21 ''is'':8 ''lorem'':20 ''midnight'':4 ''product'':17 ''sit'':23 ''this'':7 ''thiết'':13 ''tử'':16 ''điện'':15'),
  (61, 'OPPO Find N3 Flip Foldable 5G', 13, 6, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 15 - 1180</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '700000', '10000', NULL, '840000', '2026-01-14T15:15:00.000Z', 1, 14, '2025-12-19T13:04:51.180Z', true, true, '''1180'':19 ''15'':18 ''5g'':6 ''a'':9 ''adipiscing'':26 ''amet'':24 ''bị'':14 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''find'':2 ''flip'':4 ''foldable'':5 ''for'':12 ''ipsum'':21 ''is'':8 ''lorem'':20 ''n3'':3 ''oppo'':1 ''product'':17 ''sit'':23 ''this'':7 ''thiết'':13 ''tử'':16 ''điện'':15'),
  (62, 'iPhone 14 Pro 128GB Deep Purple', 13, 6, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 16 - 1669</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '110000', '10000', NULL, '180000', '2026-01-12T07:56:00.000Z', 1, 15, '2025-12-19T13:04:51.669Z', true, true, '''128gb'':4 ''14'':2 ''16'':18 ''1669'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''bị'':14 ''consectetur'':25 ''deep'':5 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''iphone'':1 ''ipsum'':21 ''is'':8 ''lorem'':20 ''pro'':3 ''product'':17 ''purple'':6 ''sit'':23 ''this'':7 ''thiết'':13 ''tử'':16 ''điện'':15'),
  (63, 'iPhone SE 2024 64GB Starlight', 13, 6, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 17 - 2161</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '650000', '10000', NULL, '750000', '2026-01-12T23:04:00.000Z', 1, 16, '2025-12-19T13:04:52.161Z', true, false, '''17'':17 ''2024'':3 ''2161'':18 ''64gb'':4 ''a'':8 ''adipiscing'':25 ''amet'':23 ''bị'':13 ''consectetur'':24 ''description'':10 ''detailed'':9 ''dolor'':21 ''elit'':26 ''for'':11 ''iphone'':1 ''ipsum'':20 ''is'':7 ''lorem'':19 ''product'':16 ''se'':2 ''sit'':22 ''starlight'':5 ''this'':6 ''thiết'':12 ''tử'':15 ''điện'':14'),
  (64, 'Vivo X100 Pro 16GB 512GB 5G', 13, 6, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 18 - 2652</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '630000', '10000', NULL, '730000', '2026-01-14T01:12:00.000Z', 1, 12, '2025-12-19T13:04:52.653Z', true, true, '''16gb'':4 ''18'':18 ''2652'':19 ''512gb'':5 ''5g'':6 ''a'':9 ''adipiscing'':26 ''amet'':24 ''bị'':14 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''ipsum'':21 ''is'':8 ''lorem'':20 ''pro'':3 ''product'':17 ''sit'':23 ''this'':7 ''thiết'':13 ''tử'':16 ''vivo'':1 ''x100'':2 ''điện'':15'),
  (65, 'Samsung Galaxy A55 5G 128GB', 13, 6, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 19 - 3143</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '220000', '10000', NULL, '0', '2026-01-12T00:59:00.000Z', 1, NULL, '2025-12-19T13:04:53.143Z', true, false, '''128gb'':5 ''19'':17 ''3143'':18 ''5g'':4 ''a'':8 ''a55'':3 ''adipiscing'':25 ''amet'':23 ''bị'':13 ''consectetur'':24 ''description'':10 ''detailed'':9 ''dolor'':21 ''elit'':26 ''for'':11 ''galaxy'':2 ''ipsum'':20 ''is'':7 ''lorem'':19 ''product'':16 ''samsung'':1 ''sit'':22 ''this'':6 ''thiết'':12 ''tử'':15 ''điện'':14'),
  (66, 'Xiaomi 14 Ultra 16GB 512GB Chính Hãng', 13, 6, '<p>This is a detailed description for <strong>Thiết bị điện tử - Product 20 - 3634</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '320000', '10000', NULL, '370000', '2026-01-18T08:35:00.000Z', 1, 14, '2025-12-19T13:04:53.634Z', true, false, '''14'':2 ''16gb'':4 ''20'':19 ''3634'':20 ''512gb'':5 ''a'':10 ''adipiscing'':27 ''amet'':25 ''bị'':15 ''chính'':6 ''consectetur'':26 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''hãng'':7 ''ipsum'':22 ''is'':9 ''lorem'':21 ''product'':18 ''sit'':24 ''this'':8 ''thiết'':14 ''tử'':17 ''ultra'':3 ''xiaomi'':1 ''điện'':16'),
  (67, 'Áo Khoác Jean Nam Washed Vintage', 13, 8, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 1 - 5208</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '150000', '10000', NULL, '330000', '2026-01-11T04:36:00.000Z', 1, 15, '2025-12-19T13:04:55.208Z', true, false, '''1'':18 ''5208'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''ipsum'':21 ''is'':8 ''jean'':3 ''khoác'':2 ''kiện'':16 ''lorem'':20 ''nam'':4 ''phụ'':15 ''product'':17 ''sit'':23 ''this'':7 ''thời'':13 ''trang'':14 ''vintage'':6 ''washed'':5 ''áo'':1'),
  (68, 'Áo Phông Nam Uniqlo Cotton Mềm Mại', 13, 8, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 2 - 5704</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '750000', '10000', NULL, '1130009', '2026-01-11T13:42:00.000Z', 1, 17, '2025-12-19T13:04:55.704Z', true, false, '''2'':19 ''5704'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''consectetur'':26 ''cotton'':5 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''ipsum'':22 ''is'':9 ''kiện'':17 ''lorem'':21 ''mại'':7 ''mềm'':6 ''nam'':3 ''phông'':2 ''phụ'':16 ''product'':18 ''sit'':24 ''this'':8 ''thời'':14 ''trang'':15 ''uniqlo'':4 ''áo'':1'),
  (69, 'Quần Chinos Nam Slimfit Beige', 13, 8, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 3 - 6196</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '420000', '10000', NULL, '540000', '2026-01-10T18:58:00.000Z', 1, 12, '2025-12-19T13:04:56.196Z', true, false, '''3'':17 ''6196'':18 ''a'':8 ''adipiscing'':25 ''amet'':23 ''beige'':5 ''chinos'':2 ''consectetur'':24 ''description'':10 ''detailed'':9 ''dolor'':21 ''elit'':26 ''for'':11 ''ipsum'':20 ''is'':7 ''kiện'':15 ''lorem'':19 ''nam'':3 ''phụ'':14 ''product'':16 ''quần'':1 ''sit'':22 ''slimfit'':4 ''this'':6 ''thời'':12 ''trang'':13'),
  (70, 'Áo Hoodie Oversize Unisex Basic', 13, 8, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 4 - 6691</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '120000', '10000', NULL, '330000', '2026-01-14T09:18:00.000Z', 1, 12, '2025-12-19T13:04:56.691Z', true, true, '''4'':17 ''6691'':18 ''a'':8 ''adipiscing'':25 ''amet'':23 ''basic'':5 ''consectetur'':24 ''description'':10 ''detailed'':9 ''dolor'':21 ''elit'':26 ''for'':11 ''hoodie'':2 ''ipsum'':20 ''is'':7 ''kiện'':15 ''lorem'':19 ''oversize'':3 ''phụ'':14 ''product'':16 ''sit'':22 ''this'':6 ''thời'':12 ''trang'':13 ''unisex'':4 ''áo'':1'),
  (71, 'Quần Jean Nữ Levi''s 501 Skinny', 13, 9, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 5 - 7197</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '610000', '10000', NULL, '790000', '2026-01-17T13:07:00.000Z', 1, 15, '2025-12-19T13:04:57.197Z', true, false, '''5'':19 ''501'':6 ''7197'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''consectetur'':26 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''ipsum'':22 ''is'':9 ''jean'':2 ''kiện'':17 ''levi'':4 ''lorem'':21 ''nữ'':3 ''phụ'':16 ''product'':18 ''quần'':1 ''s'':5 ''sit'':24 ''skinny'':7 ''this'':8 ''thời'':14 ''trang'':15'),
  (72, 'Áo Vest Nam 3 Lớp Cao Cấp', 13, 8, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 6 - 7692</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '810000', '10000', NULL, '830000', '2026-01-18T08:21:00.000Z', 1, 14, '2025-12-19T13:04:57.692Z', true, false, '''3'':4 ''6'':19 ''7692'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''cao'':6 ''consectetur'':26 ''cấp'':7 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''ipsum'':22 ''is'':9 ''kiện'':17 ''lorem'':21 ''lớp'':5 ''nam'':3 ''phụ'':16 ''product'':18 ''sit'':24 ''this'':8 ''thời'':14 ''trang'':15 ''vest'':2 ''áo'':1'),
  (73, 'Quần Thể Thao Nam Adidas 3 Sọc', 13, 8, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 7 - 8208</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '870000', '10000', NULL, '0', '2026-01-17T10:57:00.000Z', 1, NULL, '2025-12-19T13:04:58.208Z', true, false, '''3'':6 ''7'':19 ''8208'':20 ''a'':10 ''adidas'':5 ''adipiscing'':27 ''amet'':25 ''consectetur'':26 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''ipsum'':22 ''is'':9 ''kiện'':17 ''lorem'':21 ''nam'':4 ''phụ'':16 ''product'':18 ''quần'':1 ''sit'':24 ''sọc'':7 ''thao'':3 ''this'':8 ''thể'':2 ''thời'':14 ''trang'':15'),
  (74, 'Áo Sơ Mi Nam Công Sở Oxford Trắng', 13, 8, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 8 - 8697</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '870000', '10000', NULL, '1000000', '2026-01-18T15:34:00.000Z', 1, 12, '2025-12-19T13:04:58.697Z', true, true, '''8'':20 ''8697'':21 ''a'':11 ''adipiscing'':28 ''amet'':26 ''consectetur'':27 ''công'':5 ''description'':13 ''detailed'':12 ''dolor'':24 ''elit'':29 ''for'':14 ''ipsum'':23 ''is'':10 ''kiện'':18 ''lorem'':22 ''mi'':3 ''nam'':4 ''oxford'':7 ''phụ'':17 ''product'':19 ''sit'':25 ''sơ'':2 ''sở'':6 ''this'':9 ''thời'':15 ''trang'':16 ''trắng'':8 ''áo'':1'),
  (75, 'Quần Jean Nam Levi''s 511 Slim Fit', 13, 8, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 9 - 9226</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '400000', '10000', NULL, '470000', '2026-01-15T09:06:00.000Z', 1, 16, '2025-12-19T13:04:59.226Z', true, false, '''511'':6 ''9'':20 ''9226'':21 ''a'':11 ''adipiscing'':28 ''amet'':26 ''consectetur'':27 ''description'':13 ''detailed'':12 ''dolor'':24 ''elit'':29 ''fit'':8 ''for'':14 ''ipsum'':23 ''is'':10 ''jean'':2 ''kiện'':18 ''levi'':4 ''lorem'':22 ''nam'':3 ''phụ'':17 ''product'':19 ''quần'':1 ''s'':5 ''sit'':25 ''slim'':7 ''this'':9 ''thời'':15 ''trang'':16'),
  (76, 'Quần Short Kaki Nam The Blues', 13, 8, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 10 - 9718</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '890000', '10000', NULL, '1130000', '2026-01-11T16:56:00.000Z', 1, 16, '2025-12-19T13:04:59.718Z', true, true, '''10'':18 ''9718'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''blues'':6 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''ipsum'':21 ''is'':8 ''kaki'':3 ''kiện'':16 ''lorem'':20 ''nam'':4 ''phụ'':15 ''product'':17 ''quần'':1 ''short'':2 ''sit'':23 ''the'':5 ''this'':7 ''thời'':13 ''trang'':14'),
  (77, 'Quần Âu Nam Ống Suông Xám', 13, 8, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 11 - 0292</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '220000', '10000', NULL, '400000', '2026-01-12T07:13:00.000Z', 1, 16, '2025-12-19T13:05:00.292Z', true, true, '''0292'':19 ''11'':18 ''a'':9 ''adipiscing'':26 ''amet'':24 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''ipsum'':21 ''is'':8 ''kiện'':16 ''lorem'':20 ''nam'':3 ''phụ'':15 ''product'':17 ''quần'':1 ''sit'':23 ''suông'':5 ''this'':7 ''thời'':13 ''trang'':14 ''xám'':6 ''âu'':2 ''ống'':4'),
  (78, 'Váy Xòe Midi Xếp Ly Vintage', 13, 9, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 12 - 0782</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '470000', '10000', NULL, '610000', '2026-01-16T16:21:00.000Z', 1, 16, '2025-12-19T13:05:00.782Z', true, false, '''0782'':19 ''12'':18 ''a'':9 ''adipiscing'':26 ''amet'':24 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''ipsum'':21 ''is'':8 ''kiện'':16 ''lorem'':20 ''ly'':5 ''midi'':3 ''phụ'':15 ''product'':17 ''sit'':23 ''this'':7 ''thời'':13 ''trang'':14 ''vintage'':6 ''váy'':1 ''xòe'':2 ''xếp'':4'),
  (79, 'Quần Legging Nữ Lưng Cao Tập Yoga', 13, 9, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 13 - 1280</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '340000', '10000', NULL, '430000', '2026-01-15T08:38:00.000Z', 1, 15, '2025-12-19T13:05:01.280Z', true, false, '''1280'':20 ''13'':19 ''a'':10 ''adipiscing'':27 ''amet'':25 ''cao'':5 ''consectetur'':26 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''ipsum'':22 ''is'':9 ''kiện'':17 ''legging'':2 ''lorem'':21 ''lưng'':4 ''nữ'':3 ''phụ'':16 ''product'':18 ''quần'':1 ''sit'':24 ''this'':8 ''thời'':14 ''trang'':15 ''tập'':6 ''yoga'':7'),
  (80, 'Set Đồ Ngủ Lụa Cao Cấp', 13, 9, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 14 - 1787</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '760000', '10000', NULL, '900000', '2026-01-13T09:26:00.000Z', 1, 14, '2025-12-19T13:05:01.787Z', true, true, '''14'':18 ''1787'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''cao'':5 ''consectetur'':25 ''cấp'':6 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''ipsum'':21 ''is'':8 ''kiện'':16 ''lorem'':20 ''lụa'':4 ''ngủ'':3 ''phụ'':15 ''product'':17 ''set'':1 ''sit'':23 ''this'':7 ''thời'':13 ''trang'':14 ''đồ'':2'),
  (81, 'Váy Tennis Xếp Ly Trắng Hàn Quốc', 13, 9, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 15 - 2281</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '570000', '10000', NULL, '680000', '2026-01-13T02:54:00.000Z', 1, 15, '2025-12-19T13:05:02.281Z', true, true, '''15'':19 ''2281'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''consectetur'':26 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''hàn'':6 ''ipsum'':22 ''is'':9 ''kiện'':17 ''lorem'':21 ''ly'':4 ''phụ'':16 ''product'':18 ''quốc'':7 ''sit'':24 ''tennis'':2 ''this'':8 ''thời'':14 ''trang'':15 ''trắng'':5 ''váy'':1 ''xếp'':3'),
  (82, 'Bikini 2 Mảnh Cạp Cao Sexy', 13, 9, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 16 - 2785</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '920000', '10000', NULL, '960000', '2026-01-13T01:20:00.000Z', 1, 14, '2025-12-19T13:05:02.785Z', true, false, '''16'':18 ''2'':2 ''2785'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''bikini'':1 ''cao'':5 ''consectetur'':25 ''cạp'':4 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''ipsum'':21 ''is'':8 ''kiện'':16 ''lorem'':20 ''mảnh'':3 ''phụ'':15 ''product'':17 ''sexy'':6 ''sit'':23 ''this'':7 ''thời'':13 ''trang'':14'),
  (83, 'Đầm Dự Tiệc Đuôi Cá Đỏ Rượu', 13, 9, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 17 - 3282</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '860000', '10000', NULL, '1010000', '2026-01-12T08:57:00.000Z', 1, 12, '2025-12-19T13:05:03.282Z', true, true, '''17'':19 ''3282'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''consectetur'':26 ''cá'':5 ''description'':12 ''detailed'':11 ''dolor'':23 ''dự'':2 ''elit'':28 ''for'':13 ''ipsum'':22 ''is'':9 ''kiện'':17 ''lorem'':21 ''phụ'':16 ''product'':18 ''rượu'':7 ''sit'':24 ''this'':8 ''thời'':14 ''tiệc'':3 ''trang'':15 ''đuôi'':4 ''đầm'':1 ''đỏ'':6'),
  (84, 'Váy Bút Chì Midi Xẻ Tà', 13, 9, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 18 - 3779</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '380000', '10000', NULL, '600000', '2026-01-15T16:20:00.000Z', 1, 16, '2025-12-19T13:05:03.780Z', true, false, '''18'':18 ''3779'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''bút'':2 ''chì'':3 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''ipsum'':21 ''is'':8 ''kiện'':16 ''lorem'':20 ''midi'':4 ''phụ'':15 ''product'':17 ''sit'':23 ''this'':7 ''thời'':13 ''trang'':14 ''tà'':6 ''váy'':1 ''xẻ'':5'),
  (85, 'Váy Maxi Hoa Nhí Vintage Dáng Dài', 13, 9, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 19 - 4285</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '580000', '10000', NULL, '750000', '2026-01-12T21:04:00.000Z', 1, 16, '2025-12-19T13:05:04.285Z', true, false, '''19'':19 ''4285'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''consectetur'':26 ''description'':12 ''detailed'':11 ''dolor'':23 ''dài'':7 ''dáng'':6 ''elit'':28 ''for'':13 ''hoa'':3 ''ipsum'':22 ''is'':9 ''kiện'':17 ''lorem'':21 ''maxi'':2 ''nhí'':4 ''phụ'':16 ''product'':18 ''sit'':24 ''this'':8 ''thời'':14 ''trang'':15 ''vintage'':5 ''váy'':1'),
  (86, 'Đầm Công Sở Tay Dài Navy Blue', 13, 9, '<p>This is a detailed description for <strong>Thời trang & Phụ kiện - Product 20 - 4799</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '530000', '10000', NULL, '630000', '2026-01-12T23:32:00.000Z', 1, 16, '2025-12-19T13:05:04.799Z', true, true, '''20'':19 ''4799'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''blue'':7 ''consectetur'':26 ''công'':2 ''description'':12 ''detailed'':11 ''dolor'':23 ''dài'':5 ''elit'':28 ''for'':13 ''ipsum'':22 ''is'':9 ''kiện'':17 ''lorem'':21 ''navy'':6 ''phụ'':16 ''product'':18 ''sit'':24 ''sở'':3 ''tay'':4 ''this'':8 ''thời'':14 ''trang'':15 ''đầm'':1'),
  (87, 'Amazfit GTR 4 AMOLED Smartwatch', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 1 - 5957</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '570000', '10000', NULL, '670000', '2026-01-18T15:00:00.000Z', 1, 14, '2025-12-19T13:05:05.957Z', true, false, '''1'':17 ''4'':3 ''5957'':18 ''a'':8 ''adipiscing'':25 ''amazfit'':1 ''amet'':23 ''amoled'':4 ''consectetur'':24 ''description'':10 ''detailed'':9 ''dolor'':21 ''elit'':26 ''for'':11 ''gtr'':2 ''hồ'':13 ''ipsum'':20 ''is'':7 ''lorem'':19 ''product'':16 ''sit'':22 ''smartwatch'':5 ''sức'':15 ''this'':6 ''trang'':14 ''đồng'':12'),
  (88, 'Apple Watch Series 9 GPS 45mm Midnight', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 2 - 6498</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '720000', '10000', NULL, '870000', '2026-01-12T21:49:00.000Z', 1, 12, '2025-12-19T13:05:06.498Z', true, false, '''2'':19 ''45mm'':6 ''6498'':20 ''9'':4 ''a'':10 ''adipiscing'':27 ''amet'':25 ''apple'':1 ''consectetur'':26 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''gps'':5 ''hồ'':15 ''ipsum'':22 ''is'':9 ''lorem'':21 ''midnight'':7 ''product'':18 ''series'':3 ''sit'':24 ''sức'':17 ''this'':8 ''trang'':16 ''watch'':2 ''đồng'':14'),
  (89, 'Casio G-Shock GA-2100 Carbon Core Guard', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 3 - 7039</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '250000', '10000', NULL, '290000', '2026-01-11T19:39:00.000Z', 1, 14, '2025-12-19T13:05:07.039Z', true, false, '''-2100'':6 ''3'':21 ''7039'':22 ''a'':12 ''adipiscing'':29 ''amet'':27 ''carbon'':7 ''casio'':1 ''consectetur'':28 ''core'':8 ''description'':14 ''detailed'':13 ''dolor'':25 ''elit'':30 ''for'':15 ''g'':3 ''g-shock'':2 ''ga'':5 ''guard'':9 ''hồ'':17 ''ipsum'':24 ''is'':11 ''lorem'':23 ''product'':20 ''shock'':4 ''sit'':26 ''sức'':19 ''this'':10 ''trang'':18 ''đồng'':16'),
  (90, 'Daniel Wellington Classic Petite 32mm', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 4 - 7538</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '790000', '10000', NULL, '920000', '2026-01-10T22:09:00.000Z', 1, 15, '2025-12-19T13:05:07.538Z', true, false, '''32mm'':5 ''4'':17 ''7538'':18 ''a'':8 ''adipiscing'':25 ''amet'':23 ''classic'':3 ''consectetur'':24 ''daniel'':1 ''description'':10 ''detailed'':9 ''dolor'':21 ''elit'':26 ''for'':11 ''hồ'':13 ''ipsum'':20 ''is'':7 ''lorem'':19 ''petite'':4 ''product'':16 ''sit'':22 ''sức'':15 ''this'':6 ''trang'':14 ''wellington'':2 ''đồng'':12'),
  (91, 'Mido Ocean Star GMT Diver 600', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 5 - 8036</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '320000', '10000', NULL, '460000', '2026-01-12T15:38:00.000Z', 1, 14, '2025-12-19T13:05:08.036Z', true, false, '''5'':18 ''600'':6 ''8036'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''consectetur'':25 ''description'':11 ''detailed'':10 ''diver'':5 ''dolor'':22 ''elit'':27 ''for'':12 ''gmt'':4 ''hồ'':14 ''ipsum'':21 ''is'':8 ''lorem'':20 ''mido'':1 ''ocean'':2 ''product'':17 ''sit'':23 ''star'':3 ''sức'':16 ''this'':7 ''trang'':15 ''đồng'':13'),
  (92, 'Rolex Submariner Date 41mm Steel', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 6 - 8525</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '600000', '10000', NULL, '770000', '2026-01-14T10:33:00.000Z', 1, 16, '2025-12-19T13:05:08.525Z', true, true, '''41mm'':4 ''6'':17 ''8525'':18 ''a'':8 ''adipiscing'':25 ''amet'':23 ''consectetur'':24 ''date'':3 ''description'':10 ''detailed'':9 ''dolor'':21 ''elit'':26 ''for'':11 ''hồ'':13 ''ipsum'':20 ''is'':7 ''lorem'':19 ''product'':16 ''rolex'':1 ''sit'':22 ''steel'':5 ''submariner'':2 ''sức'':15 ''this'':6 ''trang'':14 ''đồng'':12'),
  (93, 'Hamilton Khaki Field Automatic', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 7 - 9022</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '690000', '10000', NULL, '0', '2026-01-13T16:39:00.000Z', 1, NULL, '2025-12-19T13:05:09.022Z', true, true, '''7'':16 ''9022'':17 ''a'':7 ''adipiscing'':24 ''amet'':22 ''automatic'':4 ''consectetur'':23 ''description'':9 ''detailed'':8 ''dolor'':20 ''elit'':25 ''field'':3 ''for'':10 ''hamilton'':1 ''hồ'':12 ''ipsum'':19 ''is'':6 ''khaki'':2 ''lorem'':18 ''product'':15 ''sit'':21 ''sức'':14 ''this'':5 ''trang'':13 ''đồng'':11'),
  (94, 'Longines Master Collection L2.793.4', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 8 - 9512</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '230000', '10000', NULL, '400000', '2026-01-13T17:06:00.000Z', 1, 14, '2025-12-19T13:05:09.512Z', true, true, '''8'':16 ''9512'':17 ''a'':7 ''adipiscing'':24 ''amet'':22 ''collection'':3 ''consectetur'':23 ''description'':9 ''detailed'':8 ''dolor'':20 ''elit'':25 ''for'':10 ''hồ'':12 ''ipsum'':19 ''is'':6 ''l2.793.4'':4 ''longines'':1 ''lorem'':18 ''master'':2 ''product'':15 ''sit'':21 ''sức'':14 ''this'':5 ''trang'':13 ''đồng'':11'),
  (95, 'Huawei Watch GT 4 46mm Active', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 9 - 0017</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '180000', '10000', NULL, '380000', '2026-01-12T21:22:00.000Z', 1, 12, '2025-12-19T13:05:10.017Z', true, true, '''0017'':19 ''4'':4 ''46mm'':5 ''9'':18 ''a'':9 ''active'':6 ''adipiscing'':26 ''amet'':24 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''gt'':3 ''huawei'':1 ''hồ'':14 ''ipsum'':21 ''is'':8 ''lorem'':20 ''product'':17 ''sit'':23 ''sức'':16 ''this'':7 ''trang'':15 ''watch'':2 ''đồng'':13'),
  (96, 'Tissot PRX Powermatic 80 Blue Dial', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 10 - 0520</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '350000', '10000', NULL, '470000', '2026-01-13T06:33:00.000Z', 1, 15, '2025-12-19T13:05:10.520Z', true, false, '''0520'':19 ''10'':18 ''80'':4 ''a'':9 ''adipiscing'':26 ''amet'':24 ''blue'':5 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dial'':6 ''dolor'':22 ''elit'':27 ''for'':12 ''hồ'':14 ''ipsum'':21 ''is'':8 ''lorem'':20 ''powermatic'':3 ''product'':17 ''prx'':2 ''sit'':23 ''sức'':16 ''this'':7 ''tissot'':1 ''trang'':15 ''đồng'':13'),
  (97, 'Samsung Galaxy Watch 6 Classic 47mm', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 11 - 1018</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '290000', '10000', NULL, '410000', '2026-01-16T15:33:00.000Z', 1, 14, '2025-12-19T13:05:11.018Z', true, true, '''1018'':19 ''11'':18 ''47mm'':6 ''6'':4 ''a'':9 ''adipiscing'':26 ''amet'':24 ''classic'':5 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''galaxy'':2 ''hồ'':14 ''ipsum'':21 ''is'':8 ''lorem'':20 ''product'':17 ''samsung'':1 ''sit'':23 ''sức'':16 ''this'':7 ''trang'':15 ''watch'':3 ''đồng'':13'),
  (98, 'Rado Captain Cook Automatic Bronze', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 12 - 1514</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '210000', '10000', NULL, '0', '2026-01-15T22:23:00.000Z', 1, NULL, '2025-12-19T13:05:11.514Z', true, true, '''12'':17 ''1514'':18 ''a'':8 ''adipiscing'':25 ''amet'':23 ''automatic'':4 ''bronze'':5 ''captain'':2 ''consectetur'':24 ''cook'':3 ''description'':10 ''detailed'':9 ''dolor'':21 ''elit'':26 ''for'':11 ''hồ'':13 ''ipsum'':20 ''is'':7 ''lorem'':19 ''product'':16 ''rado'':1 ''sit'':22 ''sức'':15 ''this'':6 ''trang'':14 ''đồng'':12'),
  (99, 'Fossil Gen 6 Smartwatch Stainless', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 13 - 2008</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '860000', '10000', NULL, '990000', '2026-01-15T14:55:00.000Z', 1, 14, '2025-12-19T13:05:12.008Z', true, false, '''13'':17 ''2008'':18 ''6'':3 ''a'':8 ''adipiscing'':25 ''amet'':23 ''consectetur'':24 ''description'':10 ''detailed'':9 ''dolor'':21 ''elit'':26 ''for'':11 ''fossil'':1 ''gen'':2 ''hồ'':13 ''ipsum'':20 ''is'':7 ''lorem'':19 ''product'':16 ''sit'':22 ''smartwatch'':4 ''stainless'':5 ''sức'':15 ''this'':6 ''trang'':14 ''đồng'':12'),
  (100, 'Orient Bambino Version 4 Classic', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 14 - 2511</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '620000', '10000', NULL, '660000', '2026-01-14T02:47:00.000Z', 1, 12, '2025-12-19T13:05:12.511Z', true, true, '''14'':17 ''2511'':18 ''4'':4 ''a'':8 ''adipiscing'':25 ''amet'':23 ''bambino'':2 ''classic'':5 ''consectetur'':24 ''description'':10 ''detailed'':9 ''dolor'':21 ''elit'':26 ''for'':11 ''hồ'':13 ''ipsum'':20 ''is'':7 ''lorem'':19 ''orient'':1 ''product'':16 ''sit'':22 ''sức'':15 ''this'':6 ''trang'':14 ''version'':3 ''đồng'':12'),
  (101, 'Bulova Lunar Pilot Chronograph', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 15 - 3009</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '470000', '10000', NULL, '710000', '2026-01-17T10:09:00.000Z', 1, 15, '2025-12-19T13:05:13.009Z', true, true, '''15'':16 ''3009'':17 ''a'':7 ''adipiscing'':24 ''amet'':22 ''bulova'':1 ''chronograph'':4 ''consectetur'':23 ''description'':9 ''detailed'':8 ''dolor'':20 ''elit'':25 ''for'':10 ''hồ'':12 ''ipsum'':19 ''is'':6 ''lorem'':18 ''lunar'':2 ''pilot'':3 ''product'':15 ''sit'':21 ''sức'':14 ''this'':5 ''trang'':13 ''đồng'':11'),
  (102, 'Citizen Eco-Drive Titanium AT2470', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 16 - 3498</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '610000', '10000', NULL, '770000', '2026-01-15T05:36:00.000Z', 1, 12, '2025-12-19T13:05:13.498Z', true, false, '''16'':18 ''3498'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''at2470'':6 ''citizen'':1 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''drive'':4 ''eco'':3 ''eco-drive'':2 ''elit'':27 ''for'':12 ''hồ'':14 ''ipsum'':21 ''is'':8 ''lorem'':20 ''product'':17 ''sit'':23 ''sức'':16 ''this'':7 ''titanium'':5 ''trang'':15 ''đồng'':13'),
  (103, 'Seiko 5 Sports Automatic SRPD55K1', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 17 - 3989</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '250000', '10000', NULL, '360000', '2026-01-16T17:55:00.000Z', 1, 16, '2025-12-19T13:05:13.989Z', true, false, '''17'':17 ''3989'':18 ''5'':2 ''a'':8 ''adipiscing'':25 ''amet'':23 ''automatic'':4 ''consectetur'':24 ''description'':10 ''detailed'':9 ''dolor'':21 ''elit'':26 ''for'':11 ''hồ'':13 ''ipsum'':20 ''is'':7 ''lorem'':19 ''product'':16 ''seiko'':1 ''sit'':22 ''sports'':3 ''srpd55k1'':5 ''sức'':15 ''this'':6 ''trang'':14 ''đồng'':12'),
  (104, 'Garmin Fenix 7X Sapphire Solar', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 18 - 4486</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '380000', '10000', NULL, '540000', '2026-01-12T21:09:00.000Z', 1, 12, '2025-12-19T13:05:14.486Z', true, false, '''18'':17 ''4486'':18 ''7x'':3 ''a'':8 ''adipiscing'':25 ''amet'':23 ''consectetur'':24 ''description'':10 ''detailed'':9 ''dolor'':21 ''elit'':26 ''fenix'':2 ''for'':11 ''garmin'':1 ''hồ'':13 ''ipsum'':20 ''is'':7 ''lorem'':19 ''product'':16 ''sapphire'':4 ''sit'':22 ''solar'':5 ''sức'':15 ''this'':6 ''trang'':14 ''đồng'':12'),
  (105, 'TAG Heuer Carrera Calibre Heuer 02', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 19 - 4986</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '210000', '10000', NULL, '370000', '2026-01-15T07:36:00.000Z', 1, 16, '2025-12-19T13:05:14.986Z', true, true, '''02'':6 ''19'':18 ''4986'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''calibre'':4 ''carrera'':3 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''heuer'':2,5 ''hồ'':14 ''ipsum'':21 ''is'':8 ''lorem'':20 ''product'':17 ''sit'':23 ''sức'':16 ''tag'':1 ''this'':7 ''trang'':15 ''đồng'':13'),
  (106, 'Omega Seamaster Diver 300M Co-Axial', 13, 10, '<p>This is a detailed description for <strong>Đồng hồ & Trang sức - Product 20 - 5518</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '840000', '10000', NULL, '1010000', '2026-01-18T08:26:00.000Z', 1, 16, '2025-12-19T13:05:15.518Z', true, true, '''20'':19 ''300m'':4 ''5518'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''axial'':7 ''co'':6 ''co-axial'':5 ''consectetur'':26 ''description'':12 ''detailed'':11 ''diver'':3 ''dolor'':23 ''elit'':28 ''for'':13 ''hồ'':15 ''ipsum'':22 ''is'':9 ''lorem'':21 ''omega'':1 ''product'':18 ''seamaster'':2 ''sit'':24 ''sức'':17 ''this'':8 ''trang'':16 ''đồng'':14'),
  (107, 'Bình Giữ Nhiệt Stanley 1L Inox', 13, 12, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 1 - 6585</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '950000', '10000', NULL, '1180000', '2026-01-11T22:52:00.000Z', 1, 16, '2025-12-19T13:05:16.585Z', true, true, '''1'':18 ''1l'':5 ''6585'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''bình'':1 ''consectetur'':25 ''cửa'':14 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''giữ'':2 ''inox'':6 ''ipsum'':21 ''is'':8 ''lorem'':20 ''nhiệt'':3 ''nhà'':13 ''product'':17 ''sit'':23 ''stanley'':4 ''sống'':16 ''this'':7 ''đời'':15'),
  (108, 'Rèm Cửa Vải Cao Cấp Chống Nắng', 13, 11, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 2 - 7088</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '680000', '10000', NULL, '870000', '2026-01-11T20:06:00.000Z', 1, 15, '2025-12-19T13:05:17.088Z', true, false, '''2'':19 ''7088'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''cao'':4 ''chống'':6 ''consectetur'':26 ''cấp'':5 ''cửa'':2,15 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''ipsum'':22 ''is'':9 ''lorem'':21 ''nhà'':14 ''nắng'':7 ''product'':18 ''rèm'':1 ''sit'':24 ''sống'':17 ''this'':8 ''vải'':3 ''đời'':16'),
  (109, 'Thảm Trải Sàn Nhung Nhật 2x3m', 13, 11, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 3 - 7587</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '810000', '10000', NULL, '1030000', '2026-01-17T07:21:00.000Z', 1, 14, '2025-12-19T13:05:17.587Z', true, true, '''2x3m'':6 ''3'':18 ''7587'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''consectetur'':25 ''cửa'':14 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''for'':12 ''ipsum'':21 ''is'':8 ''lorem'':20 ''nhung'':4 ''nhà'':13 ''nhật'':5 ''product'':17 ''sit'':23 ''sàn'':3 ''sống'':16 ''this'':7 ''thảm'':1 ''trải'':2 ''đời'':15'),
  (110, 'Ghế Sofa Đơn Bập Bênh Thư Giãn', 13, 11, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 4 - 8091</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '260000', '10000', NULL, '390000', '2026-01-17T13:01:00.000Z', 1, 14, '2025-12-19T13:05:18.091Z', true, true, '''4'':19 ''8091'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''bênh'':5 ''bập'':4 ''consectetur'':26 ''cửa'':15 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''ghế'':1 ''giãn'':7 ''ipsum'':22 ''is'':9 ''lorem'':21 ''nhà'':14 ''product'':18 ''sit'':24 ''sofa'':2 ''sống'':17 ''this'':8 ''thư'':6 ''đơn'':3 ''đời'':16'),
  (111, 'Bàn Trà Mặt Kính Chân Inox Sang', 13, 11, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 5 - 8680</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '170000', '10000', NULL, '200000', '2026-01-15T03:56:00.000Z', 1, 15, '2025-12-19T13:05:18.680Z', true, false, '''5'':19 ''8680'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''bàn'':1 ''chân'':5 ''consectetur'':26 ''cửa'':15 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''inox'':6 ''ipsum'':22 ''is'':9 ''kính'':4 ''lorem'':21 ''mặt'':3 ''nhà'':14 ''product'':18 ''sang'':7 ''sit'':24 ''sống'':17 ''this'':8 ''trà'':2 ''đời'':16'),
  (112, 'Kệ Tivi Gỗ Công Nghiệp 2m Đẹp', 13, 11, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 6 - 9174</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '160000', '10000', NULL, '220000', '2026-01-10T23:46:00.000Z', 1, 15, '2025-12-19T13:05:19.174Z', true, false, '''2m'':6 ''6'':19 ''9174'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''consectetur'':26 ''công'':4 ''cửa'':15 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''gỗ'':3 ''ipsum'':22 ''is'':9 ''kệ'':1 ''lorem'':21 ''nghiệp'':5 ''nhà'':14 ''product'':18 ''sit'':24 ''sống'':17 ''this'':8 ''tivi'':2 ''đẹp'':7 ''đời'':16'),
  (113, 'Tủ Giày Thông Minh 5 Tầng Nhỏ Gọn', 13, 11, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 7 - 9675</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '220000', '10000', NULL, '320000', '2026-01-11T02:29:00.000Z', 1, 16, '2025-12-19T13:05:19.675Z', true, true, '''5'':5 ''7'':20 ''9675'':21 ''a'':11 ''adipiscing'':28 ''amet'':26 ''consectetur'':27 ''cửa'':16 ''description'':13 ''detailed'':12 ''dolor'':24 ''elit'':29 ''for'':14 ''giày'':2 ''gọn'':8 ''ipsum'':23 ''is'':10 ''lorem'':22 ''minh'':4 ''nhà'':15 ''nhỏ'':7 ''product'':19 ''sit'':25 ''sống'':18 ''this'':9 ''thông'':3 ''tầng'':6 ''tủ'':1 ''đời'':17'),
  (114, 'Ghế Văn Phòng Ergonomic Lưới Thoáng', 13, 11, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 8 - 0239</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '110000', '10000', NULL, '150000', '2026-01-16T01:24:00.000Z', 1, 12, '2025-12-19T13:05:20.239Z', true, true, '''0239'':19 ''8'':18 ''a'':9 ''adipiscing'':26 ''amet'':24 ''consectetur'':25 ''cửa'':14 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''ergonomic'':4 ''for'':12 ''ghế'':1 ''ipsum'':21 ''is'':8 ''lorem'':20 ''lưới'':5 ''nhà'':13 ''phòng'':3 ''product'':17 ''sit'':23 ''sống'':16 ''this'':7 ''thoáng'':6 ''văn'':2 ''đời'':15'),
  (115, 'Tủ Bếp Acrylic Chữ I 3m Bóng Gương', 13, 11, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 9 - 0734</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '530000', '10000', NULL, '680000', '2026-01-14T00:09:00.000Z', 1, 14, '2025-12-19T13:05:20.734Z', true, true, '''0734'':21 ''3m'':6 ''9'':20 ''a'':11 ''acrylic'':3 ''adipiscing'':28 ''amet'':26 ''bóng'':7 ''bếp'':2 ''chữ'':4 ''consectetur'':27 ''cửa'':16 ''description'':13 ''detailed'':12 ''dolor'':24 ''elit'':29 ''for'':14 ''gương'':8 ''i'':5 ''ipsum'':23 ''is'':10 ''lorem'':22 ''nhà'':15 ''product'':19 ''sit'':25 ''sống'':18 ''this'':9 ''tủ'':1 ''đời'':17'),
  (116, 'Gương Đứng Toàn Thân Khung Gỗ 60x160cm', 13, 11, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 10 - 1228</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '340000', '10000', NULL, '560000', '2026-01-13T23:03:00.000Z', 1, 12, '2025-12-19T13:05:21.228Z', true, false, '''10'':19 ''1228'':20 ''60x160cm'':7 ''a'':10 ''adipiscing'':27 ''amet'':25 ''consectetur'':26 ''cửa'':15 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''gương'':1 ''gỗ'':6 ''ipsum'':22 ''is'':9 ''khung'':5 ''lorem'':21 ''nhà'':14 ''product'':18 ''sit'':24 ''sống'':17 ''this'':8 ''thân'':4 ''toàn'':3 ''đời'':16 ''đứng'':2'),
  (117, 'Tủ Quần Áo Cánh Lùa 2m4 Sang Trọng', 13, 11, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 11 - 1728</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '580000', '10000', NULL, '630000', '2026-01-17T04:14:00.000Z', 1, 15, '2025-12-19T13:05:21.728Z', true, true, '''11'':20 ''1728'':21 ''2m4'':6 ''a'':11 ''adipiscing'':28 ''amet'':26 ''consectetur'':27 ''cánh'':4 ''cửa'':16 ''description'':13 ''detailed'':12 ''dolor'':24 ''elit'':29 ''for'':14 ''ipsum'':23 ''is'':10 ''lorem'':22 ''lùa'':5 ''nhà'':15 ''product'':19 ''quần'':2 ''sang'':7 ''sit'':25 ''sống'':18 ''this'':9 ''trọng'':8 ''tủ'':1 ''áo'':3 ''đời'':17'),
  (118, 'Máy Pha Cà Phê Espresso Delonghi', 13, 12, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 12 - 2239</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '780000', '10000', NULL, '930000', '2026-01-18T10:37:00.000Z', 1, 16, '2025-12-19T13:05:22.239Z', true, true, '''12'':18 ''2239'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''consectetur'':25 ''cà'':3 ''cửa'':14 ''delonghi'':6 ''description'':11 ''detailed'':10 ''dolor'':22 ''elit'':27 ''espresso'':5 ''for'':12 ''ipsum'':21 ''is'':8 ''lorem'':20 ''máy'':1 ''nhà'':13 ''pha'':2 ''phê'':4 ''product'':17 ''sit'':23 ''sống'':16 ''this'':7 ''đời'':15'),
  (119, 'Thớt Gỗ Cao Su Tự Nhiên 40x30cm', 13, 12, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 13 - 2744</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '920000', '10000', NULL, '1030000', '2026-01-12T02:59:00.000Z', 1, 15, '2025-12-19T13:05:22.744Z', true, false, '''13'':19 ''2744'':20 ''40x30cm'':7 ''a'':10 ''adipiscing'':27 ''amet'':25 ''cao'':3 ''consectetur'':26 ''cửa'':15 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''gỗ'':2 ''ipsum'':22 ''is'':9 ''lorem'':21 ''nhiên'':6 ''nhà'':14 ''product'':18 ''sit'':24 ''su'':4 ''sống'':17 ''this'':8 ''thớt'':1 ''tự'':5 ''đời'':16'),
  (120, 'Bộ Ly Thủy Tinh Ocean 6 Cái', 13, 12, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 14 - 3234</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '170000', '10000', NULL, '0', '2026-01-11T17:34:00.000Z', 1, NULL, '2025-12-19T13:05:23.234Z', true, false, '''14'':19 ''3234'':20 ''6'':6 ''a'':10 ''adipiscing'':27 ''amet'':25 ''bộ'':1 ''consectetur'':26 ''cái'':7 ''cửa'':15 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''ipsum'':22 ''is'':9 ''lorem'':21 ''ly'':2 ''nhà'':14 ''ocean'':5 ''product'':18 ''sit'':24 ''sống'':17 ''this'':8 ''thủy'':3 ''tinh'':4 ''đời'':16'),
  (121, 'Máy Hút Mùi Bosch 90cm Công Suất Mạnh', 13, 12, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 15 - 3743</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '450000', '10000', NULL, '540000', '2026-01-15T09:36:00.000Z', 1, 12, '2025-12-19T13:05:23.743Z', true, false, '''15'':20 ''3743'':21 ''90cm'':5 ''a'':11 ''adipiscing'':28 ''amet'':26 ''bosch'':4 ''consectetur'':27 ''công'':6 ''cửa'':16 ''description'':13 ''detailed'':12 ''dolor'':24 ''elit'':29 ''for'':14 ''hút'':2 ''ipsum'':23 ''is'':10 ''lorem'':22 ''máy'':1 ''mùi'':3 ''mạnh'':8 ''nhà'':15 ''product'':19 ''sit'':25 ''suất'':7 ''sống'':18 ''this'':9 ''đời'':17'),
  (122, 'Bộ Hộp Đựng Thực Phẩm Lock&Lock 10 Món', 13, 12, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 16 - 4287</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '460000', '10000', NULL, '540000', '2026-01-10T20:31:00.000Z', 1, 12, '2025-12-19T13:05:24.287Z', true, true, '''10'':8 ''16'':21 ''4287'':22 ''a'':12 ''adipiscing'':29 ''amet'':27 ''bộ'':1 ''consectetur'':28 ''cửa'':17 ''description'':14 ''detailed'':13 ''dolor'':25 ''elit'':30 ''for'':15 ''hộp'':2 ''ipsum'':24 ''is'':11 ''lock'':6,7 ''lorem'':23 ''món'':9 ''nhà'':16 ''phẩm'':5 ''product'':20 ''sit'':26 ''sống'':19 ''this'':10 ''thực'':4 ''đời'':18 ''đựng'':3'),
  (123, 'Nồi Chiên Không Dầu Philips 6.2L', 13, 12, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 17 - 4786</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '200000', '10000', NULL, '330000', '2026-01-16T16:05:00.000Z', 1, 14, '2025-12-19T13:05:24.786Z', true, true, '''17'':19 ''4786'':20 ''6.2'':6 ''a'':10 ''adipiscing'':27 ''amet'':25 ''chiên'':2 ''consectetur'':26 ''cửa'':15 ''description'':12 ''detailed'':11 ''dolor'':23 ''dầu'':4 ''elit'':28 ''for'':13 ''ipsum'':22 ''is'':9 ''không'':3 ''l'':7 ''lorem'':21 ''nhà'':14 ''nồi'':1 ''philips'':5 ''product'':18 ''sit'':24 ''sống'':17 ''this'':8 ''đời'':16'),
  (124, 'Bình Đun Siêu Tốc Xiaomi 1.7L Thông Minh', 13, 12, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 18 - 5277</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '640000', '10000', NULL, '720000', '2026-01-13T20:24:00.000Z', 1, 15, '2025-12-19T13:05:25.277Z', true, true, '''1.7'':6 ''18'':21 ''5277'':22 ''a'':12 ''adipiscing'':29 ''amet'':27 ''bình'':1 ''consectetur'':28 ''cửa'':17 ''description'':14 ''detailed'':13 ''dolor'':25 ''elit'':30 ''for'':15 ''ipsum'':24 ''is'':11 ''l'':7 ''lorem'':23 ''minh'':9 ''nhà'':16 ''product'':20 ''sit'':26 ''siêu'':3 ''sống'':19 ''this'':10 ''thông'':8 ''tốc'':4 ''xiaomi'':5 ''đun'':2 ''đời'':18'),
  (125, 'Bình Lọc Nước Brita Marella 2.4L', 13, 12, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 19 - 5783</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '820000', '10000', NULL, '910000', '2026-01-13T04:50:00.000Z', 1, 14, '2025-12-19T13:05:25.783Z', true, true, '''19'':19 ''2.4'':6 ''5783'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''brita'':4 ''bình'':1 ''consectetur'':26 ''cửa'':15 ''description'':12 ''detailed'':11 ''dolor'':23 ''elit'':28 ''for'':13 ''ipsum'':22 ''is'':9 ''l'':7 ''lorem'':21 ''lọc'':2 ''marella'':5 ''nhà'':14 ''nước'':3 ''product'':18 ''sit'':24 ''sống'':17 ''this'':8 ''đời'':16'),
  (126, 'Chảo Chống Dính Tefal 28cm Titanium', 13, 12, '<p>This is a detailed description for <strong>Nhà cửa & Đời sống - Product 20 - 6285</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '150000', '10000', NULL, '280000', '2026-01-15T09:20:00.000Z', 1, 14, '2025-12-19T13:05:26.285Z', true, false, '''20'':18 ''28cm'':5 ''6285'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''chảo'':1 ''chống'':2 ''consectetur'':25 ''cửa'':14 ''description'':11 ''detailed'':10 ''dolor'':22 ''dính'':3 ''elit'':27 ''for'':12 ''ipsum'':21 ''is'':8 ''lorem'':20 ''nhà'':13 ''product'':17 ''sit'':23 ''sống'':16 ''tefal'':4 ''this'':7 ''titanium'':6 ''đời'':15'),
  (127, 'Máy Chạy Bộ Điện BFT-8899 5.5HP', 13, 13, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 1 - 7515</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '930000', '10000', NULL, '990000', '2026-01-13T13:07:00.000Z', 1, 12, '2025-12-19T13:05:27.515Z', true, false, '''-8899'':6 ''1'':20 ''5.5'':7 ''7515'':21 ''a'':11 ''adipiscing'':28 ''amet'':26 ''bft'':5 ''bộ'':3 ''chạy'':2 ''consectetur'':27 ''description'':13 ''detailed'':12 ''dolor'':24 ''dã'':17 ''elit'':29 ''for'':14 ''hp'':8 ''ipsum'':23 ''is'':10 ''lorem'':22 ''máy'':1 ''ngoại'':18 ''product'':19 ''sit'':25 ''thao'':16 ''this'':9 ''thể'':15 ''điện'':4'),
  (128, 'Bóng Tập Yoga Gym Ball 65cm', 13, 13, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 2 - 8006</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '940000', '10000', NULL, '1010000', '2026-01-15T15:00:00.000Z', 1, 16, '2025-12-19T13:05:28.006Z', true, true, '''2'':18 ''65cm'':6 ''8006'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''ball'':5 ''bóng'':1 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''dã'':15 ''elit'':27 ''for'':12 ''gym'':4 ''ipsum'':21 ''is'':8 ''lorem'':20 ''ngoại'':16 ''product'':17 ''sit'':23 ''thao'':14 ''this'':7 ''thể'':13 ''tập'':2 ''yoga'':3'),
  (129, 'Găng Tay Tập Gym Thoáng Khí', 13, 13, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 3 - 8495</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '950000', '10000', NULL, '1140000', '2026-01-17T16:46:00.000Z', 1, 16, '2025-12-19T13:05:28.495Z', true, true, '''3'':18 ''8495'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''dã'':15 ''elit'':27 ''for'':12 ''gym'':4 ''găng'':1 ''ipsum'':21 ''is'':8 ''khí'':6 ''lorem'':20 ''ngoại'':16 ''product'':17 ''sit'':23 ''tay'':2 ''thao'':14 ''this'':7 ''thoáng'':5 ''thể'':13 ''tập'':3'),
  (130, 'Tạ Tay Nhựa 5kg/Đôi Màu Sắc', 13, 13, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 4 - 9025</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '560000', '10000', NULL, '720000', '2026-01-18T10:32:00.000Z', 1, 14, '2025-12-19T13:05:29.025Z', true, true, '''4'':19 ''5kg'':4 ''9025'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''consectetur'':26 ''description'':12 ''detailed'':11 ''dolor'':23 ''dã'':16 ''elit'':28 ''for'':13 ''ipsum'':22 ''is'':9 ''lorem'':21 ''màu'':6 ''ngoại'':17 ''nhựa'':3 ''product'':18 ''sit'':24 ''sắc'':7 ''tay'':2 ''thao'':15 ''this'':8 ''thể'':14 ''tạ'':1 ''đôi'':5'),
  (131, 'Túi Ngủ Mùa Đông -10°C Có Mũ Trùm', 13, 14, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 5 - 9516</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '940000', '10000', NULL, '1100000', '2026-01-16T19:17:00.000Z', 1, 15, '2025-12-19T13:05:29.516Z', true, false, '''-10'':5 ''5'':21 ''9516'':22 ''a'':12 ''adipiscing'':29 ''amet'':27 ''c'':6 ''consectetur'':28 ''có'':7 ''description'':14 ''detailed'':13 ''dolor'':25 ''dã'':18 ''elit'':30 ''for'':15 ''ipsum'':24 ''is'':11 ''lorem'':23 ''mùa'':3 ''mũ'':8 ''ngoại'':19 ''ngủ'':2 ''product'':20 ''sit'':26 ''thao'':17 ''this'':10 ''thể'':16 ''trùm'':9 ''túi'':1 ''đông'':4'),
  (132, 'Bàn Bóng Bàn 729 Competition Gấp Gọn', 13, 13, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 6 - 0079</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '450000', '10000', NULL, '0', '2026-01-17T09:27:00.000Z', 1, NULL, '2025-12-19T13:05:30.079Z', true, false, '''0079'':20 ''6'':19 ''729'':4 ''a'':10 ''adipiscing'':27 ''amet'':25 ''bàn'':1,3 ''bóng'':2 ''competition'':5 ''consectetur'':26 ''description'':12 ''detailed'':11 ''dolor'':23 ''dã'':16 ''elit'':28 ''for'':13 ''gấp'':6 ''gọn'':7 ''ipsum'':22 ''is'':9 ''lorem'':21 ''ngoại'':17 ''product'':18 ''sit'':24 ''thao'':15 ''this'':8 ''thể'':14'),
  (133, 'Giày Chạy Bộ Nike Zoom Pegasus 40', 13, 13, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 7 - 0623</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '260000', '10000', NULL, '0', '2026-01-13T23:46:00.000Z', 1, NULL, '2025-12-19T13:05:30.623Z', true, true, '''0623'':20 ''40'':7 ''7'':19 ''a'':10 ''adipiscing'':27 ''amet'':25 ''bộ'':3 ''chạy'':2 ''consectetur'':26 ''description'':12 ''detailed'':11 ''dolor'':23 ''dã'':16 ''elit'':28 ''for'':13 ''giày'':1 ''ipsum'':22 ''is'':9 ''lorem'':21 ''ngoại'':17 ''nike'':4 ''pegasus'':6 ''product'':18 ''sit'':24 ''thao'':15 ''this'':8 ''thể'':14 ''zoom'':5'),
  (134, 'Ghế Tập Gym Đa Năng 7 Tư Thế', 13, 13, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 8 - 1114</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '720000', '10000', NULL, '970000', '2026-01-14T01:15:00.000Z', 1, 12, '2025-12-19T13:05:31.114Z', true, false, '''1114'':21 ''7'':6 ''8'':20 ''a'':11 ''adipiscing'':28 ''amet'':26 ''consectetur'':27 ''description'':13 ''detailed'':12 ''dolor'':24 ''dã'':17 ''elit'':29 ''for'':14 ''ghế'':1 ''gym'':3 ''ipsum'':23 ''is'':10 ''lorem'':22 ''ngoại'':18 ''năng'':5 ''product'':19 ''sit'':25 ''thao'':16 ''this'':9 ''thế'':8 ''thể'':15 ''tư'':7 ''tập'':2 ''đa'':4'),
  (135, 'Băng Cổ Tay Thể Thao LP Support', 13, 13, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 9 - 1608</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '610000', '10000', NULL, '720000', '2026-01-12T03:27:00.000Z', 1, 16, '2025-12-19T13:05:31.609Z', true, false, '''1608'':20 ''9'':19 ''a'':10 ''adipiscing'':27 ''amet'':25 ''băng'':1 ''consectetur'':26 ''cổ'':2 ''description'':12 ''detailed'':11 ''dolor'':23 ''dã'':16 ''elit'':28 ''for'':13 ''ipsum'':22 ''is'':9 ''lorem'':21 ''lp'':6 ''ngoại'':17 ''product'':18 ''sit'':24 ''support'':7 ''tay'':3 ''thao'':5,15 ''this'':8 ''thể'':4,14'),
  (136, 'Vợt Cầu Lông Yonex Astrox 99 Pro', 13, 13, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 10 - 2112</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '870000', '10000', NULL, '1020000', '2026-01-16T05:07:00.000Z', 1, 14, '2025-12-19T13:05:32.112Z', true, true, '''10'':19 ''2112'':20 ''99'':6 ''a'':10 ''adipiscing'':27 ''amet'':25 ''astrox'':5 ''consectetur'':26 ''cầu'':2 ''description'':12 ''detailed'':11 ''dolor'':23 ''dã'':16 ''elit'':28 ''for'':13 ''ipsum'':22 ''is'':9 ''lorem'':21 ''lông'':3 ''ngoại'':17 ''pro'':7 ''product'':18 ''sit'':24 ''thao'':15 ''this'':8 ''thể'':14 ''vợt'':1 ''yonex'':4'),
  (137, 'Xe Đạp Tập Thể Dục Spin Bike Pro', 13, 13, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 11 - 2607</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '860000', '10000', NULL, '880000', '2026-01-11T18:19:00.000Z', 1, 14, '2025-12-19T13:05:32.607Z', true, false, '''11'':20 ''2607'':21 ''a'':11 ''adipiscing'':28 ''amet'':26 ''bike'':7 ''consectetur'':27 ''description'':13 ''detailed'':12 ''dolor'':24 ''dã'':17 ''dục'':5 ''elit'':29 ''for'':14 ''ipsum'':23 ''is'':10 ''lorem'':22 ''ngoại'':18 ''pro'':8 ''product'':19 ''sit'':25 ''spin'':6 ''thao'':16 ''this'':9 ''thể'':4,15 ''tập'':3 ''xe'':1 ''đạp'':2'),
  (138, 'Bếp Gas Mini Du Lịch Gấp Gọn', 13, 14, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 12 - 3100</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '730000', '10000', NULL, '10000', '2026-01-10T21:49:00.000Z', 1, 17, '2025-12-19T13:05:33.101Z', true, true, '''12'':19 ''3100'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''bếp'':1 ''consectetur'':26 ''description'':12 ''detailed'':11 ''dolor'':23 ''du'':4 ''dã'':16 ''elit'':28 ''for'':13 ''gas'':2 ''gấp'':6 ''gọn'':7 ''ipsum'':22 ''is'':9 ''lorem'':21 ''lịch'':5 ''mini'':3 ''ngoại'':17 ''product'':18 ''sit'':24 ''thao'':15 ''this'':8 ''thể'':14'),
  (139, 'Gối Hơi Camping Tự Phồng', 13, 14, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 13 - 3601</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '820000', '10000', NULL, '1010000', '2026-01-17T11:34:00.000Z', 1, 15, '2025-12-19T13:05:33.601Z', true, true, '''13'':17 ''3601'':18 ''a'':8 ''adipiscing'':25 ''amet'':23 ''camping'':3 ''consectetur'':24 ''description'':10 ''detailed'':9 ''dolor'':21 ''dã'':14 ''elit'':26 ''for'':11 ''gối'':1 ''hơi'':2 ''ipsum'':20 ''is'':7 ''lorem'':19 ''ngoại'':15 ''phồng'':5 ''product'':16 ''sit'':22 ''thao'':13 ''this'':6 ''thể'':12 ''tự'':4'),
  (140, 'Ghế Dã Ngoại Xếp Gọn Có Lưng', 13, 14, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 14 - 4108</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '970000', '10000', NULL, '1150000', '2026-01-14T07:15:00.000Z', 1, 14, '2025-12-19T13:05:34.108Z', true, true, '''14'':19 ''4108'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''consectetur'':26 ''có'':6 ''description'':12 ''detailed'':11 ''dolor'':23 ''dã'':2,16 ''elit'':28 ''for'':13 ''ghế'':1 ''gọn'':5 ''ipsum'':22 ''is'':9 ''lorem'':21 ''lưng'':7 ''ngoại'':3,17 ''product'':18 ''sit'':24 ''thao'':15 ''this'':8 ''thể'':14 ''xếp'':4'),
  (141, 'Giày Leo Núi Trekking Outdoor', 13, 14, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 15 - 4601</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '550000', '10000', NULL, '590000', '2026-01-16T23:50:00.000Z', 1, 15, '2025-12-19T13:05:34.601Z', true, true, '''15'':17 ''4601'':18 ''a'':8 ''adipiscing'':25 ''amet'':23 ''consectetur'':24 ''description'':10 ''detailed'':9 ''dolor'':21 ''dã'':14 ''elit'':26 ''for'':11 ''giày'':1 ''ipsum'':20 ''is'':7 ''leo'':2 ''lorem'':19 ''ngoại'':15 ''núi'':3 ''outdoor'':5 ''product'':16 ''sit'':22 ''thao'':13 ''this'':6 ''thể'':12 ''trekking'':4'),
  (142, 'Áo Mưa Bộ Cao Cấp Vải Dù', 13, 14, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 16 - 5096</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '760000', '10000', NULL, '830000', '2026-01-10T22:41:00.000Z', 1, 16, '2025-12-19T13:05:35.096Z', true, false, '''16'':19 ''5096'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''bộ'':3 ''cao'':4 ''consectetur'':26 ''cấp'':5 ''description'':12 ''detailed'':11 ''dolor'':23 ''dã'':16 ''dù'':7 ''elit'':28 ''for'':13 ''ipsum'':22 ''is'':9 ''lorem'':21 ''mưa'':2 ''ngoại'':17 ''product'':18 ''sit'':24 ''thao'':15 ''this'':8 ''thể'':14 ''vải'':6 ''áo'':1'),
  (143, 'Bình Nước Thể Thao 2L BPA Free', 13, 14, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 17 - 5640</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '150000', '10000', NULL, '240000', '2026-01-12T13:44:00.000Z', 1, 16, '2025-12-19T13:05:35.640Z', true, true, '''17'':19 ''2l'':5 ''5640'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''bpa'':6 ''bình'':1 ''consectetur'':26 ''description'':12 ''detailed'':11 ''dolor'':23 ''dã'':16 ''elit'':28 ''for'':13 ''free'':7 ''ipsum'':22 ''is'':9 ''lorem'':21 ''ngoại'':17 ''nước'':2 ''product'':18 ''sit'':24 ''thao'':4,15 ''this'':8 ''thể'':3,14'),
  (144, 'Bếp Cồn Mini Portable Camping', 13, 14, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 18 - 6152</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '710000', '10000', NULL, '790000', '2026-01-17T09:11:00.000Z', 1, 12, '2025-12-19T13:05:36.152Z', true, true, '''18'':17 ''6152'':18 ''a'':8 ''adipiscing'':25 ''amet'':23 ''bếp'':1 ''camping'':5 ''consectetur'':24 ''cồn'':2 ''description'':10 ''detailed'':9 ''dolor'':21 ''dã'':14 ''elit'':26 ''for'':11 ''ipsum'':20 ''is'':7 ''lorem'':19 ''mini'':3 ''ngoại'':15 ''portable'':4 ''product'':16 ''sit'':22 ''thao'':13 ''this'':6 ''thể'':12'),
  (145, 'La Bàn Compass Định Hướng Chuyên Dụng', 13, 14, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 19 - 6648</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '660000', '10000', NULL, '730000', '2026-01-11T23:08:00.000Z', 1, 16, '2025-12-19T13:05:36.648Z', true, true, '''19'':19 ''6648'':20 ''a'':10 ''adipiscing'':27 ''amet'':25 ''bàn'':2 ''chuyên'':6 ''compass'':3 ''consectetur'':26 ''description'':12 ''detailed'':11 ''dolor'':23 ''dã'':16 ''dụng'':7 ''elit'':28 ''for'':13 ''hướng'':5 ''ipsum'':22 ''is'':9 ''la'':1 ''lorem'':21 ''ngoại'':17 ''product'':18 ''sit'':24 ''thao'':15 ''this'':8 ''thể'':14 ''định'':4'),
  (146, 'Máy Lọc Nước Dã Ngoại LifeStraw', 13, 14, '<p>This is a detailed description for <strong>Thể thao & Dã ngoại - Product 20 - 7138</strong>.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', '940000', '10000', NULL, '1020000', '2026-01-15T16:26:00.000Z', 1, 15, '2025-12-19T13:05:37.138Z', true, false, '''20'':18 ''7138'':19 ''a'':9 ''adipiscing'':26 ''amet'':24 ''consectetur'':25 ''description'':11 ''detailed'':10 ''dolor'':22 ''dã'':4,15 ''elit'':27 ''for'':12 ''ipsum'':21 ''is'':8 ''lifestraw'':6 ''lorem'':20 ''lọc'':2 ''máy'':1 ''ngoại'':5,16 ''nước'':3 ''product'':17 ''sit'':23 ''thao'':14 ''this'':7 ''thể'':13'),
  (148, 'Logitech MX Master 3S Wireless Mouse', 13, 1, '<h2>Nơi những &yacute; tưởng thăng hoa</h2>
<p>Mang đến cảm gi&aacute;c viết như tr&ecirc;n giấy cho h&agrave;nh tr&igrave;nh ghi ch&eacute;p của bạn. Kindle Scribe được t&aacute;i thiết kế để tối ưu sự thoải m&aacute;i khi cầm nắm, tăng cường độ nhạy v&agrave; mang lại trải nghiệm viết v&agrave; đọc tuyệt vời. M&agrave;n h&igrave;nh 11 inch sắc n&eacute;t, chống l&oacute;a gi&uacute;p bạn tập trung l&agrave;m việc. Sử dụng AI để t&igrave;m kiếm, t&oacute;m tắt, tinh chỉnh v&agrave; nhận được những hiểu biết s&acirc;u sắc từ sổ tay của bạn, tất cả đều kh&ocirc;ng bị l&agrave;m phiền bởi th&ocirc;ng b&aacute;o hay mạng x&atilde; hội.</p>
<p>&nbsp;</p>
<p><img src="https://akishop.com.vn/mediacenter/media/1453/files/kindle-scribe-khong-den-nen%20(9).gif" alt="" width="640" height="480"></p>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-4">
<div class="content">
<p><strong>Mỏng hơn</strong></p>
<p>Chỉ 5,4mm &mdash; mỏng hơn một chiếc b&uacute;t ch&igrave;.</p>
</div>
</div>
<div class="col col-md-4">
<div class="content">
<p><strong>Nhẹ hơn</strong></p>
<p>Nặng 400g, nhẹ hơn cả một cuốn sổ tay.</p>
</div>
</div>
<div class="col col-md-4">
<div class="content">
<p><strong>Nhanh hơn</strong></p>
<p>Gi&uacute;p lật trang nhanh ch&oacute;ng v&agrave; viết tr&ocirc;i chảy.</p>
</div>
</div>
</div>
</div>
<h2>Nghĩ l&agrave; viết.</h2>
<p>Chỉ cần cầm chiếc b&uacute;t kh&ocirc;ng cần pin v&agrave; bắt đầu. M&agrave;n h&igrave;nh chống l&oacute;a c&oacute; độ sần mang lại cảm gi&aacute;c viết ch&acirc;n thực như mực thật tr&ecirc;n giấy, tạo n&ecirc;n trải nghiệm liền mạch gi&uacute;p bạn tập trung suy nghĩ.</p>
<p><img src="https://akishop.com.vn/mediacenter/media/1453/files/kindle-scribe-khong-den-nen%20(8).gif" alt="" width="640" height="480"></p>
<h2><strong>Một cuốn sổ th&ocirc;ng minh</strong></h2>
<p>Viết dễ d&agrave;ng như tr&ecirc;n giấy, sau đ&oacute; sử dụng AI để t&igrave;m kiếm, t&oacute;m tắt v&agrave; tạo ra những hiểu biết s&acirc;u sắc từ sổ ghi ch&eacute;p của bạn. Tinh chỉnh b&agrave;i viết của bạn v&agrave; chuyển đổi th&agrave;nh văn bản để dễ d&agrave;ng chia sẻ.</p>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-3">
<div class="content">
<p><img src="https://akishop.com.vn/mediacenter/media/1453/files/kindle-scribe-khong-den-nen%20(5).jpg" alt="" width="250" height="293"></p>
<p>&nbsp;</p>
</div>
</div>
<div class="col col-md-3">
<div class="content">
<p><img src="https://akishop.com.vn/mediacenter/media/1453/files/kindle-scribe-khong-den-nen%20(6).jpg" alt="" width="250" height="293"></p>
<p>&nbsp;</p>
</div>
</div>
<div class="col col-md-3">
<div class="content">
<p><img src="https://akishop.com.vn/mediacenter/media/1453/files/kindle-scribe-khong-den-nen%20(2)(1).jpg" alt="" width="250" height="293"></p>
<p>&nbsp;</p>
</div>
</div>
<div class="col col-md-3">
<div class="content">
<p><img src="https://akishop.com.vn/mediacenter/media/1453/files/kindle-scribe-khong-den-nen%20(7).jpg" alt="" width="250" height="293"></p>
<p>&nbsp;</p>
</div>
</div>
</div>
<div class="row row-2">
<div class="col col-md-3">
<div class="content">
<p><strong>N&acirc;ng cấp trải nghiệm giấy</strong></p>
<p>Tận hưởng mọi sự tự do của giấy&mdash;c&ugrave;ng với khả năng chỉnh sửa, t&igrave;m kiếm v&agrave; số trang kh&ocirc;ng giới hạn.</p>
</div>
</div>
<div class="col col-md-3">
<div class="content">
<p><strong>C&ocirc;ng cụ AI</strong></p>
<p>AI t&igrave;m kiếm, t&oacute;m tắt v&agrave; kh&aacute;m ph&aacute; những hiểu biết s&acirc;u sắc từ ghi ch&uacute; của bạn.</p>
</div>
</div>
<div class="col col-md-3">
<div class="content">
<p><strong>T&igrave;m kiếm ghi ch&uacute;</strong></p>
<p>T&igrave;m kiếm xuy&ecirc;n suốt c&aacute;c ghi ch&uacute; viết tay của bạn.</p>
</div>
</div>
<div class="col col-md-3">
<div class="content">
<p><strong>Chuyển đổi th&agrave;nh văn bản</strong></p>
<p>Chia sẻ c&aacute;c ghi ch&uacute; viết tay của bạn dưới dạng văn bản.</p>
</div>
</div>
</div>
</div>
<h2>Quy tr&igrave;nh l&agrave;m việc</h2>
<p>Dễ d&agrave;ng nhập t&agrave;i liệu từ Google Drive hoặc Microsoft OneDrive, ghi ch&uacute;, đ&aacute;nh dấu v&agrave; xuất lại dưới dạng PDF.</p>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><img src="https://akishop.com.vn/mediacenter/media/1453/files/kindle-scribe-khong-den-nen%20(4).jpg" alt="" width="450" height="450"></p>
<p>&nbsp;</p>
</div>
</div>
<div class="col col-md-6">
<div class="content">
<p><img src="https://akishop.com.vn/mediacenter/media/1453/files/kindle-scribe-khong-den-nen%20(3).jpg" alt="" width="450" height="450"></p>
<p>&nbsp;</p>
</div>
</div>
</div>
<div class="row row-2">
<div class="col col-md-6">
<div class="content">
<p><strong>Tệp PDF, dễ d&agrave;ng chỉnh sửa</strong></p>
<p>Dễ d&agrave;ng xem lại tệp PDF, đ&aacute;nh dấu những nội dung quan trọng v&agrave; viết trực tiếp l&ecirc;n trang để chỉnh sửa nhanh.</p>
</div>
</div>
<div class="col col-md-6">
<div class="content">
<p><strong>T&agrave;i liệu Word, được xử l&yacute; lại</strong></p>
<p>Đ&aacute;nh dấu v&agrave; gạch ch&acirc;n văn bản trong t&agrave;i liệu Microsoft Word, hoặc sử dụng t&iacute;nh năng Active Canvas để viết v&agrave;o giữa c&aacute;c d&ograve;ng khi văn bản xung quanh tự động di chuyển để tạo kh&ocirc;ng gian cho ghi ch&uacute; của bạn.</p>
</div>
</div>
</div>
</div>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><strong>Tạo dấu ấn của bạn</strong></p>
</div>
</div>
<div class="col col-md-6">
<div class="content">
<p>Viết, gạch dưới v&agrave; đ&aacute;nh dấu ngay trong khi đọc &mdash; tr&ecirc;n lề s&aacute;ch, bất cứ l&uacute;c n&agrave;o cảm hứng đến. Kindle Scribe lu&ocirc;n c&oacute; đủ kh&ocirc;ng gian cho mọi &yacute; tưởng của bạn, d&ugrave; ch&uacute;ng xuất hiện ở đ&acirc;u.</p>
</div>
</div>
</div>
</div>
<p><img src="https://akishop.com.vn/mediacenter/media/1453/files/kindle-scribe-khong-den-nen%20(1).jpg" alt="" width="768" height="432"></p>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><strong>Chỉ cần viết</strong></p>
<p>Bắt đầu viết trong một cuốn s&aacute;ch hoặc t&agrave;i liệu Microsoft Word, v&agrave; Active Canvas sẽ tự động dịch chuyển văn bản để tạo kh&ocirc;ng gian cho c&aacute;c ghi ch&uacute; của bạn. Bạn cũng c&oacute; thể ghi ch&uacute; v&agrave;o lề v&agrave; mở rộng hoặc thu gọn ch&uacute;ng để xem lại trang gốc.</p>
</div>
</div>
<div class="col col-md-6">
<div class="content">
<p><strong>Theo d&otilde;i</strong></p>
<p>Đ&aacute;nh dấu, gạch dưới v&agrave; ch&uacute; th&iacute;ch những cuốn s&aacute;ch y&ecirc;u th&iacute;ch của bạn để giữ cho suy nghĩ được sắp xếp gọn g&agrave;ng v&agrave; dễ d&agrave;ng xem lại.</p>
</div>
</div>
</div>
</div>
<h2><strong>Bắt tay v&agrave;o c&ocirc;ng việc, một c&aacute;ch an to&agrave;n</strong></h2>
<p>Kindle Scribe kết hợp khả năng viết kh&ocirc;ng bị xao nh&atilde;ng, truy cập t&agrave;i liệu liền mạch v&agrave; c&aacute;c t&iacute;nh năng bảo mật để gi&uacute;p c&aacute;c nh&oacute;m l&agrave;m việc hiệu quả v&agrave; bảo vệ dữ liệu.</p>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><img src="https://akishop.com.vn/mediacenter/media/1453/files/amazon-kindle-scribe-colorsoft%20(6).jpg" alt="" width="450" height="563"></p>
<p>&nbsp;</p>
</div>
</div>
<div class="col col-md-6">
<div class="content">
<p><strong>Lưu trữ đ&aacute;m m&acirc;y</strong></p>
<p>Tất cả ghi ch&uacute; của bạn được lưu trữ an to&agrave;n v&agrave; sao lưu tr&ecirc;n đ&aacute;m m&acirc;y, v&igrave; vậy bạn sẽ kh&ocirc;ng bao giờ mất ch&uacute;ng ngay cả khi l&agrave;m mất thiết bị.</p>
<p><strong>M&atilde; h&oacute;a dữ liệu</strong></p>
<p>Dữ liệu tr&ecirc;n thiết bị của bạn, cũng như dữ liệu được truyền đến m&aacute;y chủ Amazon, đều được m&atilde; h&oacute;a ho&agrave;n to&agrave;n.</p>
<p><strong>M&atilde; kh&oacute;a bảo mật</strong></p>
<p>Đặt m&atilde; PIN để bảo vệ ghi ch&uacute; của bạn khỏi truy cập tr&aacute;i ph&eacute;p. M&atilde; PIN của bạn được lưu trữ an to&agrave;n tr&ecirc;n thiết bị.</p>
<p><strong>Chống giả mạo</strong></p>
<p>Chỉ phần mềm được ủy quyền mới c&oacute; thể chạy, gi&uacute;p bảo vệ thiết bị khỏi bị giả mạo.</p>
<p><strong>Hẹn giờ ngủ</strong></p>
<p>Khi kh&ocirc;ng hoạt động, m&agrave;n h&igrave;nh của bạn sẽ tự động tắt để giảm rủi ro bảo mật.</p>
<p>&nbsp;</p>
</div>
</div>
</div>
</div>
<h2><strong>Kho s&aacute;ch khổng lồ</strong></h2>
<p>Kho s&aacute;ch Kindle cung cấp quyền truy cập ngay lập tức v&agrave;o hơn 15 triệu đầu s&aacute;ch tr&ecirc;n to&agrave;n thế giới, bao gồm cả những cuốn s&aacute;ch b&aacute;n chạy nhất v&agrave; c&aacute;c cuốn s&aacute;ch độc quyền của Kindle m&agrave; bạn kh&ocirc;ng thể t&igrave;m thấy ở bất kỳ nơi n&agrave;o kh&aacute;c&mdash;bao gồm cả những tựa s&aacute;ch m&agrave; bạn c&oacute; thể viết l&ecirc;n. Th&ecirc;m Kindle Unlimited để đọc nhiều s&aacute;ch trong số đ&oacute; bất cứ l&uacute;c n&agrave;o.</p>
<p><img src="https://akishop.com.vn/mediacenter/media/1453/files/amazon-kindle-scribe-colorsoft%20(12).png" alt="" width="768" height="257"></p>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><strong>Kindle Unlimited</strong></p>
<p>Truy cập hơn 4 triệu đầu s&aacute;ch, h&agrave;ng ngh&igrave;n s&aacute;ch n&oacute;i, tạp ch&iacute;</p>
<p>&nbsp;</p>
</div>
</div>
<div class="col col-md-6">
<div class="content">
<p><strong>Viết l&ecirc;n trang</strong></p>
<p>Kh&aacute;m ph&aacute; h&agrave;ng trăm s&aacute;ch b&agrave;i tập, nhật k&yacute; v&agrave; c&acirc;u đố &ocirc; chữ m&agrave; bạn c&oacute; thể viết l&ecirc;n&mdash;tất cả đều được chọn lọc để hoạt động ho&agrave;n hảo với Kindle Scribe của bạn.</p>
<p>&nbsp;</p>
</div>
</div>
</div>
</div>
<h2><strong>Phong c&aacute;ch của ri&ecirc;ng bạn</strong></h2>
<p>C&aacute;c phụ kiện để c&aacute; nh&acirc;n h&oacute;a Kindle Scribe v&agrave; gi&uacute;p bạn viết một c&aacute;ch tốt nhất.</p>
<p><img src="https://akishop.com.vn/mediacenter/media/1453/files/amazon-kindle-scribe-colorsoft%20(4).jpg" alt="" width="768" height="432"></p>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><strong>Được bảo vệ</strong></p>
<p>Chọn từ hai loại bao da: một loại c&oacute; thể gập để dựng m&aacute;y, loại c&ograve;n lại nằm phẳng để viết như một cuốn sổ tay. Cả hai đều gắn từ t&iacute;nh để chuyển đổi liền mạch giữa việc đọc v&agrave; viết.</p>
<p>&nbsp;</p>
</div>
</div>
<div class="col col-md-6">
<div class="content">
<p><strong>Lu&ocirc;n sắc n&eacute;t</strong></p>
<p>Thay ng&ograve;i mới để b&uacute;t Premium Pen của bạn lu&ocirc;n c&oacute; cảm gi&aacute;c mới mẻ v&agrave; ch&iacute;nh x&aacute;c.</p>
</div>
</div>
</div>
</div>', '10000000', '100000', '20000000', '10200000', '2026-01-16T05:02:00.000Z', 1, 17, '2025-12-19T16:33:10.328Z', true, true, '''11'':67 ''15'':891 ''3s'':4 ''4'':976 ''400g'':142 ''4mm'':131 ''5'':130 ''a'':74,186,757,783,790,1053 ''active'':469,569 ''ai'':85,237,315,316 ''amazon'':778 ''an'':661,724,817 ''b'':121,136,171,263,909,1003,1124 ''bao'':742,902,939,1073 ''biết'':100,250,329 ''bạn'':31,77,108,214,260,267,337,356,372,498,503,542,589,590,633,720,738,767,802,813,860,924,947,1014,1036,1043,1059,1129 ''bản'':274,362,376,456,482,577 ''bảo'':690,705,791,797,839,869,1067 ''bất'':520,932,965 ''bắt'':178,554,651 ''bị'':114,673,754,765,823,842,844 ''bởi'':118 ''c'':16,187,194,295,312,349,350,365,366,476,477,523,533,584,585,592,655,659,685,686,695,696,834,914,915,938,948,968,1009,1015,1038,1044,1045,1049,1062,1077,1085,1132,1135,1142 ''canvas'':470,570 ''ch'':28,138,157,196,257,335,342,352,368,397,453,496,519,544,561,587,595,605,621,623,627,631,660,718,745,800,873,878,895,908,918,945,961,980,986,990,1002,1039,1063,1139 ''chia'':279,363 ''chiếc'':135,170 ''cho'':22,494,538,583,636 ''chuyển'':269,357,488,575,1105 ''chạy'':836,911 ''chảy'':163 ''chỉ'':129,167,551,827 ''chỉnh'':94,262,300,412,437 ''chọn'':1024,1069 ''chống'':72,184,824 ''chủ'':777 ''chữ'':1012 ''cung'':880 ''cuốn'':147,220,559,625,906,916,1094 ''cũng'':591,768 ''cường'':50 ''cả'':110,145,716,748,904,941,1021,1097 ''cảm'':14,192,526,1133 ''cấp'':283,881 ''cầm'':47,169 ''cần'':168,175,552 ''cập'':678,805,884,974 ''cụ'':314 ''của'':30,107,259,266,293,336,355,371,497,502,541,588,632,719,766,801,812,859,921,1035,1040,1128 ''cứ'':521,966 ''d'':227,277,384,410,415,478,543,613,647 ''da'':1074 ''di'':487 ''do'':292 ''drive'':392 ''dung'':426 ''dưới'':373,404,506,619 ''dạng'':374,405 ''dấu'':400,423,450,500,510,617 ''dễ'':226,276,383,409,414,646 ''dịch'':574 ''dụng'':84,236,465 ''dữ'':707,758,760,770 ''dựng'':1081 ''g'':643 ''ghi'':27,256,334,341,351,367,396,495,586,594,717,799 ''gi'':15,75,152,193,212,693,837,1057,1134 ''gian'':493,537,582 ''giả'':825,845 ''giảm'':866 ''giấy'':21,204,232,286,294 ''giới'':310,901 ''giờ'':743,848 ''giữ'':635 ''giữa'':475,1109 ''google'':391 ''gạch'':452,505,618 ''gập'':1079 ''gắn'':1100 ''gọn'':604,642 ''gốc'':611 ''gồm'':903,940 ''h'':23,65,182,756,782,857,981,998,1052 ''hai'':1071,1098 ''hay'':123 ''hiểu'':99,249,328 ''hiện'':547 ''hiệu'':702 ''ho'':784,1029 ''hoa'':11 ''hoạt'':853,1027 ''hoặc'':393,463,562,602 ''hơn'':128,133,140,144,151,890,975 ''hưởng'':288 ''hạn'':311 ''hảo'':1031 ''hẹn'':847 ''hội'':126 ''hợp'':667 ''hứng'':527 ''i'':36,45,162,264,388,441,459,564,614,680,807,988,1004,1121 ''inch'':68 ''k'':1007 ''kh'':112,173,308,324,491,535,580,671,740,789,851,925,937,995 ''khi'':46,480,513,749,850 ''kho'':871,876 ''khả'':298,668 ''khỏi'':803,843 ''khổng'':874 ''kindle'':32,529,664,879,922,955,971,1033,1054 ''kiếm'':89,241,304,319,340,345 ''kiện'':1047 ''kế'':38 ''kết'':666 ''kỳ'':933 ''l'':73,80,115,165,185,380,433,446,522,699,750,951,967,992,1018 ''liền'':210,682,1107 ''liệu'':389,442,460,565,681,708,759,761,771 ''logitech'':1 ''loại'':1072,1076,1084 ''lu'':531,1114,1130 ''lưu'':709,722,729,815 ''lại'':55,191,403,418,447,609,650,1087 ''lập'':886 ''lật'':154 ''lề'':517,598 ''lọc'':1025 ''lồ'':875 ''m'':44,63,81,88,91,116,180,240,243,303,318,321,325,339,344,381,698,700,712,713,733,734,751,755,775,781,788,794,810,855,923,929,946,954,996,1013,1082 ''mang'':12,54,190 ''master'':3 ''microsoft'':394,461,566 ''minh'':224 ''mouse'':6 ''mx'':2 ''mạch'':211,683,1108 ''mạng'':124 ''mạo'':826,846 ''mất'':744,752 ''mật'':691,792,870 ''mẻ'':1137 ''mềm'':829 ''mọi'':289,539 ''mỏng'':127,132 ''một'':134,146,219,558,658,1061,1075,1093 ''mới'':833,1122,1136 ''mở'':600 ''mực'':200 ''n'':20,64,70,181,197,203,206,207,231,281,347,434,454,516,524,532,663,726,731,763,785,787,819,821,856,897,899,910,935,952,969,984,987,993,1019,1030,1051,1086,1115,1117,1131 ''ng'':113,120,158,174,223,228,278,282,296,309,313,385,411,416,479,492,536,545,581,606,644,648,656,672,676,741,746,852,926,982,999,1042,1120 ''ngay'':511,747,885 ''ngh'':983 ''nghiệm'':57,209,285 ''nghĩ'':164,218,638 ''ngủ'':849 ''nh'':24,26,66,183,272,360,379,399,422,449,467,509,616,675,688,697,858,1050,1103,1140 ''nhanh'':150,156,439 ''nhiều'':959 ''như'':18,199,229,769,1092 ''nhạy'':52 ''nhất'':912,1065 ''nhận'':96 ''nhập'':386 ''nhật'':1006 ''nhẹ'':139,143 ''những'':8,98,248,327,424,624,905,942 ''năng'':299,468,669,689 ''nơi'':7,934 ''nắm'':48 ''nằm'':1088 ''nặng'':141 ''nội'':425 ''o'':122,474,525,597,654,889,936,970 ''onedrive'':395 ''p'':29,76,153,213,258,694,809,838,1058 ''pdf'':406,408,420 ''pen'':1127 ''ph'':326,808,997 ''phiền'':117 ''phong'':1037 ''phần'':828 ''phẳng'':1089 ''phụ'':1046 ''pin'':176,795,811 ''premium'':1126 ''quan'':427 ''quanh'':484 ''quy'':377 ''quyền'':832,882,920 ''quả'':703 ''ra'':247 ''ri'':1041 ''ro'':868 ''rộng'':601 ''rủi'':867 ''s'':101,251,330,518,560,626,872,877,894,907,917,944,960,979,985,1001 ''sao'':728 ''sau'':233 ''scribe'':33,530,665,1034,1055 ''suy'':217,637 ''suốt'':348 ''sần'':189 ''sắc'':69,103,253,332,1116 ''sắp'':640 ''sẻ'':280,364 ''sẽ'':571,739,861 ''số'':306,963 ''sổ'':105,148,221,255,1095 ''sử'':83,235,464 ''sửa'':301,413,438 ''sự'':42,290 ''t'':35,71,87,90,137,172,239,242,302,317,320,338,343,387,440,458,466,563,679,687,928,1102,1118,1125 ''tay'':106,149,354,370,652,1096 ''th'':119,222,271,359,622,630,953 ''thay'':1119 ''theo'':612 ''thiết'':37,753,764,822,841 ''thoải'':43 ''thu'':603 ''thăng'':10 ''thấy'':930 ''thật'':201 ''thế'':900 ''thể'':593,835,927,949,1016,1078 ''thực'':198 ''tinh'':93,261 ''tiếp'':432 ''to'':662,725,786,818,898 ''tr'':19,25,161,202,230,378,515,730,762,806,820,896 ''trang'':155,307,435,610,994 ''triệu'':892,977 ''trong'':457,512,557,962 ''trung'':79,216 ''truy'':677,804,883,973 ''truyền'':773 ''trăm'':1000 ''trải'':56,208,284 ''trọng'':428 ''trữ'':710,723,816 ''trực'':431 ''tuyệt'':61 ''tăng'':49 ''tưởng'':9,540 ''tạo'':205,246,490,499,579 ''tạp'':989 ''tất'':109,715,1020 ''tận'':287 ''tập'':78,215,1005 ''tắt'':92,244,322,864 ''tệp'':407,419 ''tối'':40 ''tốt'':1064 ''tức'':887 ''từ'':104,254,333,390,1070,1101 ''tự'':291,485,572,862 ''tựa'':943 ''u'':102,252,331,550,629,1010 ''unlimited'':956,972 ''v'':53,59,95,159,177,245,268,305,323,401,429,451,473,507,568,596,599,620,645,653,684,704,727,736,888,913,1008,1056,1112,1138 ''viết'':17,58,160,166,195,225,265,353,369,430,472,504,553,556,670,950,991,1017,1060,1091,1113 ''việc'':82,382,657,701,1110 ''văn'':273,361,375,455,481,576 ''vậy'':737 ''vệ'':706,798,840,1068 ''với'':297,1032 ''vời'':62 ''wireless'':5 ''word'':443,462,567 ''x'':125,1141 ''xao'':674 ''xem'':417,608,649 ''xung'':483 ''xuy'':346 ''xuất'':402,546 ''xếp'':641 ''xử'':445 ''y'':628,714,735,776,1083 ''đ'':234,398,421,448,508,549,615,711,732,964 ''được'':34,97,444,639,721,772,780,814,830,1023,1066 ''đầu'':179,555,893,978 ''đặt'':793 ''đến'':13,528,774 ''đều'':111,779,1022,1099 ''để'':39,86,238,275,436,471,489,578,607,634,692,796,865,957,1026,1048,1080,1090,1104,1123 ''đọc'':60,514,958,1111 ''đố'':1011 ''đổi'':270,358,1106 ''độ'':51,188 ''độc'':919 ''động'':486,573,854,863,1028 ''đủ'':534 ''ưu'':41 ''ấn'':501 ''ở'':548,931 ''ủy'':831'),
  (149, 'Bose SoundLink Flex Bluetooth Speaker', 13, 1, '<p>Khiến những suy nghĩ của bạn sinh động hơn nhờ&nbsp;m&agrave;u&nbsp;sắc</p>
<p>Mang lại trải nghiệm đọc s&aacute;ch ch&acirc;n thật như tr&ecirc;n giấy in</p>
<p>&nbsp;</p>
<p>Kh&ocirc;ng chỉ mang đến trải nghiệm đọc tr&ecirc;n giấy thật, Kobo Libra Color mang đến sắc m&agrave;u gần gũi hơn bất kỳ thiết bị E Ink n&agrave;o kh&aacute;c. Với khả năng tương th&iacute;ch Kobo Stylus 2 gi&uacute;p trải nghiệm viết, ghi ch&uacute; đến c&aacute;c t&aacute;c phẩm nghệ thuật trở n&ecirc;n ho&agrave;n hảo, tinh tế hơn.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><img src="https://static1.pocketlintimages.com/wordpress/wp-content/uploads/2024/04/kobo-libra-colour.jpg" alt="A Kobo Libra Colour laying on a couch" width="1000" height="563"></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><strong>Trải nghiệm đọc&nbsp;s&aacute;ch điện tử đầy đủ m&agrave;u sắc</strong></p>
<p>M&agrave;n h&igrave;nh k&iacute;ch thước 7 inch của Kobo Color mang đến trải nghiệm m&agrave;u sắc với bảng m&agrave;u nhẹ nh&agrave;ng E Ink Kaleido&trade; 3 cho chất lượng hiển thị rất đẹp, ph&iacute;m chuyển trang gi&uacute;p lật nhanh hơn tr&ecirc;n m&agrave;n h&igrave;nh mở rộng.</p>
<p>&nbsp;</p>
</div>
</div>
<div class="col col-md-6">
<div class="content">
<p><img src="https://akishop.com.vn/mediacenter/media/1453/images/fn-1024x768.jpg" alt="" width="450" height="338"></p>
</div>
</div>
</div>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><img src="https://akishop.com.vn/mediacenter/media/1453/images/ve-1024x576.jpg" alt="" width="450" height="253"></p>
</div>
</div>
<div class="col col-md-6">
<div class="content">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><strong>L&ecirc;n &yacute; tưởng ghi ch&uacute; với bảng m&agrave;u đa dạng</strong></p>
<p>Với khả năng tương th&iacute;ch Kobo Stylus 2 &nbsp;bạn c&oacute; thể đ&aacute;nh dấu v&agrave; t&ocirc; m&agrave;u l&ecirc;n trang s&aacute;ch của m&igrave;nh. Th&ecirc;m chiều s&acirc;u cho phong c&aacute;ch của ri&ecirc;ng bạn bằng c&aacute;ch gạch ch&acirc;n c&aacute;c d&ograve;ng truyền cảm hứng v&agrave; mang lại một số c&aacute; t&iacute;nh cho c&aacute;c trang của bạn.</p>
<p>&nbsp;</p>
</div>
</div>
</div>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><strong>Nhật k&yacute;,&nbsp;kế hoạch h&agrave;ng ng&agrave;y, chuẩn bị c&ocirc;ng việc h&agrave;ng ng&agrave;y v&agrave; hơn thế nữa</strong></p>
<p>Cho d&ugrave; bạn đang ghi lại một ghi ch&uacute; c&acirc;u lạc bộ s&aacute;ch, một mục nhật k&yacute; hay một suy nghĩ đầy cảm hứng &mdash; điều đ&oacute; chưa bao giờ dễ d&agrave;ng v&agrave; th&uacute; vị hơn với sổ ghi ch&eacute;p t&iacute;ch hợp của Kobo v&agrave; Kobo Stylus 2&sup1;. Dễ d&agrave;ng chia sẻ suy nghĩ của bạn bằng m&agrave;u sắc (hoặc kh&ocirc;ng bao giờ mất ch&uacute;ng) với sổ ghi ch&eacute;p được sao lưu tr&ecirc;n Đ&aacute;m m&acirc;y Kobo v&agrave; kết nối với Dropbox hoặc Google Drive.</p>
<p>&nbsp;</p>
</div>
</div>
<div class="col col-md-6">
<div class="content">
<p><img src="https://akishop.com.vn/mediacenter/media/1453/images/ke-hoach-879x1024.jpg" alt="" width="450" height="524"></p>
<p>&nbsp;</p>
</div>
</div>
</div>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>Trải nghiệm đọc s&aacute;ch kh&ocirc;ng giới hạn với Kobo Libra Colour</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><img src="https://gl.kobobooks.com/cdn/shop/files/battery_icon_libra_colour.jpg?v=1711477638&amp;width=200" alt="" width="100" height="100"></p>
</div>
</div>
<div class="col col-md-6">
<div class="content">
<p>&nbsp;</p>
<p>C&oacute; thể lưu trữ&nbsp;tới 24.000 s&aacute;ch điện tử hoặc 150 s&aacute;ch n&oacute;i Kobo với 32GB dung lượng lưu trữ v&agrave; tận hưởng thời lượng pin h&agrave;ng tuần</p>
</div>
</div>
</div>
</div>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><img src="https://gl.kobobooks.com/cdn/shop/files/audio_icon_clara_colour.jpg?v=1711477632&amp;width=200" alt="" width="100" height="100"></p>
</div>
</div>
<div class="col col-md-6">
<div class="content">
<p>&nbsp;</p>
<p>Nghe S&aacute;ch n&oacute;i Kobo với c&ocirc;ng nghệ kh&ocirc;ng d&acirc;y Bluetooth&reg; t&iacute;ch hợp</p>
</div>
</div>
</div>
</div>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><img src="https://gl.kobobooks.com/cdn/shop/files/collection_icon_clara_colour.jpg?v=1711477632&amp;width=200" alt="" width="100" height="100"></p>
</div>
</div>
<div class="col col-md-6">
<div class="content">
<p>&nbsp;</p>
<p>Đắm ch&igrave;m v&agrave;o&nbsp;bộ sưu tập s&aacute;ch điện tử v&agrave; s&aacute;ch n&oacute;i phong ph&uacute; của Cửa h&agrave;ng Kobo</p>
</div>
</div>
</div>
</div>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><img src="https://gl.kobobooks.com/cdn/shop/files/overdrive_icon_clara_colour.jpg?v=1711477632&amp;width=200" alt="" width="100" height="100"></p>
</div>
</div>
<div class="col col-md-6">
<div class="content">
<p>&nbsp;</p>
<p>Th&ecirc;m s&aacute;ch điện tử v&agrave; t&agrave;i liệu của ri&ecirc;ng bạn v&agrave;o thiết bị đọc s&aacute;ch điện tử của bạn bằng Google Drive v&agrave; Dropbox t&iacute;ch hợp</p>
</div>
</div>
</div>
</div>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><img src="https://gl.kobobooks.com/cdn/shop/files/pocket_icon_clara_colour.jpg?v=1711477632&amp;width=200" alt="" width="100" height="100"></p>
</div>
</div>
<div class="col col-md-6">
<div class="content">
<p>&nbsp;</p>
<p>Sử dụng Pocket để lưu c&aacute;c b&agrave;i viết trực tuyến để đọc ngoại tuyến l&uacute;c rảnh rỗi</p>
</div>
</div>
</div>
</div>
<div class="btgrid">
<div class="row row-1">
<div class="col col-md-6">
<div class="content">
<p><img src="https://gl.kobobooks.com/cdn/shop/files/style_icon_clara_colour.jpg?v=1711477632&amp;width=200" alt="" width="115" height="114"></p>
</div>
</div>
<div class="col col-md-6">
<div class="content">
<p>&nbsp;</p>
<p>Điều chỉnh k&iacute;ch thước ph&ocirc;ng chữ, lề v&agrave; thay đổi kiểu ph&ocirc;ng chữ để c&oacute; trải nghiệm đọc t&ugrave;y chỉnh</p>
</div>
</div>
</div>
</div>
        <div style="margin-top: 20px; border-top: 1px dashed #ccc; padding-top: 10px;">
            <p>
                <span style="background-color: #fff3cd; padding: 5px 10px; border-radius: 5px; font-weight: bold;">
                    ✏️ Cập nhật ngày: 00:51:26 20/12/2025
                </span>
            </p>
        </div>
    <p><strong>đ&acirc;y l&agrave; một m&ocirc; tả&nbsp;</strong></p>', '1000000', '10000', '10000000', '1010000', '2026-01-14T12:30:00.000Z', 1, 13, '2025-12-19T17:50:02.026Z', true, true, '''00'':528 ''150'':385 ''2'':75,185,316 ''20/12/2025'':531 ''24.000'':379 ''26'':530 ''3'':141 ''32gb'':392 ''51'':529 ''7'':119 ''b'':488 ''bao'':294,333 ''bluetooth'':4,420 ''bose'':1 ''bạn'':11,186,216,243,267,325,461,472 ''bảng'':132,172 ''bất'':57 ''bằng'':217,326,473 ''bị'':60,253,465 ''bộ'':277,429 ''c'':66,84,85,87,187,211,218,223,224,235,239,240,254,274,374,413,486,487,498,518 ''ch'':25,26,72,82,104,117,170,182,200,212,219,221,273,279,306,309,336,341,365,381,387,408,422,425,433,438,451,468,479,504 ''chia'':320 ''chiều'':206 ''cho'':142,209,238,265 ''chuyển'':151 ''chuẩn'':252 ''chưa'':293 ''chất'':143 ''chỉ'':36 ''chỉnh'':502,524 ''chữ'':508,516 ''color'':48,123 ''colour'':373 ''cảm'':228,289 ''cập'':525 ''của'':10,121,201,213,242,311,324,443,458,471 ''cửa'':444 ''d'':225,266,297,318,418 ''drive'':360,475 ''dropbox'':357,477 ''dung'':393 ''dạng'':176 ''dấu'':191 ''dễ'':296,317 ''dụng'':482 ''e'':61,138 ''flex'':3 ''ghi'':81,169,269,272,305,340 ''gi'':76,153 ''giấy'':32,44 ''giới'':368 ''giờ'':295,334 ''google'':359,474 ''gũi'':55 ''gạch'':220 ''gần'':54 ''h'':114,162,248,257,403,445 ''hay'':284 ''hiển'':145 ''ho'':94 ''hoạch'':247 ''hoặc'':330,358,384 ''hơn'':14,56,99,157,262,302 ''hưởng'':399 ''hạn'':369 ''hảo'':96 ''hợp'':310,423,480 ''hứng'':229,290 ''i'':389,410,440,456,489 ''in'':33 ''inch'':120 ''ink'':62,139 ''k'':116,245,283,503 ''kaleido'':140 ''kh'':34,65,331,366,416 ''khiến'':6 ''khả'':68,178 ''kiểu'':513 ''kobo'':46,73,122,183,312,314,352,371,390,411,447 ''kế'':246 ''kết'':354 ''kỳ'':58 ''l'':166,196,497,534 ''libra'':47,372 ''liệu'':457 ''lưu'':345,376,395,485 ''lượng'':144,394,401 ''lạc'':276 ''lại'':20,232,270 ''lật'':155 ''lề'':509 ''m'':16,52,109,112,128,133,150,160,173,194,202,205,327,349,350,426,449,536 ''mang'':19,37,49,124,231 ''mất'':335 ''một'':233,271,280,285,535 ''mở'':164 ''mục'':281 ''n'':27,31,43,63,92,93,95,113,159,161,167,197,222,347,388,409,439 ''ng'':35,137,215,226,249,250,255,258,259,298,319,332,337,367,404,414,417,446,460,507,515 ''nghe'':406 ''nghiệm'':22,40,79,101,127,362,520 ''nghĩ'':9,287,323 ''nghệ'':89,415 ''ngoại'':495 ''ngày'':527 ''nh'':115,136,163,190,203,237 ''nhanh'':156 ''như'':29 ''nhật'':244,282,526 ''nhẹ'':135 ''nhờ'':15 ''những'':7 ''năng'':69,179 ''nối'':355 ''nữa'':264 ''o'':64,428,463 ''p'':77,154,307,342 ''ph'':149,442,506,514 ''phong'':210,441 ''phẩm'':88 ''pin'':402 ''pocket'':483 ''ri'':214,459 ''rảnh'':499 ''rất'':147 ''rỗi'':500 ''rộng'':165 ''s'':24,103,199,207,278,364,380,386,407,432,437,450,467 ''sao'':344 ''sinh'':12 ''soundlink'':2 ''speaker'':5 ''stylus'':74,184,315 ''suy'':8,286,322 ''sưu'':430 ''sắc'':18,51,111,130,329 ''sẻ'':321 ''số'':234 ''sổ'':304,339 ''sử'':481 ''t'':86,193,236,308,421,455,478,522 ''th'':71,181,204,300,448 ''thay'':511 ''thiết'':59,464 ''thuật'':90 ''thước'':118,505 ''thật'':28,45 ''thế'':263 ''thể'':188,375 ''thị'':146 ''thời'':400 ''tinh'':97 ''tr'':30,42,158,346 ''trang'':152,198,241 ''truyền'':227 ''trải'':21,39,78,100,126,361,519 ''trở'':91 ''trữ'':377,396 ''trực'':491 ''tuyến'':492,496 ''tuần'':405 ''tương'':70,180 ''tưởng'':168 ''tả'':537 ''tận'':398 ''tập'':431 ''tế'':98 ''tới'':378 ''tử'':106,383,435,453,470 ''u'':17,53,110,129,134,174,195,208,275,328 ''v'':192,230,261,299,313,353,397,427,436,454,462,476,510 ''viết'':80,490 ''việc'':256 ''vị'':301 ''với'':67,131,171,177,303,338,356,370,391,412 ''y'':251,260,351,419,523,533 ''đ'':189,292,348,532 ''đa'':175 ''đang'':268 ''điều'':291,501 ''điện'':105,382,434,452,469 ''được'':343 ''đầy'':107,288 ''đắm'':424 ''đẹp'':148 ''đến'':38,50,83,125 ''để'':484,493,517 ''đọc'':23,41,102,363,466,494,521 ''đổi'':512 ''động'':13 ''đủ'':108'),
  (150, 'Máy Sấy Tóc Panasonic Nanoe 2000W', 13, 4, '<p><strong>Tứ Phủ X&eacute;t Giả - Tập 2</strong></p>
<p>C&aacute;i chết của người thầy th&acirc;n thiết, c&ocirc; bạn th&acirc;n từ nhỏ bị bắt c&oacute;c, mu&ocirc;n v&agrave;n chuyện qu&aacute;i dị xảy ra&hellip; k&eacute;o Long ng&agrave;y một dấn th&acirc;n v&agrave;o thế giới của c&aacute;c x&eacute;t giả.</p>
<p>Trong con đường hầm đi bộ tưởng như bỏ hoang, cuộc chiến giữa c&aacute;c thế lực thần th&aacute;nh, y&ecirc;u ma đ&atilde; nổ ra. Một phe của những con người, những vị tướng t&agrave;i được ban cho sức mạnh, một phe của những thế lực thần th&aacute;nh. Liệu con người c&oacute; thể chống lại số phận, gi&agrave;nh lấy quyền tự quyết?</p>
<p><em>Tứ phủ x&eacute;t giả</em>&nbsp;ra mắt tập 2 với nhiều diễn biến mới. Sau lần su&yacute;t mất mạng, t&iacute;nh c&aacute;ch của Long đ&atilde; c&oacute; sự thay đổi nhưng một con người b&igrave;nh thường liệu c&oacute; bắt kịp với nhịp độ của một chiến thần th&aacute;nh đang diễn ra ngay trước mắt?</p>
<p><em>Tứ phủ x&eacute;t giả</em> l&agrave; bộ truyện tranh d&agrave;i tập của Rover Studio được x&acirc;y dựng dựa tr&ecirc;n thế giới giả tưởng nhưng c&oacute; sự ảnh hưởng s&acirc;u sắc của văn h&oacute;a Việt Nam qua c&aacute;c chi tiết về t&iacute;n ngưỡng Thờ Mẫu, quan niệm về c&aacute;c lực lượng si&ecirc;u nhi&ecirc;n như Hắc - Bạch V&ocirc; Thường&hellip; Với cốt truyện nhiều bất ngờ v&agrave; sự h&ograve;a quyện nhuần nhuyễn giữa n&eacute;t vẽ hiện đại với những chi tiết mang &acirc;m hưởng văn h&oacute;a d&acirc;n gian hứa hẹn sẽ mang đến một g&oacute;c nh&igrave;n mới cho những c&acirc;u chuyện của t&aacute;c giả Việt.</p>', '10000', '5000', '50000', '10000', '2026-01-12T08:05:00.000Z', 1, NULL, '2025-12-19T18:05:39.138Z', true, true, '''2'':13,136 ''2000w'':6 ''a'':222,261,280 ''b'':163 ''ban'':100 ''biến'':140 ''bạch'':249 ''bạn'':24 ''bất'':256 ''bắt'':30,168 ''bị'':29 ''bỏ'':70 ''bộ'':67,191 ''c'':14,23,31,32,57,58,75,76,116,150,155,167,212,226,227,239,240,291,297,302 ''ch'':151 ''chi'':228,273 ''chiến'':73,175 ''cho'':101,295 ''chuyện'':37,299 ''chết'':16 ''chống'':118 ''con'':63,92,114,161 ''cuộc'':72 ''cốt'':253 ''của'':17,56,90,106,152,173,197,219,300 ''d'':194,281 ''diễn'':139,180 ''dấn'':49 ''dị'':40 ''dựa'':204 ''dựng'':203 ''g'':290 ''gi'':122 ''gian'':283 ''giả'':11,61,132,189,209,303 ''giới'':55,208 ''giữa'':74,265 ''h'':221,260,279 ''hiện'':269 ''hoang'':71 ''hưởng'':215,277 ''hầm'':65 ''hắc'':248 ''hẹn'':285 ''hứa'':284 ''i'':15,39,98,195 ''k'':43 ''kịp'':169 ''l'':190 ''liệu'':113,166 ''long'':45,153 ''lượng'':242 ''lại'':119 ''lấy'':124 ''lần'':143 ''lực'':78,109,241 ''m'':276 ''ma'':84 ''mang'':275,287 ''mu'':33 ''máy'':1 ''mạng'':147 ''mạnh'':103 ''mất'':146 ''mẫu'':235 ''mắt'':134,184 ''một'':48,88,104,160,174,289 ''mới'':141,294 ''n'':21,26,34,36,51,206,232,246,266,282,293 ''nam'':224 ''nanoe'':5 ''ng'':46 ''ngay'':182 ''người'':18,93,115,162 ''ngưỡng'':233 ''ngờ'':257 ''nh'':81,112,123,149,164,178,292 ''nhi'':245 ''nhiều'':138,255 ''nhuyễn'':264 ''nhuần'':263 ''như'':69,247 ''nhưng'':159,211 ''nhịp'':171 ''nhỏ'':28 ''những'':91,94,107,272,296 ''niệm'':237 ''nổ'':86 ''o'':44,53 ''panasonic'':4 ''phe'':89,105 ''phận'':121 ''phủ'':8,129,186 ''qu'':38 ''qua'':225 ''quan'':236 ''quyết'':127 ''quyền'':125 ''quyện'':262 ''ra'':42,87,133,181 ''rover'':198 ''s'':216 ''sau'':142 ''si'':243 ''studio'':199 ''su'':144 ''sấy'':2 ''sắc'':218 ''sẽ'':286 ''số'':120 ''sức'':102 ''sự'':156,213,259 ''t'':10,60,97,131,145,148,188,231,267,301 ''th'':20,25,50,80,111,177 ''thay'':157 ''thiết'':22 ''thường'':165,251 ''thần'':79,110,176 ''thầy'':19 ''thế'':54,77,108,207 ''thể'':117 ''thờ'':234 ''tiết'':229,274 ''tr'':205 ''tranh'':193 ''trong'':62 ''truyện'':192,254 ''trước'':183 ''tóc'':3 ''tướng'':96 ''tưởng'':68,210 ''tập'':12,135,196 ''tứ'':7,128,185 ''từ'':27 ''tự'':126 ''u'':83,217,244,298 ''v'':35,52,250,258 ''việt'':223,304 ''văn'':220,278 ''vẽ'':268 ''về'':230,238 ''vị'':95 ''với'':137,170,252,271 ''x'':9,59,130,187,201 ''xảy'':41 ''y'':47,82,202 ''đ'':85,154 ''đang'':179 ''đi'':66 ''đường'':64 ''được'':99,200 ''đại'':270 ''đến'':288 ''đổi'':158 ''độ'':172 ''ảnh'':214'),
  (151, 'Quạt Điện Panasonic 16 inch Tiết Kiệm', 13, 4, '<p><strong>Hinata C&ocirc; B&eacute; Mang Linh Hồn B&agrave; L&atilde;o - Tập 1</strong></p>
<p><strong>Hinata C&ocirc; b&eacute; mang linh hồn b&agrave; l&atilde;o 1 -&nbsp;<em>Khi b&agrave; cụ 88 tuổi đầu thai th&agrave;nh một đứa&nbsp;</em></strong><strong><em>trẻ 6 tuổi!</em></strong></p>
<p>Với phong th&aacute;i điềm tĩnh, kinh nghiệm uy&ecirc;n b&aacute;c v&agrave; v&ocirc; v&agrave;n mẹo vặt cho mọi vấn đề kh&oacute; khăn của cuộc sống, c&ocirc; b&eacute; 6 tuổi Hinata kh&aacute;c hẳn những đứa trẻ mẫu gi&aacute;o th&ocirc;ng thường. Hinata gi&agrave; dặn, th&iacute;ch nh&acirc;m nhi cốc tr&agrave; dưới m&aacute;i hi&ecirc;n, kho&aacute;i những m&oacute;n ăn chua c&ugrave;ng lối n&oacute;i chuyện kh&aacute;c người. Bởi v&igrave; thực chất, c&ocirc; b&eacute; ch&iacute;nh l&agrave; một b&agrave; cụ 88 tuổi đầu thai m&agrave; vẫn giữ nguy&ecirc;n k&yacute; ức từ kiếp trước.</p>
<p>Vốn l&agrave; b&agrave; l&atilde;o gần đất xa trời bỗng dưng trở lại l&agrave;m một đứa trẻ, học mẫu gi&aacute;o c&ugrave;ng bạn b&egrave; &ldquo;đồng trang lứa&rdquo;, Hinata vừa phải học c&aacute;ch h&ograve;a đồng với những đứa trẻ trong lớp, vừa phải l&agrave;m quen với những thay đổi trong cuộc sống mới. Th&ocirc;ng qua kinh nghiệm sống đ&uacute;c kết được từ kiếp trước, c&ocirc; b&eacute; lu&ocirc;n c&oacute; những mẹo vặt d&acirc;n gian v&agrave; c&aacute;ch giải quyết đầy th&uacute; vị cho mọi vấn đề gặp phải. Đồng thời, Hinata cũng dần nhớ lại k&yacute; ức về đứa ch&aacute;u trai trong kiếp trước. Những k&yacute; ức ấy mang &yacute; nghĩa g&igrave;? Rốt cuộc v&igrave; l&yacute; do g&igrave; m&agrave; c&ocirc; b&eacute; lại đầu thai?</p>
<p>Được s&aacute;ng t&aacute;c bởi nữ t&aacute;c giả Asa Kuwayoshi, bộ truyện &ldquo;Hinata C&ocirc; b&eacute; mang linh hồn b&agrave; l&atilde;o&rdquo; xoay quanh cuộc sống h&agrave;ng ng&agrave;y của c&ocirc; b&eacute; 6 tuổi Hinata th&ocirc;ng th&aacute;i, đ&aacute;ng y&ecirc;u. Mời c&aacute;c bạn đ&oacute;n đọc tập đầu ti&ecirc;n của bộ truyện h&agrave;i hước nhẹ nh&agrave;ng với đầy hiểu biết s&acirc;u sắc của một b&agrave; l&atilde;o!</p>', '10000', '5000', '50000', '30000', '2026-01-16T05:28:00.000Z', 1, 19, '2025-12-19T18:30:13.716Z', true, true, '''1'':18,28 ''16'':4 ''6'':41,72,309 ''88'':32,130 ''a'':180 ''asa'':285 ''b'':10,14,21,25,30,53,71,123,128,146,169,215,271,291,295,308,349 ''biết'':343 ''bạn'':168,323 ''bỗng'':153 ''bộ'':287,332 ''bởi'':118,280 ''c'':9,20,54,70,76,109,116,122,166,177,208,214,218,226,270,279,283,290,307,321,322 ''ch'':91,124,178,227,250 ''cho'':61,233 ''chua'':108 ''chuyện'':114 ''chất'':121 ''cuộc'':68,198,264,300 ''cũng'':242 ''cốc'':95 ''cụ'':31,129 ''của'':67,306,331,347 ''d'':222 ''do'':267 ''dưng'':154 ''dưới'':97 ''dần'':243 ''dặn'':89 ''g'':262,268 ''gi'':82,88,164 ''gian'':224 ''giả'':284 ''giải'':228 ''giữ'':136 ''gần'':149 ''gặp'':237 ''h'':179,302,334 ''hi'':100 ''hinata'':8,19,74,87,173,241,289,311 ''hiểu'':342 ''hước'':336 ''hẳn'':77 ''học'':162,176 ''hồn'':13,24,294 ''i'':46,99,103,113,315,335 ''inch'':5 ''k'':139,246,257 ''kh'':65,75,115 ''khi'':29 ''kho'':102 ''khăn'':66 ''kinh'':49,204 ''kiếp'':142,212,254 ''kiệm'':7 ''kuwayoshi'':286 ''kết'':209 ''l'':15,26,126,145,147,157,190,266,296,350 ''linh'':12,23,293 ''lu'':216 ''lại'':156,245,272 ''lối'':111 ''lớp'':187 ''lứa'':172 ''m'':93,98,105,134,158,191,269 ''mang'':11,22,260,292 ''mẫu'':81,163 ''mẹo'':59,220 ''mọi'':62,234 ''một'':38,127,159,348 ''mới'':200 ''mời'':320 ''n'':52,58,101,106,112,138,217,223,325,330 ''ng'':85,110,167,202,277,303,304,313,317,339 ''nghiệm'':50,205 ''nghĩa'':261 ''nguy'':137 ''người'':117 ''nh'':37,92,125,338 ''nhi'':94 ''nhẹ'':337 ''nhớ'':244 ''những'':78,104,183,194,219,256 ''nữ'':281 ''o'':16,27,83,148,165,297,351 ''panasonic'':3 ''phong'':44 ''phải'':175,189,238 ''qua'':203 ''quanh'':299 ''quen'':192 ''quyết'':229 ''quạt'':1 ''rốt'':263 ''s'':276,344 ''sắc'':346 ''sống'':69,199,206,301 ''t'':278,282 ''th'':36,45,84,90,201,231,312,314 ''thai'':35,133,274 ''thay'':195 ''thường'':86 ''thời'':240 ''thực'':120 ''ti'':329 ''tiết'':6 ''tr'':96 ''trai'':252 ''trang'':171 ''trong'':186,197,253 ''truyện'':288,333 ''trước'':143,213,255 ''trẻ'':40,80,161,185 ''trời'':152 ''trở'':155 ''tuổi'':33,42,73,131,310 ''tĩnh'':48 ''tập'':17,327 ''từ'':141,211 ''u'':251,319,345 ''uy'':51 ''v'':55,56,57,119,225,265 ''vấn'':63,235 ''vẫn'':135 ''vặt'':60,221 ''về'':248 ''vị'':232 ''vốn'':144 ''với'':43,182,193,340 ''vừa'':174,188 ''xa'':151 ''xoay'':298 ''y'':305,318 ''ăn'':107 ''đ'':207,316,324 ''điềm'':47 ''điện'':2 ''được'':210,275 ''đất'':150 ''đầu'':34,132,273,328 ''đầy'':230,341 ''đề'':64,236 ''đọc'':326 ''đồng'':170,181,239 ''đổi'':196 ''đứa'':39,79,160,184,249 ''ấy'':259 ''ức'':140,247,258'),
  (152, 'Túi Đeo Chéo Nam Anello Canvas', 17, 2, '<p><strong>Hinata C&ocirc; B&eacute; Mang Linh Hồn B&agrave; L&atilde;o - Tập 1</strong></p>
<p><strong>Hinata C&ocirc; b&eacute; mang linh hồn b&agrave; l&atilde;o 1 -&nbsp;<em>Khi b&agrave; cụ 88 tuổi đầu thai th&agrave;nh một đứa&nbsp;</em></strong><strong><em>trẻ 6 tuổi!</em></strong></p>
<p>Với phong th&aacute;i điềm tĩnh, kinh nghiệm uy&ecirc;n b&aacute;c v&agrave; v&ocirc; v&agrave;n mẹo vặt cho mọi vấn đề kh&oacute; khăn của cuộc sống, c&ocirc; b&eacute; 6 tuổi Hinata kh&aacute;c hẳn những đứa trẻ mẫu gi&aacute;o th&ocirc;ng thường. Hinata gi&agrave; dặn, th&iacute;ch nh&acirc;m nhi cốc tr&agrave; dưới m&aacute;i hi&ecirc;n, kho&aacute;i những m&oacute;n ăn chua c&ugrave;ng lối n&oacute;i chuyện kh&aacute;c người. Bởi v&igrave; thực chất, c&ocirc; b&eacute; ch&iacute;nh l&agrave; một b&agrave; cụ 88 tuổi đầu thai m&agrave; vẫn giữ nguy&ecirc;n k&yacute; ức từ kiếp trước.</p>
<p>Vốn l&agrave; b&agrave; l&atilde;o gần đất xa trời bỗng dưng trở lại l&agrave;m một đứa trẻ, học mẫu gi&aacute;o c&ugrave;ng bạn b&egrave; &ldquo;đồng trang lứa&rdquo;, Hinata vừa phải học c&aacute;ch h&ograve;a đồng với những đứa trẻ trong lớp, vừa phải l&agrave;m quen với những thay đổi trong cuộc sống mới. Th&ocirc;ng qua kinh nghiệm sống đ&uacute;c kết được từ kiếp trước, c&ocirc; b&eacute; lu&ocirc;n c&oacute; những mẹo vặt d&acirc;n gian v&agrave; c&aacute;ch giải quyết đầy th&uacute; vị cho mọi vấn đề gặp phải. Đồng thời, Hinata cũng dần nhớ lại k&yacute; ức về đứa ch&aacute;u trai trong kiếp trước. Những k&yacute; ức ấy mang &yacute; nghĩa g&igrave;? Rốt cuộc v&igrave; l&yacute; do g&igrave; m&agrave; c&ocirc; b&eacute; lại đầu thai?</p>
<p>Được s&aacute;ng t&aacute;c bởi nữ t&aacute;c giả Asa Kuwayoshi, bộ truyện &ldquo;Hinata C&ocirc; b&eacute; mang linh hồn b&agrave; l&atilde;o&rdquo; xoay quanh cuộc sống h&agrave;ng ng&agrave;y của c&ocirc; b&eacute; 6 tuổi Hinata th&ocirc;ng th&aacute;i, đ&aacute;ng y&ecirc;u. Mời c&aacute;c bạn đ&oacute;n đọc tập đầu ti&ecirc;n của bộ truyện h&agrave;i hước nhẹ nh&agrave;ng với đầy hiểu biết s&acirc;u sắc của một b&agrave; l&atilde;o!</p>
        <div style="margin-top: 20px; border-top: 1px dashed #ccc; padding-top: 10px;">
            <p>
                <span style="background-color: #fff3cd; padding: 5px 10px; border-radius: 5px; font-weight: bold;">
                    ✏️ Cập nhật ngày: 01:56:34 27/12/2025
                </span>
            </p>
        </div>
    <p>một v&agrave;i bổ sung trong một d&ograve;ng bổ sung bổ sung tại phần bổ sung cho sản phầm bổ sung&nbsp;</p>', '0', '10000', '100000', '60000', '2026-01-18T10:48:00.000Z', 1, 19, '2025-12-19T18:39:13.645Z', true, true, '''01'':354 ''1'':17,27 ''27/12/2025'':357 ''34'':356 ''56'':355 ''6'':40,71,308 ''88'':31,129 ''a'':179 ''anello'':5 ''asa'':284 ''b'':9,13,20,24,29,52,70,122,127,145,168,214,270,290,294,307,348 ''biết'':342 ''bạn'':167,322 ''bổ'':361,367,369,373,378 ''bỗng'':152 ''bộ'':286,331 ''bởi'':117,279 ''c'':8,19,53,69,75,108,115,121,165,176,207,213,217,225,269,278,282,289,306,320,321 ''canvas'':6 ''ch'':90,123,177,226,249 ''cho'':60,232,375 ''chua'':107 ''chuyện'':113 ''chéo'':3 ''chất'':120 ''cuộc'':67,197,263,299 ''cũng'':241 ''cập'':351 ''cốc'':94 ''cụ'':30,128 ''của'':66,305,330,346 ''d'':221,365 ''do'':266 ''dưng'':153 ''dưới'':96 ''dần'':242 ''dặn'':88 ''g'':261,267 ''gi'':81,87,163 ''gian'':223 ''giả'':283 ''giải'':227 ''giữ'':135 ''gần'':148 ''gặp'':236 ''h'':178,301,333 ''hi'':99 ''hinata'':7,18,73,86,172,240,288,310 ''hiểu'':341 ''hước'':335 ''hẳn'':76 ''học'':161,175 ''hồn'':12,23,293 ''i'':45,98,102,112,314,334,360 ''k'':138,245,256 ''kh'':64,74,114 ''khi'':28 ''kho'':101 ''khăn'':65 ''kinh'':48,203 ''kiếp'':141,211,253 ''kuwayoshi'':285 ''kết'':208 ''l'':14,25,125,144,146,156,189,265,295,349 ''linh'':11,22,292 ''lu'':215 ''lại'':155,244,271 ''lối'':110 ''lớp'':186 ''lứa'':171 ''m'':92,97,104,133,157,190,268 ''mang'':10,21,259,291 ''mẫu'':80,162 ''mẹo'':58,219 ''mọi'':61,233 ''một'':37,126,158,347,358,364 ''mới'':199 ''mời'':319 ''n'':51,57,100,105,111,137,216,222,324,329 ''nam'':4 ''ng'':84,109,166,201,276,302,303,312,316,338,366 ''nghiệm'':49,204 ''nghĩa'':260 ''nguy'':136 ''ngày'':353 ''người'':116 ''nh'':36,91,124,337 ''nhi'':93 ''nhật'':352 ''nhẹ'':336 ''nhớ'':243 ''những'':77,103,182,193,218,255 ''nữ'':280 ''o'':15,26,82,147,164,296,350 ''phong'':43 ''phải'':174,188,237 ''phầm'':377 ''phần'':372 ''qua'':202 ''quanh'':298 ''quen'':191 ''quyết'':228 ''rốt'':262 ''s'':275,343 ''sung'':362,368,370,374,379 ''sản'':376 ''sắc'':345 ''sống'':68,198,205,300 ''t'':277,281 ''th'':35,44,83,89,200,230,311,313 ''thai'':34,132,273 ''thay'':194 ''thường'':85 ''thời'':239 ''thực'':119 ''ti'':328 ''tr'':95 ''trai'':251 ''trang'':170 ''trong'':185,196,252,363 ''truyện'':287,332 ''trước'':142,212,254 ''trẻ'':39,79,160,184 ''trời'':151 ''trở'':154 ''tuổi'':32,41,72,130,309 ''túi'':1 ''tĩnh'':47 ''tại'':371 ''tập'':16,326 ''từ'':140,210 ''u'':250,318,344 ''uy'':50 ''v'':54,55,56,118,224,264,359 ''vấn'':62,234 ''vẫn'':134 ''vặt'':59,220 ''về'':247 ''vị'':231 ''vốn'':143 ''với'':42,181,192,339 ''vừa'':173,187 ''xa'':150 ''xoay'':297 ''y'':304,317 ''ăn'':106 ''đ'':206,315,323 ''đeo'':2 ''điềm'':46 ''được'':209,274 ''đất'':149 ''đầu'':33,131,272,327 ''đầy'':229,340 ''đề'':63,235 ''đọc'':325 ''đồng'':169,180,238 ''đổi'':195 ''đứa'':38,78,159,183,248 ''ấy'':258 ''ức'':139,246,257'),
  (153, 'ánh dương đỉnh đồi', 13, 2, '<div class="mp-block-description">
<p>Với cảm hứng từ thi&ecirc;n nhi&ecirc;n Việt Nam,&nbsp;<a href="https://www.pnj.com.vn/bo-suu-tap-trang-suc/masterpiece/?atm_source=pdp&amp;atm_medium=bst&amp;atm_campaign=motasanpham&amp;atm_content=">BST Masterpiece</a>&nbsp;được ra đời như một tuyệt t&aacute;c nghệ thuật mang hơi thở của &ldquo;Rừng v&agrave;ng biển bạc&rdquo;.</p>
<p>Bộ trang sức Eternal Mystery thuộc BST Masterpiece &ndash; &ldquo;Rừng v&agrave;ng biển bạc&rdquo; lấy cảm hứng từ vẻ đẹp huyền b&iacute; của Động Phong Nha. Những hang động v&agrave; thạch nhũ kỳ ảo, ẩn sau sự lặng im của n&uacute;i đ&aacute; v&ocirc;i, được t&aacute;i hiện tinh tế trong thiết kế b&ocirc;ng tai, mang đến vẻ đẹp đầy chiều s&acirc;u v&agrave; b&iacute; ẩn, d&agrave;nh cho người phụ nữ s&acirc;u sắc v&agrave; tinh tế, biết c&aacute;ch tỏa s&aacute;ng bằng ch&iacute;nh nội t&acirc;m của m&igrave;nh.</p>
</div>
<div class="mp-block-description">
<p><a href="https://www.pnj.com.vn/lac-vong-tay/vong-tay/vong-tay-vang/?itm_source=pdp&amp;itm_medium=vongtayvang&amp;itm_campaign=&amp;itm_content=">V&ograve;ng tay</a>&nbsp;được chế t&aacute;c từ V&agrave;ng 14K, điểm nhấn l&agrave; vi&ecirc;n đ&aacute; Morganite hồng trong suốt &ndash; đại diện cho vẻ đẹp nội t&acirc;m của người phụ nữ, nổi bật như một b&iacute; mật chỉ d&agrave;nh cho những ai đủ tinh tế để cảm nhận. C&aacute;c chi tiết thả rơi tựa như chuyển động của thạch nhũ theo chiều rơi qua h&agrave;ng triệu năm, kết hợp với những vi&ecirc;n kim cương tinh xảo, tạo n&ecirc;n tổng thể b&ocirc;ng tai mềm mại, nữ t&iacute;nh v&agrave; thanh lịch.</p>
</div>
<div class="mp-block-description">
<p><a href="https://www.pnj.com.vn/lac-vong-tay/vong-tay/vong-tay-vang/?itm_source=pdp&amp;itm_medium=vongtayvang&amp;itm_campaign=&amp;itm_content=">V&ograve;ng tay V&agrave;ng</a> 14K thuộc Bộ trang sức Eternal Mystery kh&ocirc;ng chỉ l&agrave; m&oacute;n trang sức qu&yacute; ph&aacute;i m&agrave; c&ograve;n l&agrave; lời khẳng định phong c&aacute;ch d&agrave;nh cho người phụ nữ s&acirc;u sắc v&agrave; b&iacute; ẩn. Ghi dấu bằng kho&aacute; Masterpiece đặc trưng v&agrave; số lượng giới hạn, Bộ sưu tập l&agrave; biểu tượng của niềm ki&ecirc;u h&atilde;nh, c&ugrave;ng người phụ nữ viết tiếp d&ograve;ng chảy di sản mang đậm dấu ấn ri&ecirc;ng.</p>
</div>', '50000000', '1000000', '150000000', '51000000', '2026-01-14T03:07:00.000Z', 1, 19, '2025-12-19T19:55:21.042Z', true, true, '''14k'':140,233 ''ai'':174 ''b'':56,89,101,167,217,271 ''biết'':115 ''biển'':34,47 ''biểu'':289 ''bst'':15,42 ''bạc'':35,48 ''bật'':164 ''bằng'':121,275 ''bộ'':36,235,285 ''c'':24,116,136,181,182,252,259,297 ''ch'':117,122,260 ''chi'':183 ''chiều'':97,195 ''cho'':105,153,172,263 ''chuyển'':189 ''chảy'':306 ''chế'':134 ''chỉ'':169,242 ''cương'':209 ''cảm'':6,50,179 ''của'':30,57,74,127,159,191,291 ''d'':103,170,261,304 ''di'':307 ''diện'':152 ''dương'':2 ''dấu'':274,311 ''eternal'':39,238 ''ghi'':273 ''giới'':283 ''h'':198,295 ''hang'':62 ''hiện'':83 ''huyền'':55 ''hơi'':28 ''hạn'':284 ''hồng'':148 ''hợp'':203 ''hứng'':7,51 ''i'':76,79,82,250 ''im'':73 ''kh'':240 ''kho'':276 ''khẳng'':256 ''ki'':293 ''kim'':208 ''kế'':88 ''kết'':202 ''kỳ'':67 ''l'':143,243,254,288 ''lượng'':282 ''lấy'':49 ''lặng'':72 ''lịch'':227 ''lời'':255 ''m'':126,128,158,244,251 ''mang'':27,92,309 ''masterpiece'':16,43,277 ''morganite'':147 ''mystery'':40,239 ''mại'':221 ''mật'':168 ''mềm'':220 ''một'':21,166 ''n'':10,12,75,145,207,213,214,245,253 ''nam'':14 ''ng'':33,46,90,120,131,139,199,218,229,232,241,298,305,314 ''nghệ'':25 ''người'':106,160,264,299 ''nh'':104,123,129,171,224,262,296 ''nha'':60 ''nhi'':11 ''nhũ'':66,193 ''như'':20,165,188 ''nhấn'':142 ''nhận'':180 ''những'':61,173,205 ''niềm'':292 ''năm'':201 ''nổi'':163 ''nội'':124,156 ''nữ'':108,162,222,266,301 ''ph'':249 ''phong'':59,258 ''phụ'':107,161,265,300 ''qu'':248 ''qua'':197 ''ra'':18 ''ri'':313 ''rơi'':186,196 ''rừng'':31,44 ''s'':98,109,119,267 ''sau'':70 ''suốt'':150 ''sưu'':286 ''sản'':308 ''sắc'':111,269 ''số'':281 ''sức'':38,237,247 ''sự'':71 ''t'':23,81,125,135,157,223 ''tai'':91,219 ''tay'':132,230 ''thanh'':226 ''theo'':194 ''thi'':9 ''thiết'':87 ''thuật'':26 ''thuộc'':41,234 ''thạch'':65,192 ''thả'':185 ''thể'':216 ''thở'':29 ''tinh'':84,113,176,210 ''tiếp'':303 ''tiết'':184 ''trang'':37,236,246 ''triệu'':200 ''trong'':86,149 ''trưng'':279 ''tuyệt'':22 ''tượng'':290 ''tạo'':212 ''tập'':287 ''tế'':85,114,177 ''tỏa'':118 ''tổng'':215 ''từ'':8,52,137 ''tựa'':187 ''u'':99,110,268,294 ''v'':32,45,64,78,100,112,130,138,225,228,231,270,280 ''vi'':144,206 ''viết'':302 ''việt'':13 ''vẻ'':53,94,154 ''với'':5,204 ''xảo'':211 ''ánh'':1 ''đ'':77,146 ''điểm'':141 ''được'':17,80,133 ''đại'':151 ''đầy'':96 ''đậm'':310 ''đặc'':278 ''đẹp'':54,95,155 ''đến'':93 ''để'':178 ''đỉnh'':3 ''định'':257 ''đồi'':4 ''động'':58,63,190 ''đời'':19 ''đủ'':175 ''ảo'':68 ''ấn'':312 ''ẩn'':69,102,272'),
  (154, 'Trang sức siêu đắt', 17, 2, '<div class="mp-block-description">
<p>Với cảm hứng từ thi&ecirc;n nhi&ecirc;n Việt Nam,&nbsp;<a href="https://www.pnj.com.vn/bo-suu-tap-trang-suc/masterpiece/?atm_source=pdp&amp;atm_medium=bst&amp;atm_campaign=motasanpham&amp;atm_content=">BST Masterpiece</a>&nbsp;được ra đời như một tuyệt t&aacute;c nghệ thuật mang hơi thở của &ldquo;Rừng v&agrave;ng biển bạc&rdquo;.</p>
<p>Bộ trang sức Eternal Mystery thuộc BST Masterpiece &ndash; &ldquo;Rừng v&agrave;ng biển bạc&rdquo; lấy cảm hứng từ vẻ đẹp huyền b&iacute; của Động Phong Nha. Những hang động v&agrave; thạch nhũ kỳ ảo, ẩn sau sự lặng im của n&uacute;i đ&aacute; v&ocirc;i, được t&aacute;i hiện tinh tế trong thiết kế b&ocirc;ng tai, mang đến vẻ đẹp đầy chiều s&acirc;u v&agrave; b&iacute; ẩn, d&agrave;nh cho người phụ nữ s&acirc;u sắc v&agrave; tinh tế, biết c&aacute;ch tỏa s&aacute;ng bằng ch&iacute;nh nội t&acirc;m của m&igrave;nh.</p>
</div>
<div class="mp-block-description">
<p><a href="https://www.pnj.com.vn/lac-vong-tay/vong-tay/vong-tay-vang/?itm_source=pdp&amp;itm_medium=vongtayvang&amp;itm_campaign=&amp;itm_content=">V&ograve;ng tay</a>&nbsp;được chế t&aacute;c từ V&agrave;ng 14K, điểm nhấn l&agrave; vi&ecirc;n đ&aacute; Morganite hồng trong suốt &ndash; đại diện cho vẻ đẹp nội t&acirc;m của người phụ nữ, nổi bật như một b&iacute; mật chỉ d&agrave;nh cho những ai đủ tinh tế để cảm nhận. C&aacute;c chi tiết thả rơi tựa như chuyển động của thạch nhũ theo chiều rơi qua h&agrave;ng triệu năm, kết hợp với những vi&ecirc;n kim cương tinh xảo, tạo n&ecirc;n tổng thể b&ocirc;ng tai mềm mại, nữ t&iacute;nh v&agrave; thanh lịch.</p>
</div>
<div class="mp-block-description">
<p><a href="https://www.pnj.com.vn/lac-vong-tay/vong-tay/vong-tay-vang/?itm_source=pdp&amp;itm_medium=vongtayvang&amp;itm_campaign=&amp;itm_content=">V&ograve;ng tay V&agrave;ng</a> 14K thuộc Bộ trang sức Eternal Mystery kh&ocirc;ng chỉ l&agrave; m&oacute;n trang sức qu&yacute; ph&aacute;i m&agrave; c&ograve;n l&agrave; lời khẳng định phong c&aacute;ch d&agrave;nh cho người phụ nữ s&acirc;u sắc v&agrave; b&iacute; ẩn. Ghi dấu bằng kho&aacute; Masterpiece đặc trưng v&agrave; số lượng giới hạn, Bộ sưu tập l&agrave; biểu tượng của niềm ki&ecirc;u h&atilde;nh, c&ugrave;ng người phụ nữ viết tiếp d&ograve;ng chảy di sản mang đậm dấu ấn ri&ecirc;ng.</p>
</div>', '111100000', '1000000', '150000000', '115100000', '2026-01-17T21:42:00.000Z', 1, 19, '2025-12-19T20:01:00.518Z', true, true, '''14k'':140,233 ''ai'':174 ''b'':56,89,101,167,217,271 ''biết'':115 ''biển'':34,47 ''biểu'':289 ''bst'':15,42 ''bạc'':35,48 ''bật'':164 ''bằng'':121,275 ''bộ'':36,235,285 ''c'':24,116,136,181,182,252,259,297 ''ch'':117,122,260 ''chi'':183 ''chiều'':97,195 ''cho'':105,153,172,263 ''chuyển'':189 ''chảy'':306 ''chế'':134 ''chỉ'':169,242 ''cương'':209 ''cảm'':6,50,179 ''của'':30,57,74,127,159,191,291 ''d'':103,170,261,304 ''di'':307 ''diện'':152 ''dấu'':274,311 ''eternal'':39,238 ''ghi'':273 ''giới'':283 ''h'':198,295 ''hang'':62 ''hiện'':83 ''huyền'':55 ''hơi'':28 ''hạn'':284 ''hồng'':148 ''hợp'':203 ''hứng'':7,51 ''i'':76,79,82,250 ''im'':73 ''kh'':240 ''kho'':276 ''khẳng'':256 ''ki'':293 ''kim'':208 ''kế'':88 ''kết'':202 ''kỳ'':67 ''l'':143,243,254,288 ''lượng'':282 ''lấy'':49 ''lặng'':72 ''lịch'':227 ''lời'':255 ''m'':126,128,158,244,251 ''mang'':27,92,309 ''masterpiece'':16,43,277 ''morganite'':147 ''mystery'':40,239 ''mại'':221 ''mật'':168 ''mềm'':220 ''một'':21,166 ''n'':10,12,75,145,207,213,214,245,253 ''nam'':14 ''ng'':33,46,90,120,131,139,199,218,229,232,241,298,305,314 ''nghệ'':25 ''người'':106,160,264,299 ''nh'':104,123,129,171,224,262,296 ''nha'':60 ''nhi'':11 ''nhũ'':66,193 ''như'':20,165,188 ''nhấn'':142 ''nhận'':180 ''những'':61,173,205 ''niềm'':292 ''năm'':201 ''nổi'':163 ''nội'':124,156 ''nữ'':108,162,222,266,301 ''ph'':249 ''phong'':59,258 ''phụ'':107,161,265,300 ''qu'':248 ''qua'':197 ''ra'':18 ''ri'':313 ''rơi'':186,196 ''rừng'':31,44 ''s'':98,109,119,267 ''sau'':70 ''siêu'':3 ''suốt'':150 ''sưu'':286 ''sản'':308 ''sắc'':111,269 ''số'':281 ''sức'':2,38,237,247 ''sự'':71 ''t'':23,81,125,135,157,223 ''tai'':91,219 ''tay'':132,230 ''thanh'':226 ''theo'':194 ''thi'':9 ''thiết'':87 ''thuật'':26 ''thuộc'':41,234 ''thạch'':65,192 ''thả'':185 ''thể'':216 ''thở'':29 ''tinh'':84,113,176,210 ''tiếp'':303 ''tiết'':184 ''trang'':1,37,236,246 ''triệu'':200 ''trong'':86,149 ''trưng'':279 ''tuyệt'':22 ''tượng'':290 ''tạo'':212 ''tập'':287 ''tế'':85,114,177 ''tỏa'':118 ''tổng'':215 ''từ'':8,52,137 ''tựa'':187 ''u'':99,110,268,294 ''v'':32,45,64,78,100,112,130,138,225,228,231,270,280 ''vi'':144,206 ''viết'':302 ''việt'':13 ''vẻ'':53,94,154 ''với'':5,204 ''xảo'':211 ''đ'':77,146 ''điểm'':141 ''được'':17,80,133 ''đại'':151 ''đầy'':96 ''đậm'':310 ''đắt'':4 ''đặc'':278 ''đẹp'':54,95,155 ''đến'':93 ''để'':178 ''định'':257 ''động'':58,63,190 ''đời'':19 ''đủ'':175 ''ảo'':68 ''ấn'':312 ''ẩn'':69,102,272'),
  (155, 'một bộ vàng kim', 17, 9, '<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Trọng lượng tham khảo:&nbsp;50.03 ph&acirc;n</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">H&agrave;m lượng chất liệu:&nbsp;5850</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Loại đ&aacute; ch&iacute;nh:&nbsp;Morganite</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">K&iacute;ch thước đ&aacute; ch&iacute;nh (tham khảo):&nbsp;8.0 x 10.0 ly</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">M&agrave;u đ&aacute; ch&iacute;nh:&nbsp;Hồng</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">Loại đ&aacute; phụ:&nbsp;Kim cương</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Số vi&ecirc;n đ&aacute; ch&iacute;nh:&nbsp;1 vi&ecirc;n</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">Số vi&ecirc;n đ&aacute; phụ:&nbsp;84 vi&ecirc;n</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Bộ sưu tập:&nbsp;Masterpiece</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">Giới t&iacute;nh:&nbsp;Nữ</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Thương hiệu:&nbsp;PNJ</div>
</div>
<div class="my-[10px] lg:block hidden">
<div class="product-full-descriptions">
<div class="mp-block-description-wrapper">
<div class="mp-block-description">
<p>Với cảm hứng từ thi&ecirc;n nhi&ecirc;n Việt Nam,&nbsp;<a href="https://www.pnj.com.vn/bo-suu-tap-trang-suc/masterpiece/?atm_source=pdp&amp;atm_medium=bst&amp;atm_campaign=motasanpham&amp;atm_content=">BST Masterpiece</a>&nbsp;được ra đời như một tuyệt t&aacute;c nghệ thuật mang hơi thở của &ldquo;Rừng v&agrave;ng biển bạc&rdquo;.</p>
<p>Bộ trang sức Eternal Mystery thuộc BST Masterpiece &ndash; &ldquo;Rừng v&agrave;ng biển bạc&rdquo; lấy cảm hứng từ vẻ đẹp huyền b&iacute; của Động Phong Nha. Những hang động v&agrave; thạch nhũ kỳ ảo, ẩn sau sự lặng im của n&uacute;i đ&aacute; v&ocirc;i, được t&aacute;i hiện tinh tế trong thiết kế b&ocirc;ng tai, mang đến vẻ đẹp đầy chiều s&acirc;u v&agrave; b&iacute; ẩn, d&agrave;nh cho người phụ nữ s&acirc;u sắc v&agrave; tinh tế, biết c&aacute;ch tỏa s&aacute;ng bằng ch&iacute;nh nội t&acirc;m của m&igrave;nh.</p>
</div>
<div class="mp-block-description">
<p><a href="https://www.pnj.com.vn/lac-vong-tay/vong-tay/vong-tay-vang/?itm_source=pdp&amp;itm_medium=vongtayvang&amp;itm_campaign=&amp;itm_content=">V&ograve;ng tay</a>&nbsp;được chế t&aacute;c từ V&agrave;ng 14K, điểm nhấn l&agrave; vi&ecirc;n đ&aacute; Morganite hồng trong suốt &ndash; đại diện cho vẻ đẹp nội t&acirc;m của người phụ nữ, nổi bật như một b&iacute; mật chỉ d&agrave;nh cho những ai đủ tinh tế để cảm nhận. C&aacute;c chi tiết thả rơi tựa như chuyển động của thạch nhũ theo chiều rơi qua h&agrave;ng triệu năm, kết hợp với những vi&ecirc;n kim cương tinh xảo, tạo n&ecirc;n tổng thể b&ocirc;ng tai mềm mại, nữ t&iacute;nh v&agrave; thanh lịch.</p>
</div>
<div class="mp-block-description">
<p><a href="https://www.pnj.com.vn/lac-vong-tay/vong-tay/vong-tay-vang/?itm_source=pdp&amp;itm_medium=vongtayvang&amp;itm_campaign=&amp;itm_content=">V&ograve;ng tay V&agrave;ng</a> 14K thuộc Bộ trang sức Eternal Mystery kh&ocirc;ng chỉ l&agrave; m&oacute;n trang sức qu&yacute; ph&aacute;i m&agrave; c&ograve;n l&agrave; lời khẳng định phong c&aacute;ch d&agrave;nh cho người phụ nữ s&acirc;u sắc v&agrave; b&iacute; ẩn. Ghi dấu bằng kho&aacute; Masterpiece đặc trưng v&agrave; số lượng giới hạn, Bộ sưu tập l&agrave; biểu tượng của niềm ki&ecirc;u h&atilde;nh, c&ugrave;ng người phụ nữ viết tiếp d&ograve;ng chảy di sản mang đậm dấu ấn ri&ecirc;ng.</p>
</div>
</div>
</div>
</div>', '55000000', '1000000', '150000000', '57000000', '2026-01-14T04:03:00.000Z', 1, 19, '2025-12-19T20:31:57.267Z', true, true, '''1'':52 ''10.0'':33 ''14k'':209,302 ''50.03'':9 ''5850'':17 ''8.0'':31 ''84'':60 ''ai'':243 ''b'':125,158,170,236,286,340 ''biết'':184 ''biển'':103,116 ''biểu'':358 ''bst'':84,111 ''bạc'':104,117 ''bật'':233 ''bằng'':190,344 ''bộ'':2,63,105,304,354 ''c'':93,185,205,250,251,321,328,366 ''ch'':20,24,27,38,50,186,191,329 ''chi'':252 ''chiều'':166,264 ''cho'':174,222,241,332 ''chuyển'':258 ''chảy'':375 ''chất'':15 ''chế'':203 ''chỉ'':238,311 ''cương'':45,278 ''cảm'':75,119,248 ''của'':99,126,143,196,228,260,360 ''d'':172,239,330,373 ''di'':376 ''diện'':221 ''dấu'':343,380 ''eternal'':108,307 ''ghi'':342 ''giới'':67,352 ''h'':12,267,364 ''hang'':131 ''hiện'':152 ''hiệu'':72 ''huyền'':124 ''hơi'':97 ''hạn'':353 ''hồng'':40,217 ''hợp'':272 ''hứng'':76,120 ''i'':145,148,151,319 ''im'':142 ''k'':23 ''kh'':309 ''kho'':345 ''khảo'':8,30 ''khẳng'':325 ''ki'':362 ''kim'':4,44,277 ''kế'':157 ''kết'':271 ''kỳ'':136 ''l'':212,312,323,357 ''liệu'':16 ''loại'':18,41 ''ly'':34 ''lượng'':6,14,351 ''lấy'':118 ''lặng'':141 ''lịch'':296 ''lời'':324 ''m'':13,35,195,197,227,313,320 ''mang'':96,161,378 ''masterpiece'':66,85,112,346 ''morganite'':22,216 ''mystery'':109,308 ''mại'':290 ''mật'':237 ''mềm'':289 ''một'':1,90,235 ''n'':11,48,54,57,62,79,81,144,214,276,282,283,314,322 ''nam'':83 ''ng'':102,115,159,189,200,208,268,287,298,301,310,367,374,383 ''nghệ'':94 ''người'':175,229,333,368 ''nh'':21,28,39,51,69,173,192,198,240,293,331,365 ''nha'':129 ''nhi'':80 ''nhũ'':135,262 ''như'':89,234,257 ''nhấn'':211 ''nhận'':249 ''những'':130,242,274 ''niềm'':361 ''năm'':270 ''nổi'':232 ''nội'':193,225 ''nữ'':70,177,231,291,335,370 ''ph'':10,318 ''phong'':128,327 ''phụ'':43,59,176,230,334,369 ''pnj'':73 ''qu'':317 ''qua'':266 ''ra'':87 ''ri'':382 ''rơi'':255,265 ''rừng'':100,113 ''s'':167,178,188,336 ''sau'':139 ''suốt'':219 ''sưu'':64,355 ''sản'':377 ''sắc'':180,338 ''số'':46,55,350 ''sức'':107,306,316 ''sự'':140 ''t'':68,92,150,194,204,226,292 ''tai'':160,288 ''tay'':201,299 ''tham'':7,29 ''thanh'':295 ''theo'':263 ''thi'':78 ''thiết'':156 ''thuật'':95 ''thuộc'':110,303 ''thương'':71 ''thước'':25 ''thạch'':134,261 ''thả'':254 ''thể'':285 ''thở'':98 ''tinh'':153,182,245,279 ''tiếp'':372 ''tiết'':253 ''trang'':106,305,315 ''triệu'':269 ''trong'':155,218 ''trưng'':348 ''trọng'':5 ''tuyệt'':91 ''tượng'':359 ''tạo'':281 ''tập'':65,356 ''tế'':154,183,246 ''tỏa'':187 ''tổng'':284 ''từ'':77,121,206 ''tựa'':256 ''u'':36,168,179,337,363 ''v'':101,114,133,147,169,181,199,207,294,297,300,339,349 ''vi'':47,53,56,61,213,275 ''viết'':371 ''việt'':82 ''vàng'':3 ''vẻ'':122,163,223 ''với'':74,273 ''x'':32 ''xảo'':280 ''đ'':19,26,37,42,49,58,146,215 ''điểm'':210 ''được'':86,149,202 ''đại'':220 ''đầy'':165 ''đậm'':379 ''đặc'':347 ''đẹp'':123,164,224 ''đến'':162 ''để'':247 ''định'':326 ''động'':127,132,259 ''đời'':88 ''đủ'':244 ''ảo'':137 ''ấn'':381 ''ẩn'':138,171,341'),
  (156, 'vẻ đẹp tiềm ẩn bên ngoài', 17, 9, '<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Trọng lượng tham khảo:&nbsp;50.03 ph&acirc;n</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">H&agrave;m lượng chất liệu:&nbsp;5850</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Loại đ&aacute; ch&iacute;nh:&nbsp;Morganite</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">K&iacute;ch thước đ&aacute; ch&iacute;nh (tham khảo):&nbsp;8.0 x 10.0 ly</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">M&agrave;u đ&aacute; ch&iacute;nh:&nbsp;Hồng</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">Loại đ&aacute; phụ:&nbsp;Kim cương</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Số vi&ecirc;n đ&aacute; ch&iacute;nh:&nbsp;1 vi&ecirc;n</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">Số vi&ecirc;n đ&aacute; phụ:&nbsp;84 vi&ecirc;n</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Bộ sưu tập:&nbsp;Masterpiece</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">Giới t&iacute;nh:&nbsp;Nữ</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Thương hiệu:&nbsp;PNJ</div>
</div>
<div class="my-[10px] lg:block hidden">
<div class="product-full-descriptions">
<div class="mp-block-description-wrapper">
<div class="mp-block-description">
<p>Với cảm hứng từ thi&ecirc;n nhi&ecirc;n Việt Nam,&nbsp;<a href="https://www.pnj.com.vn/bo-suu-tap-trang-suc/masterpiece/?atm_source=pdp&amp;atm_medium=bst&amp;atm_campaign=motasanpham&amp;atm_content=">BST Masterpiece</a>&nbsp;được ra đời như một tuyệt t&aacute;c nghệ thuật mang hơi thở của &ldquo;Rừng v&agrave;ng biển bạc&rdquo;.</p>
<p>Bộ trang sức Eternal Mystery thuộc BST Masterpiece &ndash; &ldquo;Rừng v&agrave;ng biển bạc&rdquo; lấy cảm hứng từ vẻ đẹp huyền b&iacute; của Động Phong Nha. Những hang động v&agrave; thạch nhũ kỳ ảo, ẩn sau sự lặng im của n&uacute;i đ&aacute; v&ocirc;i, được t&aacute;i hiện tinh tế trong thiết kế b&ocirc;ng tai, mang đến vẻ đẹp đầy chiều s&acirc;u v&agrave; b&iacute; ẩn, d&agrave;nh cho người phụ nữ s&acirc;u sắc v&agrave; tinh tế, biết c&aacute;ch tỏa s&aacute;ng bằng ch&iacute;nh nội t&acirc;m của m&igrave;nh.</p>
</div>
<div class="mp-block-description">
<p><a href="https://www.pnj.com.vn/lac-vong-tay/vong-tay/vong-tay-vang/?itm_source=pdp&amp;itm_medium=vongtayvang&amp;itm_campaign=&amp;itm_content=">V&ograve;ng tay</a>&nbsp;được chế t&aacute;c từ V&agrave;ng 14K, điểm nhấn l&agrave; vi&ecirc;n đ&aacute; Morganite hồng trong suốt &ndash; đại diện cho vẻ đẹp nội t&acirc;m của người phụ nữ, nổi bật như một b&iacute; mật chỉ d&agrave;nh cho những ai đủ tinh tế để cảm nhận. C&aacute;c chi tiết thả rơi tựa như chuyển động của thạch nhũ theo chiều rơi qua h&agrave;ng triệu năm, kết hợp với những vi&ecirc;n kim cương tinh xảo, tạo n&ecirc;n tổng thể b&ocirc;ng tai mềm mại, nữ t&iacute;nh v&agrave; thanh lịch.</p>
</div>
<div class="mp-block-description">
<p><a href="https://www.pnj.com.vn/lac-vong-tay/vong-tay/vong-tay-vang/?itm_source=pdp&amp;itm_medium=vongtayvang&amp;itm_campaign=&amp;itm_content=">V&ograve;ng tay V&agrave;ng</a> 14K thuộc Bộ trang sức Eternal Mystery kh&ocirc;ng chỉ l&agrave; m&oacute;n trang sức qu&yacute; ph&aacute;i m&agrave; c&ograve;n l&agrave; lời khẳng định phong c&aacute;ch d&agrave;nh cho người phụ nữ s&acirc;u sắc v&agrave; b&iacute; ẩn. Ghi dấu bằng kho&aacute; Masterpiece đặc trưng v&agrave; số lượng giới hạn, Bộ sưu tập l&agrave; biểu tượng của niềm ki&ecirc;u h&atilde;nh, c&ugrave;ng người phụ nữ viết tiếp d&ograve;ng chảy di sản mang đậm dấu ấn ri&ecirc;ng.</p>
</div>
</div>
</div>
</div>', '50000000', '1000000', '150000000', '52000000', '2026-01-18T09:17:00.000Z', 1, 19, '2025-12-19T20:54:22.351Z', true, true, '''1'':54 ''10.0'':35 ''14k'':211,304 ''50.03'':11 ''5850'':19 ''8.0'':33 ''84'':62 ''ai'':245 ''b'':127,160,172,238,288,342 ''biết'':186 ''biển'':105,118 ''biểu'':360 ''bst'':86,113 ''bên'':5 ''bạc'':106,119 ''bật'':235 ''bằng'':192,346 ''bộ'':65,107,306,356 ''c'':95,187,207,252,253,323,330,368 ''ch'':22,26,29,40,52,188,193,331 ''chi'':254 ''chiều'':168,266 ''cho'':176,224,243,334 ''chuyển'':260 ''chảy'':377 ''chất'':17 ''chế'':205 ''chỉ'':240,313 ''cương'':47,280 ''cảm'':77,121,250 ''của'':101,128,145,198,230,262,362 ''d'':174,241,332,375 ''di'':378 ''diện'':223 ''dấu'':345,382 ''eternal'':110,309 ''ghi'':344 ''giới'':69,354 ''h'':14,269,366 ''hang'':133 ''hiện'':154 ''hiệu'':74 ''huyền'':126 ''hơi'':99 ''hạn'':355 ''hồng'':42,219 ''hợp'':274 ''hứng'':78,122 ''i'':147,150,153,321 ''im'':144 ''k'':25 ''kh'':311 ''kho'':347 ''khảo'':10,32 ''khẳng'':327 ''ki'':364 ''kim'':46,279 ''kế'':159 ''kết'':273 ''kỳ'':138 ''l'':214,314,325,359 ''liệu'':18 ''loại'':20,43 ''ly'':36 ''lượng'':8,16,353 ''lấy'':120 ''lặng'':143 ''lịch'':298 ''lời'':326 ''m'':15,37,197,199,229,315,322 ''mang'':98,163,380 ''masterpiece'':68,87,114,348 ''morganite'':24,218 ''mystery'':111,310 ''mại'':292 ''mật'':239 ''mềm'':291 ''một'':92,237 ''n'':13,50,56,59,64,81,83,146,216,278,284,285,316,324 ''nam'':85 ''ng'':104,117,161,191,202,210,270,289,300,303,312,369,376,385 ''nghệ'':96 ''ngoài'':6 ''người'':177,231,335,370 ''nh'':23,30,41,53,71,175,194,200,242,295,333,367 ''nha'':131 ''nhi'':82 ''nhũ'':137,264 ''như'':91,236,259 ''nhấn'':213 ''nhận'':251 ''những'':132,244,276 ''niềm'':363 ''năm'':272 ''nổi'':234 ''nội'':195,227 ''nữ'':72,179,233,293,337,372 ''ph'':12,320 ''phong'':130,329 ''phụ'':45,61,178,232,336,371 ''pnj'':75 ''qu'':319 ''qua'':268 ''ra'':89 ''ri'':384 ''rơi'':257,267 ''rừng'':102,115 ''s'':169,180,190,338 ''sau'':141 ''suốt'':221 ''sưu'':66,357 ''sản'':379 ''sắc'':182,340 ''số'':48,57,352 ''sức'':109,308,318 ''sự'':142 ''t'':70,94,152,196,206,228,294 ''tai'':162,290 ''tay'':203,301 ''tham'':9,31 ''thanh'':297 ''theo'':265 ''thi'':80 ''thiết'':158 ''thuật'':97 ''thuộc'':112,305 ''thương'':73 ''thước'':27 ''thạch'':136,263 ''thả'':256 ''thể'':287 ''thở'':100 ''tinh'':155,184,247,281 ''tiếp'':374 ''tiết'':255 ''tiềm'':3 ''trang'':108,307,317 ''triệu'':271 ''trong'':157,220 ''trưng'':350 ''trọng'':7 ''tuyệt'':93 ''tượng'':361 ''tạo'':283 ''tập'':67,358 ''tế'':156,185,248 ''tỏa'':189 ''tổng'':286 ''từ'':79,123,208 ''tựa'':258 ''u'':38,170,181,339,365 ''v'':103,116,135,149,171,183,201,209,296,299,302,341,351 ''vi'':49,55,58,63,215,277 ''viết'':373 ''việt'':84 ''vẻ'':1,124,165,225 ''với'':76,275 ''x'':34 ''xảo'':282 ''đ'':21,28,39,44,51,60,148,217 ''điểm'':212 ''được'':88,151,204 ''đại'':222 ''đầy'':167 ''đậm'':381 ''đặc'':349 ''đẹp'':2,125,166,226 ''đến'':164 ''để'':249 ''định'':328 ''động'':129,134,261 ''đời'':90 ''đủ'':246 ''ảo'':139 ''ấn'':383 ''ẩn'':4,140,173,343'),
  (157, 'Kiêu sa lộng lẫy', 13, 9, '<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Trọng lượng tham khảo:&nbsp;44.65133 ph&acirc;n</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">H&agrave;m lượng chất liệu:&nbsp;5850</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Loại đ&aacute; ch&iacute;nh:&nbsp;Kim cương</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">Loại đ&aacute; phụ:&nbsp;Kim cương</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Bộ sưu tập:&nbsp;Timeless Diamond</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">Giới t&iacute;nh:&nbsp;Nữ</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Thương hiệu:&nbsp;PNJ</div>
</div>
<div class="my-[10px] lg:block hidden">
<div class="product-full-descriptions">
<div class="mp-block-description-wrapper">
<div class="mp-block-description">
<p>Lấy cảm hứng từ vẻ đẹp bất biến v&agrave; gi&aacute; trị vĩnh cửu của kim cương, chiếc v&ograve;ng tay trong&nbsp;<a href="https://www.pnj.com.vn/bo-suu-tap-trang-suc/timeless-diamond/?atm_source=pdp&amp;atm_medium=timelessdiamond&amp;atm_campaign=&amp;atm_content=">BST PNJ Timeless Diamond</a>&nbsp;ra đời như một tuyệt t&aacute;c g&oacute;i trọn những khoảnh khắc diệu kỳ. Được chế t&aacute;c từ v&agrave;ng 14K, chiếc&nbsp;<a href="https://www.pnj.com.vn/lac-vong-tay/vong-tay/vong-tay-vang/?atm_source=pdp&amp;atm_medium=vongtayvang&amp;atm_campaign=&amp;atm_content=">v&ograve;ng tay</a>&nbsp;tựa như một dải ng&acirc;n h&agrave; mềm mại &ocirc;m lấy cổ tay, mỗi vi&ecirc;n kim cương được đ&iacute;nh chắc chắn, sắp đặt liền mạch để tạo n&ecirc;n một d&ograve;ng suối &aacute;nh s&aacute;ng bất tận, lấp l&aacute;nh rực rỡ dưới mọi g&oacute;c nh&igrave;n.</p>
</div>
<div class="mp-block-description">
<p>Sở hữu v&ograve;ng tay PNJ Timeless Diamond kh&ocirc;ng chỉ l&agrave; khẳng định phong c&aacute;ch tinh tế, m&agrave; c&ograve;n l&agrave; mang theo b&ecirc;n m&igrave;nh một d&ograve;ng chảy của những g&igrave; đẹp đẽ v&agrave; vĩnh cửu nhất, một lời khẳng định rằng mỗi khoảnh khắc trong cuộc sống đều đ&aacute;ng được tr&acirc;n trọng v&agrave; tỏa s&aacute;ng.</p>
</div>
</div>
</div>
</div>', '100000000', '1000000', '250000000', '100000000', '2026-01-15T13:32:00.000Z', 1, NULL, '2025-12-19T21:11:26.618Z', false, false, '''14k'':88 ''44.65133'':9 ''5850'':17 ''b'':169 ''biến'':48 ''bst'':62 ''bất'':47,131 ''bộ'':29 ''c'':72,84,141,159,164 ''ch'':20,160 ''chiếc'':57,89 ''chảy'':176 ''chất'':15 ''chắc'':114 ''chắn'':115 ''chế'':82 ''chỉ'':154 ''cuộc'':195 ''cương'':23,28,56,110 ''cảm'':42 ''cổ'':104 ''của'':54,177 ''cửu'':53,184 ''d'':125,174 ''diamond'':33,65,151 ''diệu'':79 ''dưới'':138 ''dải'':96 ''g'':73,140,179 ''gi'':50 ''giới'':34 ''h'':12,99 ''hiệu'':39 ''hứng'':43 ''hữu'':145 ''i'':74 ''kh'':152 ''khoảnh'':77,192 ''khảo'':8 ''khắc'':78,193 ''khẳng'':156,188 ''kim'':22,27,55,109 ''kiêu'':1 ''kỳ'':80 ''l'':134,155,166 ''liền'':118 ''liệu'':16 ''loại'':18,24 ''lượng'':6,14 ''lấp'':133 ''lấy'':41,103 ''lẫy'':4 ''lộng'':3 ''lời'':187 ''m'':13,102,163,171 ''mang'':167 ''mạch'':119 ''mại'':101 ''mềm'':100 ''mọi'':139 ''mỗi'':106,191 ''một'':69,95,124,173,186 ''n'':11,98,108,122,123,143,165,170,202 ''ng'':59,87,91,97,126,130,147,153,175,199,207 ''nh'':21,36,113,128,135,142,172 ''như'':68,94 ''nhất'':185 ''những'':76,178 ''nữ'':37 ''ph'':10 ''phong'':158 ''phụ'':26 ''pnj'':40,63,149 ''ra'':66 ''rằng'':190 ''rỡ'':137 ''rực'':136 ''s'':129,206 ''sa'':2 ''suối'':127 ''sưu'':30 ''sắp'':116 ''sống'':196 ''sở'':144 ''t'':35,71,83 ''tay'':60,92,105,148 ''tham'':7 ''theo'':168 ''thương'':38 ''timeless'':32,64,150 ''tinh'':161 ''tr'':201 ''trong'':61,194 ''trị'':51 ''trọn'':75 ''trọng'':5,203 ''tuyệt'':70 ''tạo'':121 ''tận'':132 ''tập'':31 ''tế'':162 ''tỏa'':205 ''từ'':44,85 ''tựa'':93 ''v'':49,58,86,90,146,182,204 ''vi'':107 ''vĩnh'':52,183 ''vẻ'':45 ''đ'':19,25,112,198 ''được'':81,111,200 ''đặt'':117 ''đẹp'':46,180 ''đẽ'':181 ''đều'':197 ''để'':120 ''định'':157,189 ''đời'':67'),
  (158, 'Set Vest Nữ Áo + Quần', 13, 9, '<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Trọng lượng tham khảo:&nbsp;56.04633 ph&acirc;n</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">H&agrave;m lượng chất liệu:&nbsp;5850</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Loại đ&aacute; ch&iacute;nh:&nbsp;Tanzanite</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">Loại đ&aacute; phụ:&nbsp;Mix đ&aacute;</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Bộ sưu tập:&nbsp;Masterpiece</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">Giới t&iacute;nh:&nbsp;Nữ</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Thương hiệu:&nbsp;PNJ</div>
</div>
<div class="my-[10px] lg:block hidden">
<div class="product-full-descriptions">
<div class="mp-block-description-wrapper">
<div class="mp-block-description">
<p>Với cảm hứng từ thi&ecirc;n nhi&ecirc;n Việt Nam,&nbsp;<a href="https://www.pnj.com.vn/bo-suu-tap-trang-suc/masterpiece/?atm_source=pdp&amp;atm_medium=bst&amp;atm_campaign=motasanpham&amp;atm_content=">BST Masterpiece&nbsp;</a>ra đời như một tuyệt t&aacute;c nghệ thuật mang hơi thở của &ldquo;Rừng v&agrave;ng biển bạc&rdquo;. Bộ trang sức CURVES OF WONDER thuộc BST Masterpiece &ndash; Rừng v&agrave;ng biển bạc được lấy cảm hứng từ Vịnh Hạ Long, nơi những dải s&oacute;ng nước mềm mại &ocirc;m ấp lấy từng ngọn n&uacute;i đ&aacute; v&ocirc;i. Thiết kế l&agrave; lời t&ocirc;n vinh vẻ đẹp người phụ nữ Việt: mềm mại nhưng ki&ecirc;n định, s&acirc;u lắng m&agrave; vẫn rạng ngời kh&iacute; chất.</p>
</div>
<div class="mp-block-description">
<p><a href="https://www.pnj.com.vn/lac-vong-tay/vong-tay/vong-tay-vang/?itm_source=pdp&amp;itm_medium=vongtayvang&amp;itm_campaign=&amp;itm_content=">V&ograve;ng tay</a>&nbsp;được chế t&aacute;c từ V&agrave;ng Trắng 14K đ&iacute;nh đ&aacute; chủ Tanzanite qu&yacute; hiếm biểu tượng cho sự b&iacute; ẩn v&agrave; nổi bật b&ecirc;n những vi&ecirc;n kim cương v&agrave; sapphire xanh trải d&agrave;i quanh chiếc v&ograve;ng - biểu tượng của sự tự do, chuyển động v&agrave; vĩnh cửu. B&agrave;n tay nghệ nh&acirc;n tỉ mỉ khắc họa n&ecirc;n Hạ Long kh&ocirc;ng chỉ với vẻ đẹp h&ugrave;ng vĩ, m&agrave; c&ograve;n l&agrave; sự h&agrave;i h&ograve;a giữa chuyển động v&agrave; tĩnh tại, vẻ đẹp giao h&ograve;a giữa thi&ecirc;n nhi&ecirc;n v&agrave; nghệ thuật, khiến ta kh&ocirc;ng khỏi ngước nh&igrave;n, chi&ecirc;m ngưỡng.</p>
</div>
<div class="mp-block-description">
<p><a href="https://www.pnj.com.vn/lac-vong-tay/vong-tay/vong-tay-vang/?itm_source=pdp&amp;itm_medium=vongtayvang&amp;itm_campaign=&amp;itm_content=">V&ograve;ng tay V&agrave;ng</a> Trắng 14K thuộc Bộ trang sức CURVES OF WONDER kh&ocirc;ng chỉ l&agrave; m&oacute;n trang sức tinh xảo, m&agrave; c&ograve;n l&agrave; lời t&ocirc;n vinh vẻ đẹp v&agrave; kh&iacute; chất của người phụ nữ Việt - mạnh mẽ, ki&ecirc;n định nhưng đầy uyển chuyển. Ghi dấu bằng kh&oacute;a Masterpiece khảm đ&aacute; đặc trưng, được sản xuất với số lượng giới hạn, bộ sưu tập l&agrave; biểu tượng của niềm ki&ecirc;u h&atilde;nh, c&ugrave;ng người phụ nữ viết tiếp h&agrave;nh tr&igrave;nh di sản mang đậm dấu ấn ri&ecirc;ng.</p>
</div>
</div>
</div>
</div>', '0', '10000000', '150000000', '20000000', '2026-01-15T05:35:00.000Z', 1, 19, '2025-12-19T21:51:31.071Z', false, false, '''14k'':149,262 ''56.04633'':10 ''5850'':18 ''a'':225,236,311 ''b'':161,166,194 ''biển'':68,82 ''biểu'':157,183,329 ''bst'':50,77 ''bạc'':69,83 ''bật'':165 ''bằng'':309 ''bộ'':29,70,264,325 ''c'':58,144,218,281,337 ''ch'':21 ''chi'':253 ''chiếc'':180 ''cho'':159 ''chuyển'':189,227,306 ''chất'':16,137,292 ''chế'':142 ''chỉ'':210,272 ''chủ'':153 ''curves'':73,267 ''cương'':172 ''cảm'':41,86 ''của'':64,185,293,331 ''cửu'':193 ''d'':177 ''di'':348 ''do'':188 ''dải'':94 ''dấu'':308,352 ''ghi'':307 ''giao'':234 ''giới'':33,323 ''giữa'':226,237 ''h'':13,214,222,224,235,335,344 ''hiếm'':156 ''hiệu'':38 ''hơi'':62 ''hạ'':90,206 ''hạn'':324 ''họa'':203 ''hứng'':42,87 ''i'':106,109,178,223 ''kh'':136,208,247,270,291,310 ''khiến'':245 ''khảm'':313 ''khảo'':9 ''khắc'':202 ''khỏi'':249 ''ki'':126,300,333 ''kim'':171 ''kế'':111 ''l'':112,220,273,283,328 ''liệu'':17 ''long'':91,207 ''loại'':19,24 ''lượng'':7,15,322 ''lấy'':85,102 ''lắng'':131 ''lời'':113,284 ''m'':14,100,132,217,254,274,280 ''mang'':61,350 ''masterpiece'':32,51,78,312 ''mix'':27 ''mại'':99,124 ''mạnh'':298 ''mẽ'':299 ''mềm'':98,123 ''mỉ'':201 ''một'':55 ''n'':12,45,47,105,115,127,167,170,195,199,204,205,219,239,241,252,275,282,286,301 ''nam'':49 ''ng'':67,81,96,139,147,182,209,215,248,257,260,271,338,355 ''nghệ'':59,197,243 ''ngước'':250 ''người'':119,294,339 ''ngưỡng'':255 ''ngọn'':104 ''ngời'':135 ''nh'':22,35,151,198,251,336,345,347 ''nhi'':46,240 ''như'':54 ''nhưng'':125,303 ''những'':93,168 ''niềm'':332 ''nơi'':92 ''nước'':97 ''nổi'':164 ''nữ'':3,36,121,296,341 ''of'':74,268 ''ph'':11 ''phụ'':26,120,295,340 ''pnj'':39 ''qu'':155 ''quanh'':179 ''quần'':5 ''ra'':52 ''ri'':354 ''rạng'':134 ''rừng'':65,79 ''s'':95,129 ''sapphire'':174 ''set'':1 ''sưu'':30,326 ''sản'':318,349 ''số'':321 ''sức'':72,266,277 ''sự'':160,186,221 ''t'':34,57,114,143,285 ''ta'':246 ''tanzanite'':23,154 ''tay'':140,196,258 ''tham'':8 ''thi'':44,238 ''thiết'':110 ''thuật'':60,244 ''thuộc'':76,263 ''thương'':37 ''thở'':63 ''tinh'':278 ''tiếp'':343 ''tr'':346 ''trang'':71,265,276 ''trưng'':316 ''trải'':176 ''trắng'':148,261 ''trọng'':6 ''tuyệt'':56 ''tĩnh'':230 ''tượng'':158,184,330 ''tại'':231 ''tập'':31,327 ''tỉ'':200 ''từ'':43,88,145 ''từng'':103 ''tự'':187 ''u'':130,334 ''uyển'':305 ''v'':66,80,108,138,146,163,173,181,191,229,242,256,259,290 ''vest'':2 ''vi'':169 ''vinh'':116,287 ''viết'':342 ''việt'':48,122,297 ''vĩ'':216 ''vĩnh'':192 ''vẫn'':133 ''vẻ'':117,212,232,288 ''vịnh'':89 ''với'':40,211,320 ''wonder'':75,269 ''xanh'':175 ''xuất'':319 ''xảo'':279 ''áo'':4 ''đ'':20,25,28,107,150,152,314 ''được'':84,141,317 ''đầy'':304 ''đậm'':351 ''đặc'':315 ''đẹp'':118,213,233,289 ''định'':128,302 ''động'':190,228 ''đời'':53 ''ấn'':353 ''ấp'':101 ''ẩn'':162'),
  (159, 'Lấp lánh ánh kim', 17, 9, '<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Trọng lượng tham khảo:&nbsp;141.2 ph&acirc;n</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">H&agrave;m lượng chất liệu:&nbsp;5850</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Loại đ&aacute; ch&iacute;nh:&nbsp;Tanzanite</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">Loại đ&aacute; phụ:&nbsp;Mix đ&aacute;</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Bộ sưu tập:&nbsp;Masterpiece</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px]">Giới t&iacute;nh:&nbsp;Nữ</div>
</div>
<div class="">
<div class="px-2 py-1 text-[14px] bg-[#f2f2f2]">Thương hiệu:&nbsp;PNJ</div>
</div>
<div class="my-[10px] lg:block hidden">
<div class="product-full-descriptions">
<div class="mp-block-description-wrapper">
<div class="mp-block-description">
<p>Với cảm hứng từ thi&ecirc;n nhi&ecirc;n Việt Nam,&nbsp;<a href="https://www.pnj.com.vn/bo-suu-tap-trang-suc/masterpiece/?atm_source=pdp&amp;atm_medium=bst&amp;atm_campaign=motasanpham&amp;atm_content=">BST Masterpiece</a>&nbsp;ra đời như một tuyệt t&aacute;c nghệ thuật mang hơi thở của &ldquo;Rừng v&agrave;ng biển bạc&rdquo;. Bộ trang sức CURVES OF WONDER thuộc BST Masterpiece &ndash; Rừng v&agrave;ng biển bạc được lấy cảm hứng từ Vịnh Hạ Long, nơi những dải s&oacute;ng nước mềm mại &ocirc;m ấp lấy từng ngọn n&uacute;i đ&aacute; v&ocirc;i. Thiết kế l&agrave; lời t&ocirc;n vinh vẻ đẹp người phụ nữ Việt: mềm mại nhưng ki&ecirc;n định, s&acirc;u lắng m&agrave; vẫn rạng ngời kh&iacute; chất.</p>
</div>
<div class="mp-block-description">
<p><a href="https://www.pnj.com.vn/day-co/day-co-vang-pnj/?itm_source=pdp&amp;itm_medium=daycovang&amp;itm_campaign=&amp;itm_content=">D&acirc;y cổ</a>&nbsp;được chế t&aacute;c từ V&agrave;ng Trắng 14K đ&iacute;nh đ&aacute; chủ Tanzanite, nổi bật b&ecirc;n những đường cong đ&aacute; Sapphire lượn s&oacute;ng tinh tế trải d&agrave;i &ndash; biểu trưng cho sự tự do, chuyển động v&agrave; vĩnh cửu. B&agrave;n tay nghệ nh&acirc;n tỉ mỉ khắc họa n&ecirc;n Hạ Long kh&ocirc;ng chỉ với vẻ đẹp h&ugrave;ng vĩ, m&agrave; c&ograve;n l&agrave; sự h&agrave;i h&ograve;a giữa chuyển động v&agrave; tĩnh tại, vẻ đẹp giao h&ograve;a giữa thi&ecirc;n nhi&ecirc;n v&agrave; nghệ thuật &mdash; khiến ta kh&ocirc;ng khỏi ngước nh&igrave;n, chi&ecirc;m ngưỡng.</p>
</div>
<div class="mp-block-description">
<p><a href="https://www.pnj.com.vn/day-co/day-co-vang-pnj/?itm_source=pdp&amp;itm_medium=daycovang&amp;itm_campaign=&amp;itm_content=">D&acirc;y cổ</a> V&agrave;ng Trắng 14K thuộc Bộ trang sức CURVES OF WONDER kh&ocirc;ng chỉ l&agrave; m&oacute;n trang sức mang t&iacute;nh thẩm mỹ cao m&agrave; c&ograve;n l&agrave; tuyệt t&aacute;c nghệ thuật, biểu tượng của vẻ đẹp mạnh mẽ nhưng đầy uyển chuyển. Ghi dấu bằng kh&oacute;a Masterpiece khảm đ&aacute; đặc trưng, được sản xuất với số lượng giới hạn, bộ sưu tập l&agrave; biểu tượng của niềm ki&ecirc;u h&atilde;nh, c&ugrave;ng người phụ nữ viết tiếp h&agrave;nh tr&igrave;nh di sản mang đậm dấu ấn ri&ecirc;ng.</p>
</div>
</div>
</div>
</div>
        <div style="margin-top: 20px; border-top: 1px dashed #ccc; padding-top: 10px;">
            <p>
                <span style="background-color: #fff3cd; padding: 5px 10px; border-radius: 5px; font-weight: bold;">
                    ✏️ Cập nhật ngày: 05:39:13 20/12/2025
                </span>
            </p>
        </div>
    <p>m&ocirc; tả sau khi ended</p>
        <div style="margin-top: 20px; border-top: 1px dashed #ccc; padding-top: 10px;">
            <p>
                <span style="background-color: #fff3cd; padding: 5px 10px; border-radius: 5px; font-weight: bold;">
                    ✏️ Cập nhật ngày: 06:01:48 5/1/2026
                </span>
            </p>
        </div>
    <p>Bổ sung m&ocirc; tả cho sản phẩm&nbsp;</p>', '100000000', '10000000', '600000000', '100000000', '2026-01-16T14:21:00.000Z', 1, NULL, '2025-12-19T22:35:59.581Z', true, false, '''01'':357 ''05'':344 ''06'':356 ''13'':346 ''141.2'':9 ''14k'':148,250 ''20/12/2025'':347 ''39'':345 ''48'':358 ''5/1/2026'':359 ''5850'':17 ''a'':213,224,296 ''b'':156,182 ''biển'':67,81 ''biểu'':171,281,314 ''bst'':49,76 ''bạc'':68,82 ''bật'':155 ''bằng'':294 ''bổ'':360 ''bộ'':28,69,252,310 ''c'':57,143,206,273,278,322 ''cao'':271 ''ch'':20 ''chi'':241 ''cho'':173,364 ''chuyển'':177,215,291 ''chất'':15,136 ''chế'':141 ''chỉ'':198,260 ''chủ'':152 ''cong'':160 ''curves'':72,255 ''cảm'':40,85 ''cập'':341,353 ''cổ'':139,246 ''của'':63,283,316 ''cửu'':181 ''d'':137,169,244 ''di'':333 ''do'':176 ''dải'':93 ''dấu'':293,337 ''ended'':352 ''ghi'':292 ''giao'':222 ''giới'':32,308 ''giữa'':214,225 ''h'':12,202,210,212,223,320,329 ''hiệu'':37 ''hơi'':61 ''hạ'':89,194 ''hạn'':309 ''họa'':191 ''hứng'':41,86 ''i'':105,108,170,211 ''kh'':135,196,235,258,295 ''khi'':351 ''khiến'':233 ''khảm'':298 ''khảo'':8 ''khắc'':190 ''khỏi'':237 ''ki'':125,318 ''kim'':4 ''kế'':110 ''l'':111,208,261,275,313 ''liệu'':16 ''long'':90,195 ''loại'':18,23 ''lánh'':2 ''lượn'':163 ''lượng'':6,14,307 ''lấp'':1 ''lấy'':84,101 ''lắng'':130 ''lời'':112 ''m'':13,99,131,205,242,262,272,348,362 ''mang'':60,266,335 ''masterpiece'':31,50,77,297 ''mix'':26 ''mại'':98,123 ''mạnh'':286 ''mẽ'':287 ''mềm'':97,122 ''mỉ'':189 ''một'':54 ''mỹ'':270 ''n'':11,44,46,104,114,126,157,183,187,192,193,207,227,229,240,263,274 ''nam'':48 ''ng'':66,80,95,146,165,197,203,236,248,259,323,340 ''nghệ'':58,185,231,279 ''ngày'':343,355 ''ngước'':238 ''người'':118,324 ''ngưỡng'':243 ''ngọn'':103 ''ngời'':134 ''nh'':21,34,150,186,239,268,321,330,332 ''nhi'':45,228 ''như'':53 ''nhưng'':124,288 ''nhật'':342,354 ''những'':92,158 ''niềm'':317 ''nơi'':91 ''nước'':96 ''nổi'':154 ''nữ'':35,120,326 ''of'':73,256 ''ph'':10 ''phẩm'':366 ''phụ'':25,119,325 ''pnj'':38 ''ra'':51 ''ri'':339 ''rạng'':133 ''rừng'':64,78 ''s'':94,128,164 ''sapphire'':162 ''sau'':350 ''sung'':361 ''sưu'':29,311 ''sản'':303,334,365 ''số'':306 ''sức'':71,254,265 ''sự'':174,209 ''t'':33,56,113,142,267,277 ''ta'':234 ''tanzanite'':22,153 ''tay'':184 ''tham'':7 ''thi'':43,226 ''thiết'':109 ''thuật'':59,232,280 ''thuộc'':75,251 ''thương'':36 ''thẩm'':269 ''thở'':62 ''tinh'':166 ''tiếp'':328 ''tr'':331 ''trang'':70,253,264 ''trưng'':172,301 ''trải'':168 ''trắng'':147,249 ''trọng'':5 ''tuyệt'':55,276 ''tĩnh'':218 ''tượng'':282,315 ''tại'':219 ''tả'':349,363 ''tập'':30,312 ''tế'':167 ''tỉ'':188 ''từ'':42,87,144 ''từng'':102 ''tự'':175 ''u'':129,319 ''uyển'':290 ''v'':65,79,107,145,179,217,230,247 ''vinh'':115 ''viết'':327 ''việt'':47,121 ''vĩ'':204 ''vĩnh'':180 ''vẫn'':132 ''vẻ'':116,200,220,284 ''vịnh'':88 ''với'':39,199,305 ''wonder'':74,257 ''xuất'':304 ''y'':138,245 ''ánh'':3 ''đ'':19,24,27,106,149,151,161,299 ''đường'':159 ''được'':83,140,302 ''đầy'':289 ''đậm'':336 ''đặc'':300 ''đẹp'':117,201,221,285 ''định'':127 ''động'':178,216 ''đời'':52 ''ấn'':338 ''ấp'':100'),
  (160, 'Lenovo Legion Pro 5i Gaming RTX 4070', 17, 7, '<p>Đối với những bạn ưa th&iacute;ch sử dụng b&agrave;n ph&iacute;m&nbsp;<a href="https://thinkpro.vn/laptop" target="" rel="">laptop</a>&nbsp;truyền thống thay v&igrave; c&aacute;c loại b&agrave;n ph&iacute;m cơ th&ocirc;ng thường th&igrave;&nbsp;<a href="https://thinkpro.vn/ban-phim/ban-phim-co-lofree-egde-ultra-low-proflie" target="" rel="">Lofree EDGE</a>&nbsp;với thiết kế Low Profile ch&iacute;nh l&agrave; lựa chọn ho&agrave;n hảo đấy. H&atilde;y c&ugrave;ng m&igrave;nh t&igrave;m hiểu th&ecirc;m về mẫu&nbsp;<a href="https://thinkpro.vn/ban-phim" target="" rel="">b&agrave;n ph&iacute;m</a>&nbsp;n&agrave;y th&ocirc;ng qua b&agrave;i viết b&ecirc;n dưới nh&eacute;.</p>
<h3 id="cCGu8" data-toc-id="cCGu8">Lofree EDGE thuộc thiết kế low profile</h3>
<p>Về thiết kế, Lofree EDGE sẽ kh&aacute; k&eacute;n người d&ugrave;ng bởi em n&oacute; được thiết kế với kiểu d&aacute;ng low profile với độ cao c&aacute;c ph&iacute;m ngang bằng nhau, h&agrave;nh tr&igrave;nh ph&iacute;m ngắn cũng như khoảng c&aacute;ch giữa c&aacute;c ph&iacute;m sẽ c&oacute; phần hạn chế hơn. Do đ&oacute;, đối với c&aacute;c bạn từ l&acirc;u đ&atilde; quen thuộc với kiểu d&aacute;ng b&agrave;n ph&iacute;m laptop th&igrave; sẽ dễ tiếp cận với low profile hơn so với c&aacute;c profile b&agrave;n ph&iacute;m cơ kh&aacute;c.</p>
<div data-type="imageBlock"><img src="https://d28jzcg6y4v9j1.cloudfront.net/ban_phim_co_lofree_egde_1720293446238.jpg" alt="Lofree EDGE" loading="lazy" data-width="100%" data-align="center"></div>
<p>Để đảm bảo cho t&iacute;nh cơ động, độ mỏng nhẹ ph&ugrave; hợp cho c&aacute;c bạn c&oacute; nhu cầu di chuyển cao, h&atilde;ng đ&atilde; thiết kế cho Lofree EDGE một layout tinh gọn hơn, chỉ&nbsp;<strong>75%</strong>, lược bỏ đi phần numpad v&agrave; c&aacute;c ph&iacute;m chức năng &iacute;t sử dụng kh&aacute;c. Đặc biệt, phần khung của ph&iacute;m c&ograve;n được l&agrave;m ho&agrave;n to&agrave;n từ hợp kim magie v&agrave; carbon fiber, mang lại sự chắc chắn, bền bỉ.</p>
<div data-type="imageBlock"><img src="https://d28jzcg6y4v9j1.cloudfront.net/cac_phim_1720293446336.jpg" alt="B&agrave;n ph&iacute;m với chỉ 84 N&uacute;t" loading="lazy" data-width="100%" data-align="center"></div>
<p>Nh&igrave;n chung, theo cảm nhận c&aacute; nh&acirc;n của m&igrave;nh Lofree EDGE sẽ ph&ugrave; hợp nhất với c&aacute;c bạn content creator thường xuy&ecirc;n phải l&agrave;m việc với con chữ, phải thay đổi chỗ l&agrave;m việc thường xuy&ecirc;n. C&ograve;n đối với những người chuy&ecirc;n l&agrave;m việc li&ecirc;n quan đến mảng số liệu th&igrave; một chiếc b&agrave;n ph&iacute;m với chỉ&nbsp;<strong>84 N&uacute;t</strong>&nbsp;v&agrave; cắt giảm đi phần numpad sẽ g&acirc;y bất tiện kha kh&aacute;.</p>
<h3 id="tsdxY" data-toc-id="tsdxY">Switch Kailh POM 2.0 c&oacute; chất liệu cao cấp</h3>
<p>Cũng tương tự như đ&agrave;n anh&nbsp;<a href="https://thinkpro.vn/ban-phim/ban-phim-co-lofree-flow" target="" rel="">Lofree Flow</a>&nbsp;đ&atilde; từng được ra mắt trước đ&acirc;y, Lofree EDGE sử dụng switch của&nbsp;<strong>Kailh</strong>, một thương hiệu chuy&ecirc;n sản xuất linh kiện b&agrave;n ph&iacute;m cơ được ưa th&iacute;ch v&agrave; tin d&ugrave;ng nhờ độ ho&agrave;n thiện tỉ mỉ của từng sản phẩm.</p>
<p>Đặc biệt, mẫu switch n&agrave;y được l&agrave;m ho&agrave;n to&agrave;n từ nhựa POM, chất liệu nhựa cao cấp c&oacute; khả năng tự b&ocirc;i trơn, chắc chắn, bền bỉ hơn rất nhiều so với nhựa th&ocirc;ng thường. H&agrave;nh tr&igrave;nh ph&iacute;m của Switch Kailh POM 2.0 cũng sẽ c&oacute; phần ngắn hơn so với c&aacute;c loại switch kh&aacute;c hiện nay, chỉ&nbsp;<strong>2.4mm</strong>&nbsp;mang lại khả năng hỗ trợ ph&iacute;m cực nhanh.</p>
<div data-type="imageBlock"><img src="https://d28jzcg6y4v9j1.cloudfront.net/switch_1720293454915.jpg" alt="Switch Kailh POM 2.0" loading="lazy" data-width="100%" data-align="center"></div>
<p>Ở mẫu b&agrave;n ph&iacute;m n&agrave;y, switch sẽ được h&agrave;n chết tr&ecirc;n&nbsp;<strong>PCB</strong>, kh&ocirc;ng c&oacute; t&iacute;nh năng Hot swap, do đ&oacute;, em n&oacute; sẽ ph&ugrave; hợp hơn với những bạn ưa th&iacute;ch thể loại ph&iacute;m &ldquo;m&igrave; ăn liền&rdquo;, mua về l&agrave; d&ugrave;ng được ngay, kh&ocirc;ng cần phải lube hay mod trước. C&aacute; nh&acirc;n m&igrave;nh th&igrave; lại th&iacute;ch như thế n&agrave;y hơn v&igrave; việc mod b&agrave;n ph&iacute;m chỉ ph&ugrave; hợp với c&aacute;c bạn c&oacute; sở th&iacute;ch m&agrave;y m&ograve;, t&igrave;m hiểu, c&ograve;n với người chỉ mua ph&iacute;m về để hỗ trợ c&ocirc;ng việc như m&igrave;nh th&igrave; mod sẽ kh&aacute; tốn nhiều thời gian v&agrave; c&ocirc;ng sức.</p>
<h3 id="k6ttd" data-toc-id="k6ttd">Keycap PBT Dye-Subbed cao cấp</h3>
<p>Ngay từ khoảnh khắc nh&igrave;n v&agrave;o, Lofree EDGE đ&atilde; ngay lập tức to&aacute;t l&ecirc;n vẻ cao cấp kh&ocirc;ng chỉ nhờ phần khung được l&agrave;m từ hợp kim carbon m&agrave; c&ograve;n nhờ v&agrave;o phần keycap nhựa PBT được in Dye-Subbed cao cấp, bền bỉ.</p>
<div data-type="imageBlock"><img src="https://d28jzcg6y4v9j1.cloudfront.net/key_cap_1720293450122_1720756592482.jpg" alt="Keycap PBT Dye-Subbed" loading="lazy" data-width="100%" data-align="center"></div>
<p>Với nhựa&nbsp;<strong>PBT</strong>, keycap của ph&iacute;m sẽ c&oacute; độ bền cực tốt, cảm gi&aacute;c sờ rắn chắc, kh&oacute; biến dạng. C&ograve;n với c&ocirc;ng nghệ in&nbsp;<strong>Dye-Subbed</strong>, c&aacute;c k&yacute; tự tr&ecirc;n ph&iacute;m sẽ cực kỳ bền, kh&oacute; bị phai đi sau khi sử dụng trong thời gian d&agrave;i</p>
<h3 id="m4gss" data-toc-id="m4gss">Đ&egrave;n LED đơn sắc tiện lợi</h3>
<p>V&igrave; đ&acirc;y l&agrave; một mẫu b&agrave;n ph&iacute;m d&agrave;nh ri&ecirc;ng cho d&acirc;n văn ph&ograve;ng, do đ&oacute;, phần đ&egrave;n LED của ph&iacute;m sẽ chỉ l&agrave; LED đơn sắc trắng. Điều n&agrave;y cũng sẽ hạn chế sự ph&acirc;n t&acirc;m cho người d&ugrave;ng trong l&uacute;c l&agrave;m việc cũng như hỗ trợ tốt hơn khi sử dụng ph&iacute;m trong điều kiện thiếu s&aacute;ng.</p>
<div data-type="imageBlock"><img src="https://d28jzcg6y4v9j1.cloudfront.net/led_don_sac_1720293452862_1720756594953.jpg" alt="Đ&egrave;n LED đơn sắc" loading="lazy" data-width="100%" data-align="center"></div>
<h3 id="ihaFK" data-toc-id="ihaFK">K&iacute;ch thước mỏng nhẹ, tiện lợi khi di chuyển</h3>
<p>Như m&igrave;nh đ&atilde; n&oacute;i ở tr&ecirc;n, em ph&iacute;m n&agrave;y sẽ hợp hơn với c&aacute;c bạn c&oacute; nhu cầu thường xuy&ecirc;n phải di chuyển nhờ k&iacute;ch thước mỏng nhẹ, trọng lượng vừa phải. Cụ thể, mẫu&nbsp;<a href="https://thinkpro.vn/ban-phim-lofree" target="" rel="">b&agrave;n ph&iacute;m Lofree</a>&nbsp;n&agrave;y c&oacute; trọng lượng kh&aacute; nhẹ chỉ&nbsp;<strong>0.485kg</strong>&nbsp;c&ugrave;ng k&iacute;ch thước lần lượt l&agrave;&nbsp;<strong>31,8x15.4x1.65cm</strong>. Nhờ đ&oacute;, em n&oacute; c&oacute; thể dễ d&agrave;ng được nh&eacute;t gọn trong balo, t&uacute;i x&aacute;ch v&agrave; mang đi bất cứ đ&acirc;u m&agrave; kh&ocirc;ng qu&aacute; bị ảnh hưởng bởi trọng lượng như c&aacute;c mẫu b&agrave;n ph&iacute;m cơ kh&aacute;c.</p>
<div data-type="imageBlock"><img src="https://d28jzcg6y4v9j1.cloudfront.net/kich_thuoc_1720293771972.jpg" alt="K&iacute;ch thước mỏng nhẹ" loading="lazy" data-width="100%" data-align="center"></div>
<h3 id="zJrHz" data-toc-id="zJrHz">Hai chế độ kết nối tiện lợi</h3>
<p>Để tiện lợi hơn trong việc di chuyển, Lofree EDGE sẽ hỗ trợ kết nối kh&ocirc;ng d&acirc;y bluetooth với độ trễ cực kỳ thấp. Ngo&agrave;i ra, em n&oacute; c&ograve;n hỗ trợ cả kết nối c&oacute; d&acirc;y, với độ d&agrave;i d&acirc;y l&ecirc;n đến&nbsp;<strong>140cm</strong>&nbsp;ph&ograve;ng ngừa trường hợp ph&iacute;m hết pin hoặc trục trặc trong qu&aacute; tr&igrave;nh kết nối bluetooth.</p>
<div data-type="imageBlock"><img src="https://d28jzcg6y4v9j1.cloudfront.net/mode_ket_noi_1720293976532.jpg" alt="Hai mode kết nối tiện lợi" loading="lazy" data-width="100%" data-align="center"></div>
<h3 id="aB9Ww" data-toc-id="aB9Ww">Vi&ecirc;n pin 2000mAh c&oacute; phần hạn chế</h3>
<p>Lofree EDGE được trang bị một vi&ecirc;n pin c&oacute; phần hạn chế chỉ&nbsp;<strong>2000mAh</strong>&nbsp;mang lại thời lượng sử dụng trung b&igrave;nh trong khoảng&nbsp;<strong>42 tiếng</strong>&nbsp;sử dụng li&ecirc;n tục. B&ugrave; lại, c&aacute;c bạn vẫn c&oacute; thể ngay lập tức kết nối d&acirc;y v&agrave; sử dụng ph&iacute;m trong qu&aacute; tr&igrave;nh chờ đợi pin được sạc đầy. M&igrave;nh đ&aacute;nh gi&aacute; điều n&agrave;y cũng kh&aacute; hợp l&yacute; khi em ph&iacute;m n&agrave;y đang đặt độ ưu ti&ecirc;n h&agrave;ng đầu cho t&iacute;nh mỏng nhẹ v&agrave; khả năng di động cao nhất c&oacute; thể.</p>
<h3 id="6bbl1" data-toc-id="6bbl1">Khả năng tương t&iacute;ch đa hệ điều h&agrave;nh</h3>
<p>Điểm đặc biệt nhất m&agrave; Lofree EDGE sở hữu ch&iacute;nh l&agrave; khả năng hỗ trợ hầu hết c&aacute;c hệ điều h&agrave;nh hiện nay như&nbsp;<strong>Windows</strong>,<strong>&nbsp;MacOS</strong>,&nbsp;<strong>IOS</strong>,&nbsp;<strong>Android</strong>&nbsp;v&agrave; cả&nbsp;<strong>Linux</strong>. Do đ&oacute;, khi mua em n&oacute; về, bạn sẽ kh&ocirc;ng cần phải lo lắng rằng ph&iacute;m c&oacute; sử dụng được tr&ecirc;n m&aacute;y của m&igrave;nh hay kh&ocirc;ng bởi, d&ugrave; l&agrave; hệ điều h&agrave;nh n&agrave;o, em n&oacute; cũng sẽ hỗ trợ tốt cho bạn trong qu&aacute; tr&igrave;nh l&agrave;m việc.</p>
<div data-type="imageBlock"><img src="https://d28jzcg6y4v9j1.cloudfront.net/ket_noi_1720293449840.jpg" alt="Tương t&iacute;ch đa hệ điều h&agrave;nh" loading="lazy" data-width="100%" data-align="center"></div>
<p>Tổng kết lại, đối với c&aacute;c bạn Content Creator như m&igrave;nh, lu&ocirc;n phải l&agrave;m việc với con chữ, phải thường xuy&ecirc;n ra ngo&agrave;i để t&igrave;m th&ecirc;m nguồn cảm hứng th&igrave; Lofree EDGE sẽ l&agrave; lựa chọn ho&agrave;n hảo. Để đặt mua sản phẩm tại&nbsp;<a href="https://thinkpro.vn/" target="" rel="">ThinkPro</a>, c&aacute;c bạn c&oacute; thể click v&agrave;o ph&iacute;m &ldquo;<strong>Đặt h&agrave;ng</strong>&rdquo; ngay b&ecirc;n tr&ecirc;n hoặc gọi cho Hotline&nbsp;<a href="tel:1900633579" target="" rel="nofollow noopener noreferrer"><strong>1900633579</strong></a> để được tư vấn cụ thể nh&eacute;.</p>', '0', '100000', '3333330', '100000', '2025-12-31T19:03:00.000Z', 2, 19, '2025-12-26T19:01:05.962Z', true, false, '''0.485'':903 ''140cm'':1019 ''1900633579'':1328 ''2.0'':365,479 ''2.4'':497 ''2000mah'':1042,1061 ''31'':913 ''4070'':7 ''42'':1073 ''5i'':4 ''75'':227 ''84'':346 ''8x15.4x1.65cm'':914 ''android'':1191 ''anh'':377 ''b'':17,29,67,76,79,164,183,340,404,453,511,587,768,890,955,1069,1080,1320 ''balo'':929 ''biến'':718 ''biệt'':246,429,1163 ''bluetooth'':988,1038 ''bạn'':11,153,206,296,544,597,867,1084,1202,1244,1259,1308 ''bảo'':192 ''bất'':358,937 ''bằng'':122 ''bền'':273,458,696,708,741 ''bỉ'':274,459,697 ''bị'':743,945,1051 ''bỏ'':229 ''bởi'':102,948,1227 ''c'':26,27,56,117,118,134,137,138,142,151,152,180,181,189,204,205,207,234,235,244,252,281,294,295,319,366,449,482,488,489,493,528,570,595,596,598,608,620,635,680,706,713,720,723,730,731,816,865,866,868,897,905,919,952,953,961,1000,1007,1043,1056,1082,1083,1086,1149,1179,1180,1213,1257,1258,1306,1307,1309 ''cao'':116,212,369,447,643,664,694,1147 ''carbon'':266,678 ''ch'':14,45,135,412,547,578,601,838,879,908,933,1155,1170 ''chiếc'':339 ''cho'':193,203,218,776,810,1137,1243,1326 ''chung'':277 ''chuy'':325,398 ''chuyển'':211,846,876,976 ''chất'':367,444 ''chắc'':271,456,716 ''chắn'':272,457 ''chế'':145,804,963,1046,1059 ''chết'':522 ''chỉ'':226,345,496,591,612,668,792,902,1060 ''chọn'':49,1295 ''chỗ'':312 ''chờ'':1104 ''chức'':238 ''chữ'':308,1273 ''click'':1311 ''con'':307,1272 ''content'':297,1260 ''creator'':298,1261 ''cũng'':131,371,480,801,820,1118,1238 ''cơ'':33,187,196,408,959 ''cả'':1004,1193 ''cảm'':279,711,1287 ''cấp'':370,448,644,665,695 ''cần'':564,1206 ''cầu'':209,870 ''cận'':173 ''cắt'':350 ''cụ'':887,1333 ''của'':249,284,393,424,475,702,788,1221 ''cứ'':938 ''cực'':507,709,739,992 ''d'':100,110,162,415,558,753,772,777,812,922,986,1008,1012,1014,1093,1228 ''di'':210,845,875,975,1145 ''do'':147,534,782,1195 ''dye'':641,692,728 ''dye-subbed'':640,691,727 ''dưới'':81 ''dạng'':719 ''dễ'':171,921 ''dụng'':16,242,391,749,828,1067,1076,1097,1215 ''edge'':39,84,94,220,288,389,654,978,1048,1167,1291 ''em'':103,536,856,917,998,1123,1199,1236 ''fiber'':267 ''flow'':379 ''g'':356 ''gaming'':5 ''gi'':712,1114 ''gian'':633,752 ''giảm'':351 ''giữa'':136 ''gọi'':1325 ''gọn'':224,927 ''h'':54,124,213,469,520,1134,1159,1183,1232,1317 ''hai'':962 ''hay'':567,1224 ''hiểu'':62,607 ''hiện'':494,1185 ''hiệu'':397 ''ho'':50,257,419,437,1296 ''hot'':532 ''hotline'':1327 ''hoặc'':1029,1324 ''hơn'':146,177,225,460,485,541,583,825,863,972 ''hưởng'':947 ''hạn'':144,803,1045,1058 ''hảo'':52,1298 ''hầu'':1177 ''hết'':1027,1178 ''hệ'':1157,1181,1230 ''hỗ'':503,618,822,980,1002,1175,1240 ''hợp'':202,262,291,540,593,676,862,1024,1120 ''hứng'':1288 ''hữu'':1169 ''i'':77,454,754,852,931,996,1013,1280 ''in'':690,726 ''ios'':1190 ''k'':97,732,837,878,907 ''kailh'':363,394,477 ''keycap'':638,686,701 ''kg'':904 ''kh'':96,188,243,361,492,526,562,629,666,717,742,900,942,960,984,1119,1204,1225 ''kha'':360 ''khi'':747,826,844,1122,1197 ''khoảng'':133,1072 ''khoảnh'':647 ''khung'':248,671 ''khả'':450,501,1143,1151,1173 ''khắc'':648 ''kim'':263,677 ''kiểu'':109,161 ''kiện'':403,833 ''kế'':42,87,92,107,217 ''kết'':965,982,1005,1036,1091,1253 ''kỳ'':740,993 ''l'':47,155,255,303,313,327,435,557,661,673,765,793,815,817,912,1016,1121,1172,1229,1249,1268,1293 ''laptop'':21,168 ''layout'':222 ''led'':757,787,794 ''legion'':2 ''lenovo'':1 ''li'':330,1077 ''linh'':402 ''linux'':1194 ''liền'':554 ''liệu'':336,368,445 ''lo'':1208 ''lofree'':38,83,93,219,287,378,388,653,894,977,1047,1166,1290 ''low'':43,88,112,175 ''loại'':28,490,549 ''lu'':1265 ''lube'':566 ''lược'':228 ''lượng'':884,899,950,1065 ''lượt'':911 ''lại'':269,500,576,1063,1081,1254 ''lần'':910 ''lập'':657,1089 ''lắng'':1209 ''lợi'':761,843,968,971 ''lựa'':48,1294 ''m'':20,32,58,61,64,70,120,129,140,167,186,237,251,256,285,304,314,328,343,407,436,474,506,514,551,552,573,590,602,604,606,615,624,674,679,704,737,771,790,809,818,830,848,858,893,941,958,1026,1099,1110,1125,1165,1212,1219,1222,1250,1263,1269,1283,1285,1315 ''macos'':1189 ''magie'':264 ''mang'':268,499,935,1062 ''mm'':498 ''mod'':568,586,627 ''mua'':555,613,1198,1301 ''mảng'':334 ''mẫu'':66,430,510,767,889,954 ''mắt'':384 ''mỉ'':423 ''mỏng'':199,840,881,1140 ''một'':221,338,395,766,1052 ''n'':18,30,51,68,71,80,98,104,165,184,253,258,260,276,283,301,318,320,326,331,341,347,376,399,405,420,432,438,440,512,515,521,524,537,572,581,588,609,650,662,681,721,735,756,769,778,786,799,807,851,855,859,873,891,895,918,956,999,1001,1017,1040,1054,1078,1116,1126,1133,1200,1218,1234,1237,1266,1277,1297,1321,1323 ''nay'':495,1186 ''ng'':35,57,74,101,111,163,214,416,467,527,559,563,621,636,667,724,775,781,813,836,906,923,943,985,1021,1135,1205,1226,1318 ''ngang'':121 ''ngay'':561,645,656,1088,1319 ''nghệ'':725 ''ngo'':995,1279 ''nguồn'':1286 ''người'':99,324,611,811 ''ngắn'':130,484 ''ngừa'':1022 ''nh'':46,59,82,125,127,195,275,282,286,470,472,530,571,574,625,649,773,849,925,1035,1070,1103,1111,1113,1139,1160,1171,1184,1223,1233,1248,1264,1335 ''nhanh'':508 ''nhau'':123 ''nhiều'':462,631 ''nhu'':208,869 ''như'':132,374,579,623,821,847,951,1187,1262 ''nhất'':292,1148,1164 ''nhận'':280 ''nhẹ'':200,841,882,901,1141 ''nhờ'':417,669,682,877,915 ''những'':10,323,543 ''nhựa'':442,446,465,687,699 ''numpad'':232,354 ''năng'':239,451,502,531,1144,1152,1174 ''nối'':966,983,1006,1037,1092 ''o'':652,684,1235,1313 ''pbt'':639,688,700 ''pcb'':525 ''ph'':19,31,69,119,128,139,166,185,201,236,250,290,342,406,473,505,513,539,550,589,592,614,703,736,770,780,789,806,829,857,892,957,1020,1025,1098,1124,1211,1314 ''phai'':744 ''phải'':302,309,565,874,886,1207,1267,1274 ''phần'':143,231,247,353,483,670,685,784,1044,1057 ''phẩm'':427,1303 ''pin'':1028,1041,1055,1106 ''pom'':364,443,478 ''pro'':3 ''profile'':44,89,113,176,182 ''qu'':944,1033,1101,1246 ''qua'':75 ''quan'':332 ''quen'':158 ''ra'':383,997,1278 ''ri'':774 ''rtx'':6 ''rất'':461 ''rắn'':715 ''rằng'':1210 ''s'':835 ''sau'':746 ''so'':178,463,486 ''subbed'':642,693,729 ''swap'':533 ''switch'':362,392,431,476,491,517 ''sạc'':1108 ''sản'':400,426,1302 ''sắc'':759,796 ''sẽ'':95,141,170,289,355,481,518,538,628,705,738,791,802,861,979,1203,1239,1292 ''số'':335 ''sờ'':714 ''sở'':599,1168 ''sức'':637 ''sử'':15,241,390,748,827,1066,1075,1096,1214 ''sự'':270,805 ''t'':60,194,240,348,529,605,660,808,926,930,1138,1154,1282 ''th'':13,34,37,63,73,169,337,411,466,546,575,577,600,626,1284,1289 ''thay'':24,310 ''theo'':278 ''thinkpro'':1305 ''thiết'':41,86,91,106,216 ''thiếu'':834 ''thiện'':421 ''thuộc'':85,159 ''thương'':396 ''thước'':839,880,909 ''thường'':36,299,316,468,871,1275 ''thấp'':994 ''thế'':580 ''thể'':548,888,920,1087,1150,1310,1334 ''thống'':23 ''thời'':632,751,1064 ''ti'':1132 ''tin'':414 ''tinh'':223 ''tiếng'':1074 ''tiếp'':172 ''tiện'':359,760,842,967,970 ''to'':259,439,659 ''tr'':126,471,523,734,854,1034,1102,1217,1247,1322 ''trang'':1050 ''trong'':750,814,831,928,973,1032,1071,1100,1245 ''trung'':1068 ''truyền'':22 ''trơn'':455 ''trước'':385,569 ''trường'':1023 ''trắng'':797 ''trặc'':1031 ''trễ'':991 ''trọng'':883,898,949 ''trợ'':504,619,823,981,1003,1176,1241 ''trục'':1030 ''tư'':1331 ''tương'':372,1153 ''tại'':1304 ''tỉ'':422 ''tốn'':630 ''tốt'':710,824,1242 ''tổng'':1252 ''tục'':1079 ''tức'':658,1090 ''từ'':154,261,441,646,675 ''từng'':381,425 ''tự'':373,452,733 ''u'':156,940 ''v'':25,233,265,349,413,584,634,651,683,762,934,1095,1142,1192,1312 ''vi'':1039,1053 ''viết'':78 ''việc'':305,315,329,585,622,819,974,1251,1270 ''văn'':779 ''vấn'':1332 ''vẫn'':1085 ''vẻ'':663 ''về'':65,90,556,616,1201 ''với'':9,40,108,114,150,160,174,179,293,306,322,344,464,487,542,594,610,698,722,864,989,1010,1256,1271 ''vừa'':885 ''windows'':1188 ''x'':932 ''xuy'':300,317,872,1276 ''xuất'':401 ''y'':55,72,357,387,433,516,582,603,764,800,860,896,987,1009,1015,1094,1117,1127,1220 ''ăn'':553 ''đ'':148,157,215,375,380,386,535,655,755,763,783,785,850,916,939,1112,1196 ''đa'':1156 ''đang'':1128 ''đi'':230,352,745,936 ''điều'':798,832,1115,1158,1182,1231 ''điểm'':1161 ''đơn'':758,795 ''được'':105,254,382,409,434,519,560,672,689,924,1049,1107,1216,1330 ''đảm'':191 ''đấy'':53 ''đầu'':1136 ''đầy'':1109 ''đặc'':245,428,1162 ''đặt'':1129,1300,1316 ''đến'':333,1018 ''để'':190,617,969,1281,1299,1329 ''đối'':8,149,321,1255 ''đổi'':311 ''độ'':115,198,418,707,964,990,1011,1130 ''động'':197,1146 ''đợi'':1105 ''ưa'':12,410,545 ''ưu'':1131 ''ảnh'':946 ''ở'':509,853'),
  (161, 'OnePlus 12 16GB 512GB Flowy Emerald', 17, 6, '<p>Đối với những bạn ưa th&iacute;ch sử dụng b&agrave;n ph&iacute;m&nbsp;<a href="https://thinkpro.vn/laptop" target="" rel="">laptop</a>&nbsp;truyền thống thay v&igrave; c&aacute;c loại b&agrave;n ph&iacute;m cơ th&ocirc;ng thường th&igrave;&nbsp;<a href="https://thinkpro.vn/ban-phim/ban-phim-co-lofree-egde-ultra-low-proflie" target="" rel="">Lofree EDGE</a>&nbsp;với thiết kế Low Profile ch&iacute;nh l&agrave; lựa chọn ho&agrave;n hảo đấy. H&atilde;y c&ugrave;ng m&igrave;nh t&igrave;m hiểu th&ecirc;m về mẫu&nbsp;<a href="https://thinkpro.vn/ban-phim" target="" rel="">b&agrave;n ph&iacute;m</a>&nbsp;n&agrave;y th&ocirc;ng qua b&agrave;i viết b&ecirc;n dưới nh&eacute;.</p>
<h3 id="cCGu8" data-toc-id="cCGu8">Lofree EDGE thuộc thiết kế low profile</h3>
<p>Về thiết kế, Lofree EDGE sẽ kh&aacute; k&eacute;n người d&ugrave;ng bởi em n&oacute; được thiết kế với kiểu d&aacute;ng low profile với độ cao c&aacute;c ph&iacute;m ngang bằng nhau, h&agrave;nh tr&igrave;nh ph&iacute;m ngắn cũng như khoảng c&aacute;ch giữa c&aacute;c ph&iacute;m sẽ c&oacute; phần hạn chế hơn. Do đ&oacute;, đối với c&aacute;c bạn từ l&acirc;u đ&atilde; quen thuộc với kiểu d&aacute;ng b&agrave;n ph&iacute;m laptop th&igrave; sẽ dễ tiếp cận với low profile hơn so với c&aacute;c profile b&agrave;n ph&iacute;m cơ kh&aacute;c.</p>
<div data-type="imageBlock"><img src="https://d28jzcg6y4v9j1.cloudfront.net/ban_phim_co_lofree_egde_1720293446238.jpg" alt="Lofree EDGE" loading="lazy" data-width="100%" data-align="center"></div>
<p>Để đảm bảo cho t&iacute;nh cơ động, độ mỏng nhẹ ph&ugrave; hợp cho c&aacute;c bạn c&oacute; nhu cầu di chuyển cao, h&atilde;ng đ&atilde; thiết kế cho Lofree EDGE một layout tinh gọn hơn, chỉ&nbsp;<strong>75%</strong>, lược bỏ đi phần numpad v&agrave; c&aacute;c ph&iacute;m chức năng &iacute;t sử dụng kh&aacute;c. Đặc biệt, phần khung của ph&iacute;m c&ograve;n được l&agrave;m ho&agrave;n to&agrave;n từ hợp kim magie v&agrave; carbon fiber, mang lại sự chắc chắn, bền bỉ.</p>
<div data-type="imageBlock"><img src="https://d28jzcg6y4v9j1.cloudfront.net/cac_phim_1720293446336.jpg" alt="B&agrave;n ph&iacute;m với chỉ 84 N&uacute;t" loading="lazy" data-width="100%" data-align="center"></div>
<p>Nh&igrave;n chung, theo cảm nhận c&aacute; nh&acirc;n của m&igrave;nh Lofree EDGE sẽ ph&ugrave; hợp nhất với c&aacute;c bạn content creator thường xuy&ecirc;n phải l&agrave;m việc với con chữ, phải thay đổi chỗ l&agrave;m việc thường xuy&ecirc;n. C&ograve;n đối với những người chuy&ecirc;n l&agrave;m việc li&ecirc;n quan đến mảng số liệu th&igrave; một chiếc b&agrave;n ph&iacute;m với chỉ&nbsp;<strong>84 N&uacute;t</strong>&nbsp;v&agrave; cắt giảm đi phần numpad sẽ g&acirc;y bất tiện kha kh&aacute;.</p>
<h3 id="tsdxY" data-toc-id="tsdxY">Switch Kailh POM 2.0 c&oacute; chất liệu cao cấp</h3>
<p>Cũng tương tự như đ&agrave;n anh&nbsp;<a href="https://thinkpro.vn/ban-phim/ban-phim-co-lofree-flow" target="" rel="">Lofree Flow</a>&nbsp;đ&atilde; từng được ra mắt trước đ&acirc;y, Lofree EDGE sử dụng switch của&nbsp;<strong>Kailh</strong>, một thương hiệu chuy&ecirc;n sản xuất linh kiện b&agrave;n ph&iacute;m cơ được ưa th&iacute;ch v&agrave; tin d&ugrave;ng nhờ độ ho&agrave;n thiện tỉ mỉ của từng sản phẩm.</p>
<p>Đặc biệt, mẫu switch n&agrave;y được l&agrave;m ho&agrave;n to&agrave;n từ nhựa POM, chất liệu nhựa cao cấp c&oacute; khả năng tự b&ocirc;i trơn, chắc chắn, bền bỉ hơn rất nhiều so với nhựa th&ocirc;ng thường. H&agrave;nh tr&igrave;nh ph&iacute;m của Switch Kailh POM 2.0 cũng sẽ c&oacute; phần ngắn hơn so với c&aacute;c loại switch kh&aacute;c hiện nay, chỉ&nbsp;<strong>2.4mm</strong>&nbsp;mang lại khả năng hỗ trợ ph&iacute;m cực nhanh.</p>
<div data-type="imageBlock"><img src="https://d28jzcg6y4v9j1.cloudfront.net/switch_1720293454915.jpg" alt="Switch Kailh POM 2.0" loading="lazy" data-width="100%" data-align="center"></div>
<p>Ở mẫu b&agrave;n ph&iacute;m n&agrave;y, switch sẽ được h&agrave;n chết tr&ecirc;n&nbsp;<strong>PCB</strong>, kh&ocirc;ng c&oacute; t&iacute;nh năng Hot swap, do đ&oacute;, em n&oacute; sẽ ph&ugrave; hợp hơn với những bạn ưa th&iacute;ch thể loại ph&iacute;m &ldquo;m&igrave; ăn liền&rdquo;, mua về l&agrave; d&ugrave;ng được ngay, kh&ocirc;ng cần phải lube hay mod trước. C&aacute; nh&acirc;n m&igrave;nh th&igrave; lại th&iacute;ch như thế n&agrave;y hơn v&igrave; việc mod b&agrave;n ph&iacute;m chỉ ph&ugrave; hợp với c&aacute;c bạn c&oacute; sở th&iacute;ch m&agrave;y m&ograve;, t&igrave;m hiểu, c&ograve;n với người chỉ mua ph&iacute;m về để hỗ trợ c&ocirc;ng việc như m&igrave;nh th&igrave; mod sẽ kh&aacute; tốn nhiều thời gian v&agrave; c&ocirc;ng sức.</p>
<h3 id="k6ttd" data-toc-id="k6ttd">Keycap PBT Dye-Subbed cao cấp</h3>
<p>Ngay từ khoảnh khắc nh&igrave;n v&agrave;o, Lofree EDGE đ&atilde; ngay lập tức to&aacute;t l&ecirc;n vẻ cao cấp kh&ocirc;ng chỉ nhờ phần khung được l&agrave;m từ hợp kim carbon m&agrave; c&ograve;n nhờ v&agrave;o phần keycap nhựa PBT được in Dye-Subbed cao cấp, bền bỉ.</p>
<div data-type="imageBlock"><img src="https://d28jzcg6y4v9j1.cloudfront.net/key_cap_1720293450122_1720756592482.jpg" alt="Keycap PBT Dye-Subbed" loading="lazy" data-width="100%" data-align="center"></div>
<p>Với nhựa&nbsp;<strong>PBT</strong>, keycap của ph&iacute;m sẽ c&oacute; độ bền cực tốt, cảm gi&aacute;c sờ rắn chắc, kh&oacute; biến dạng. C&ograve;n với c&ocirc;ng nghệ in&nbsp;<strong>Dye-Subbed</strong>, c&aacute;c k&yacute; tự tr&ecirc;n ph&iacute;m sẽ cực kỳ bền, kh&oacute; bị phai đi sau khi sử dụng trong thời gian d&agrave;i</p>
<h3 id="m4gss" data-toc-id="m4gss">Đ&egrave;n LED đơn sắc tiện lợi</h3>
<p>V&igrave; đ&acirc;y l&agrave; một mẫu b&agrave;n ph&iacute;m d&agrave;nh ri&ecirc;ng cho d&acirc;n văn ph&ograve;ng, do đ&oacute;, phần đ&egrave;n LED của ph&iacute;m sẽ chỉ l&agrave; LED đơn sắc trắng. Điều n&agrave;y cũng sẽ hạn chế sự ph&acirc;n t&acirc;m cho người d&ugrave;ng trong l&uacute;c l&agrave;m việc cũng như hỗ trợ tốt hơn khi sử dụng ph&iacute;m trong điều kiện thiếu s&aacute;ng.</p>
<div data-type="imageBlock"><img src="https://d28jzcg6y4v9j1.cloudfront.net/led_don_sac_1720293452862_1720756594953.jpg" alt="Đ&egrave;n LED đơn sắc" loading="lazy" data-width="100%" data-align="center"></div>
<h3 id="ihaFK" data-toc-id="ihaFK">K&iacute;ch thước mỏng nhẹ, tiện lợi khi di chuyển</h3>
<p>Như m&igrave;nh đ&atilde; n&oacute;i ở tr&ecirc;n, em ph&iacute;m n&agrave;y sẽ hợp hơn với c&aacute;c bạn c&oacute; nhu cầu thường xuy&ecirc;n phải di chuyển nhờ k&iacute;ch thước mỏng nhẹ, trọng lượng vừa phải. Cụ thể, mẫu&nbsp;<a href="https://thinkpro.vn/ban-phim-lofree" target="" rel="">b&agrave;n ph&iacute;m Lofree</a>&nbsp;n&agrave;y c&oacute; trọng lượng kh&aacute; nhẹ chỉ&nbsp;<strong>0.485kg</strong>&nbsp;c&ugrave;ng k&iacute;ch thước lần lượt l&agrave;&nbsp;<strong>31,8x15.4x1.65cm</strong>. Nhờ đ&oacute;, em n&oacute; c&oacute; thể dễ d&agrave;ng được nh&eacute;t gọn trong balo, t&uacute;i x&aacute;ch v&agrave; mang đi bất cứ đ&acirc;u m&agrave; kh&ocirc;ng qu&aacute; bị ảnh hưởng bởi trọng lượng như c&aacute;c mẫu b&agrave;n ph&iacute;m cơ kh&aacute;c.</p>
<div data-type="imageBlock"><img src="https://d28jzcg6y4v9j1.cloudfront.net/kich_thuoc_1720293771972.jpg" alt="K&iacute;ch thước mỏng nhẹ" loading="lazy" data-width="100%" data-align="center"></div>
<h3 id="zJrHz" data-toc-id="zJrHz">Hai chế độ kết nối tiện lợi</h3>
<p>Để tiện lợi hơn trong việc di chuyển, Lofree EDGE sẽ hỗ trợ kết nối kh&ocirc;ng d&acirc;y bluetooth với độ trễ cực kỳ thấp. Ngo&agrave;i ra, em n&oacute; c&ograve;n hỗ trợ cả kết nối c&oacute; d&acirc;y, với độ d&agrave;i d&acirc;y l&ecirc;n đến&nbsp;<strong>140cm</strong>&nbsp;ph&ograve;ng ngừa trường hợp ph&iacute;m hết pin hoặc trục trặc trong qu&aacute; tr&igrave;nh kết nối bluetooth.</p>
<div data-type="imageBlock"><img src="https://d28jzcg6y4v9j1.cloudfront.net/mode_ket_noi_1720293976532.jpg" alt="Hai mode kết nối tiện lợi" loading="lazy" data-width="100%" data-align="center"></div>
<h3 id="aB9Ww" data-toc-id="aB9Ww">Vi&ecirc;n pin 2000mAh c&oacute; phần hạn chế</h3>
<p>Lofree EDGE được trang bị một vi&ecirc;n pin c&oacute; phần hạn chế chỉ&nbsp;<strong>2000mAh</strong>&nbsp;mang lại thời lượng sử dụng trung b&igrave;nh trong khoảng&nbsp;<strong>42 tiếng</strong>&nbsp;sử dụng li&ecirc;n tục. B&ugrave; lại, c&aacute;c bạn vẫn c&oacute; thể ngay lập tức kết nối d&acirc;y v&agrave; sử dụng ph&iacute;m trong qu&aacute; tr&igrave;nh chờ đợi pin được sạc đầy. M&igrave;nh đ&aacute;nh gi&aacute; điều n&agrave;y cũng kh&aacute; hợp l&yacute; khi em ph&iacute;m n&agrave;y đang đặt độ ưu ti&ecirc;n h&agrave;ng đầu cho t&iacute;nh mỏng nhẹ v&agrave; khả năng di động cao nhất c&oacute; thể.</p>
<h3 id="6bbl1" data-toc-id="6bbl1">Khả năng tương t&iacute;ch đa hệ điều h&agrave;nh</h3>
<p>Điểm đặc biệt nhất m&agrave; Lofree EDGE sở hữu ch&iacute;nh l&agrave; khả năng hỗ trợ hầu hết c&aacute;c hệ điều h&agrave;nh hiện nay như&nbsp;<strong>Windows</strong>,<strong>&nbsp;MacOS</strong>,&nbsp;<strong>IOS</strong>,&nbsp;<strong>Android</strong>&nbsp;v&agrave; cả&nbsp;<strong>Linux</strong>. Do đ&oacute;, khi mua em n&oacute; về, bạn sẽ kh&ocirc;ng cần phải lo lắng rằng ph&iacute;m c&oacute; sử dụng được tr&ecirc;n m&aacute;y của m&igrave;nh hay kh&ocirc;ng bởi, d&ugrave; l&agrave; hệ điều h&agrave;nh n&agrave;o, em n&oacute; cũng sẽ hỗ trợ tốt cho bạn trong qu&aacute; tr&igrave;nh l&agrave;m việc.</p>
<div data-type="imageBlock"><img src="https://d28jzcg6y4v9j1.cloudfront.net/ket_noi_1720293449840.jpg" alt="Tương t&iacute;ch đa hệ điều h&agrave;nh" loading="lazy" data-width="100%" data-align="center"></div>
<p>Tổng kết lại, đối với c&aacute;c bạn Content Creator như m&igrave;nh, lu&ocirc;n phải l&agrave;m việc với con chữ, phải thường xuy&ecirc;n ra ngo&agrave;i để t&igrave;m th&ecirc;m nguồn cảm hứng th&igrave; Lofree EDGE sẽ l&agrave; lựa chọn ho&agrave;n hảo. Để đặt mua sản phẩm tại&nbsp;<a href="https://thinkpro.vn/" target="" rel="">ThinkPro</a>, c&aacute;c bạn c&oacute; thể click v&agrave;o ph&iacute;m &ldquo;<strong>Đặt h&agrave;ng</strong>&rdquo; ngay b&ecirc;n tr&ecirc;n hoặc gọi cho Hotline&nbsp;<a href="tel:1900633579" target="" rel="nofollow noopener noreferrer"><strong>1900633579</strong></a> để được tư vấn cụ thể nh&eacute;.</p>', '0', '100000', '3333330', '200000', '2025-12-31T19:31:00.000Z', 2, 19, '2025-12-26T19:19:13.727Z', true, true, '''0.485'':902 ''12'':2 ''140cm'':1018 ''16gb'':3 ''1900633579'':1327 ''2.0'':364,478 ''2.4'':496 ''2000mah'':1041,1060 ''31'':912 ''42'':1072 ''512gb'':4 ''75'':226 ''84'':345 ''8x15.4x1.65cm'':913 ''android'':1190 ''anh'':376 ''b'':16,28,66,75,78,163,182,339,403,452,510,586,767,889,954,1068,1079,1319 ''balo'':928 ''biến'':717 ''biệt'':245,428,1162 ''bluetooth'':987,1037 ''bạn'':10,152,205,295,543,596,866,1083,1201,1243,1258,1307 ''bảo'':191 ''bất'':357,936 ''bằng'':121 ''bền'':272,457,695,707,740 ''bỉ'':273,458,696 ''bị'':742,944,1050 ''bỏ'':228 ''bởi'':101,947,1226 ''c'':25,26,55,116,117,133,136,137,141,150,151,179,180,188,203,204,206,233,234,243,251,280,293,294,318,365,448,481,487,488,492,527,569,594,595,597,607,619,634,679,705,712,719,722,729,730,815,864,865,867,896,904,918,951,952,960,999,1006,1042,1055,1081,1082,1085,1148,1178,1179,1212,1256,1257,1305,1306,1308 ''cao'':115,211,368,446,642,663,693,1146 ''carbon'':265,677 ''ch'':13,44,134,411,546,577,600,837,878,907,932,1154,1169 ''chiếc'':338 ''cho'':192,202,217,775,809,1136,1242,1325 ''chung'':276 ''chuy'':324,397 ''chuyển'':210,845,875,975 ''chất'':366,443 ''chắc'':270,455,715 ''chắn'':271,456 ''chế'':144,803,962,1045,1058 ''chết'':521 ''chỉ'':225,344,495,590,611,667,791,901,1059 ''chọn'':48,1294 ''chỗ'':311 ''chờ'':1103 ''chức'':237 ''chữ'':307,1272 ''click'':1310 ''con'':306,1271 ''content'':296,1259 ''creator'':297,1260 ''cũng'':130,370,479,800,819,1117,1237 ''cơ'':32,186,195,407,958 ''cả'':1003,1192 ''cảm'':278,710,1286 ''cấp'':369,447,643,664,694 ''cần'':563,1205 ''cầu'':208,869 ''cận'':172 ''cắt'':349 ''cụ'':886,1332 ''của'':248,283,392,423,474,701,787,1220 ''cứ'':937 ''cực'':506,708,738,991 ''d'':99,109,161,414,557,752,771,776,811,921,985,1007,1011,1013,1092,1227 ''di'':209,844,874,974,1144 ''do'':146,533,781,1194 ''dye'':640,691,727 ''dye-subbed'':639,690,726 ''dưới'':80 ''dạng'':718 ''dễ'':170,920 ''dụng'':15,241,390,748,827,1066,1075,1096,1214 ''edge'':38,83,93,219,287,388,653,977,1047,1166,1290 ''em'':102,535,855,916,997,1122,1198,1235 ''emerald'':6 ''fiber'':266 ''flow'':378 ''flowy'':5 ''g'':355 ''gi'':711,1113 ''gian'':632,751 ''giảm'':350 ''giữa'':135 ''gọi'':1324 ''gọn'':223,926 ''h'':53,123,212,468,519,1133,1158,1182,1231,1316 ''hai'':961 ''hay'':566,1223 ''hiểu'':61,606 ''hiện'':493,1184 ''hiệu'':396 ''ho'':49,256,418,436,1295 ''hot'':531 ''hotline'':1326 ''hoặc'':1028,1323 ''hơn'':145,176,224,459,484,540,582,824,862,971 ''hưởng'':946 ''hạn'':143,802,1044,1057 ''hảo'':51,1297 ''hầu'':1176 ''hết'':1026,1177 ''hệ'':1156,1180,1229 ''hỗ'':502,617,821,979,1001,1174,1239 ''hợp'':201,261,290,539,592,675,861,1023,1119 ''hứng'':1287 ''hữu'':1168 ''i'':76,453,753,851,930,995,1012,1279 ''in'':689,725 ''ios'':1189 ''k'':96,731,836,877,906 ''kailh'':362,393,476 ''keycap'':637,685,700 ''kg'':903 ''kh'':95,187,242,360,491,525,561,628,665,716,741,899,941,959,983,1118,1203,1224 ''kha'':359 ''khi'':746,825,843,1121,1196 ''khoảng'':132,1071 ''khoảnh'':646 ''khung'':247,670 ''khả'':449,500,1142,1150,1172 ''khắc'':647 ''kim'':262,676 ''kiểu'':108,160 ''kiện'':402,832 ''kế'':41,86,91,106,216 ''kết'':964,981,1004,1035,1090,1252 ''kỳ'':739,992 ''l'':46,154,254,302,312,326,434,556,660,672,764,792,814,816,911,1015,1120,1171,1228,1248,1267,1292 ''laptop'':20,167 ''layout'':221 ''led'':756,786,793 ''li'':329,1076 ''linh'':401 ''linux'':1193 ''liền'':553 ''liệu'':335,367,444 ''lo'':1207 ''lofree'':37,82,92,218,286,377,387,652,893,976,1046,1165,1289 ''low'':42,87,111,174 ''loại'':27,489,548 ''lu'':1264 ''lube'':565 ''lược'':227 ''lượng'':883,898,949,1064 ''lượt'':910 ''lại'':268,499,575,1062,1080,1253 ''lần'':909 ''lập'':656,1088 ''lắng'':1208 ''lợi'':760,842,967,970 ''lựa'':47,1293 ''m'':19,31,57,60,63,69,119,128,139,166,185,236,250,255,284,303,313,327,342,406,435,473,505,513,550,551,572,589,601,603,605,614,623,673,678,703,736,770,789,808,817,829,847,857,892,940,957,1025,1098,1109,1124,1164,1211,1218,1221,1249,1262,1268,1282,1284,1314 ''macos'':1188 ''magie'':263 ''mang'':267,498,934,1061 ''mm'':497 ''mod'':567,585,626 ''mua'':554,612,1197,1300 ''mảng'':333 ''mẫu'':65,429,509,766,888,953 ''mắt'':383 ''mỉ'':422 ''mỏng'':198,839,880,1139 ''một'':220,337,394,765,1051 ''n'':17,29,50,67,70,79,97,103,164,183,252,257,259,275,282,300,317,319,325,330,340,346,375,398,404,419,431,437,439,511,514,520,523,536,571,580,587,608,649,661,680,720,734,755,768,777,785,798,806,850,854,858,872,890,894,917,955,998,1000,1016,1039,1053,1077,1115,1125,1132,1199,1217,1233,1236,1265,1276,1296,1320,1322 ''nay'':494,1185 ''ng'':34,56,73,100,110,162,213,415,466,526,558,562,620,635,666,723,774,780,812,835,905,922,942,984,1020,1134,1204,1225,1317 ''ngang'':120 ''ngay'':560,644,655,1087,1318 ''nghệ'':724 ''ngo'':994,1278 ''nguồn'':1285 ''người'':98,323,610,810 ''ngắn'':129,483 ''ngừa'':1021 ''nh'':45,58,81,124,126,194,274,281,285,469,471,529,570,573,624,648,772,848,924,1034,1069,1102,1110,1112,1138,1159,1170,1183,1222,1232,1247,1263,1334 ''nhanh'':507 ''nhau'':122 ''nhiều'':461,630 ''nhu'':207,868 ''như'':131,373,578,622,820,846,950,1186,1261 ''nhất'':291,1147,1163 ''nhận'':279 ''nhẹ'':199,840,881,900,1140 ''nhờ'':416,668,681,876,914 ''những'':9,322,542 ''nhựa'':441,445,464,686,698 ''numpad'':231,353 ''năng'':238,450,501,530,1143,1151,1173 ''nối'':965,982,1005,1036,1091 ''o'':651,683,1234,1312 ''oneplus'':1 ''pbt'':638,687,699 ''pcb'':524 ''ph'':18,30,68,118,127,138,165,184,200,235,249,289,341,405,472,504,512,538,549,588,591,613,702,735,769,779,788,805,828,856,891,956,1019,1024,1097,1123,1210,1313 ''phai'':743 ''phải'':301,308,564,873,885,1206,1266,1273 ''phần'':142,230,246,352,482,669,684,783,1043,1056 ''phẩm'':426,1302 ''pin'':1027,1040,1054,1105 ''pom'':363,442,477 ''profile'':43,88,112,175,181 ''qu'':943,1032,1100,1245 ''qua'':74 ''quan'':331 ''quen'':157 ''ra'':382,996,1277 ''ri'':773 ''rất'':460 ''rắn'':714 ''rằng'':1209 ''s'':834 ''sau'':745 ''so'':177,462,485 ''subbed'':641,692,728 ''swap'':532 ''switch'':361,391,430,475,490,516 ''sạc'':1107 ''sản'':399,425,1301 ''sắc'':758,795 ''sẽ'':94,140,169,288,354,480,517,537,627,704,737,790,801,860,978,1202,1238,1291 ''số'':334 ''sờ'':713 ''sở'':598,1167 ''sức'':636 ''sử'':14,240,389,747,826,1065,1074,1095,1213 ''sự'':269,804 ''t'':59,193,239,347,528,604,659,807,925,929,1137,1153,1281 ''th'':12,33,36,62,72,168,336,410,465,545,574,576,599,625,1283,1288 ''thay'':23,309 ''theo'':277 ''thinkpro'':1304 ''thiết'':40,85,90,105,215 ''thiếu'':833 ''thiện'':420 ''thuộc'':84,158 ''thương'':395 ''thước'':838,879,908 ''thường'':35,298,315,467,870,1274 ''thấp'':993 ''thế'':579 ''thể'':547,887,919,1086,1149,1309,1333 ''thống'':22 ''thời'':631,750,1063 ''ti'':1131 ''tin'':413 ''tinh'':222 ''tiếng'':1073 ''tiếp'':171 ''tiện'':358,759,841,966,969 ''to'':258,438,658 ''tr'':125,470,522,733,853,1033,1101,1216,1246,1321 ''trang'':1049 ''trong'':749,813,830,927,972,1031,1070,1099,1244 ''trung'':1067 ''truyền'':21 ''trơn'':454 ''trước'':384,568 ''trường'':1022 ''trắng'':796 ''trặc'':1030 ''trễ'':990 ''trọng'':882,897,948 ''trợ'':503,618,822,980,1002,1175,1240 ''trục'':1029 ''tư'':1330 ''tương'':371,1152 ''tại'':1303 ''tỉ'':421 ''tốn'':629 ''tốt'':709,823,1241 ''tổng'':1251 ''tục'':1078 ''tức'':657,1089 ''từ'':153,260,440,645,674 ''từng'':380,424 ''tự'':372,451,732 ''u'':155,939 ''v'':24,232,264,348,412,583,633,650,682,761,933,1094,1141,1191,1311 ''vi'':1038,1052 ''viết'':77 ''việc'':304,314,328,584,621,818,973,1250,1269 ''văn'':778 ''vấn'':1331 ''vẫn'':1084 ''vẻ'':662 ''về'':64,89,555,615,1200 ''với'':8,39,107,113,149,159,173,178,292,305,321,343,463,486,541,593,609,697,721,863,988,1009,1255,1270 ''vừa'':884 ''windows'':1187 ''x'':931 ''xuy'':299,316,871,1275 ''xuất'':400 ''y'':54,71,356,386,432,515,581,602,763,799,859,895,986,1008,1014,1093,1116,1126,1219 ''ăn'':552 ''đ'':147,156,214,374,379,385,534,654,754,762,782,784,849,915,938,1111,1195 ''đa'':1155 ''đang'':1127 ''đi'':229,351,744,935 ''điều'':797,831,1114,1157,1181,1230 ''điểm'':1160 ''đơn'':757,794 ''được'':104,253,381,408,433,518,559,671,688,923,1048,1106,1215,1329 ''đảm'':190 ''đấy'':52 ''đầu'':1135 ''đầy'':1108 ''đặc'':244,427,1161 ''đặt'':1128,1299,1315 ''đến'':332,1017 ''để'':189,616,968,1280,1298,1328 ''đối'':7,148,320,1254 ''đổi'':310 ''độ'':114,197,417,706,963,989,1010,1129 ''động'':196,1145 ''đợi'':1104 ''ưa'':11,409,544 ''ưu'':1130 ''ảnh'':945 ''ở'':508,852'),
  (162, 'The Brothers Karamazov - Fyodor Dostoevsky', 17, 32, '<p>&ldquo;This acclaimed new English version of Dostoevsky&rsquo;s magnificent last novel does justice to all its levels of artistry and intention: as murder mystery, black comedy, pioneering work of psychological realism, and enduring statement about freedom, sin, and suffering . . . [The translators] come as close to Dostoevsky&rsquo;s Russian as possible.&rdquo; --<em><strong>Joseph Frank, Princeton University</strong></em><br><br>&ldquo;It may well be that Dostoevsky&rsquo;s [world], with all its resourceful energies of life and language, is only now―and through the medium of this translation―beginning to come home to the English-speaking reader.&rdquo; --<em><strong>John Bayley, The New York Review of Books</strong></em><br><br>&ldquo;No reader who knows The Brothers Karamazov should ignore this magnificent translation. And no reader who doesn&rsquo;t should wait any longer to acquaint himself with one of the peaks of modern fiction.&rdquo; --<em><strong>USA Today</strong></em></p>
        <div style="margin-top: 20px; border-top: 1px dashed #ccc; padding-top: 10px;">
            <p>
                <span style="background-color: #fff3cd; padding: 5px 10px; border-radius: 5px; font-weight: bold;">
                    ✏️ Cập nhật ngày: 06:00:24 5/1/2026
                </span>
            </p>
        </div>
    <p>Bổ sung m&ocirc; tả sản phẩm&nbsp;</p>
        <div style="margin-top: 20px; border-top: 1px dashed #ccc; padding-top: 10px;">
            <p>
                <span style="background-color: #fff3cd; padding: 5px 10px; border-radius: 5px; font-weight: bold;">
                    ✏️ Cập nhật ngày: 06:01:17 5/1/2026
                </span>
            </p>
        </div>
    <p>lại tiếp tục bổ sung&nbsp;</p>', '0', '10000', '500000', '0', '2026-02-03T19:08:00.000Z', 1, NULL, '2025-12-31T19:10:00.973Z', true, true, '''00'':144 ''01'':157 ''06'':143,156 ''17'':158 ''24'':145 ''5/1/2026'':146,159 ''about'':40 ''acclaimed'':7 ''acquaint'':128 ''all'':20,69 ''and'':25,37,43,75,80,117 ''any'':125 ''artistry'':24 ''as'':27,48,54 ''bayley'':98 ''be'':63 ''beginning'':87 ''black'':30 ''books'':104 ''brothers'':2,110 ''bổ'':147,163 ''close'':49 ''come'':47,89 ''comedy'':31 ''cập'':140,153 ''does'':17 ''doesn'':121 ''dostoevsky'':5,12,51,65 ''enduring'':38 ''energies'':72 ''english'':9,94 ''english-speaking'':93 ''fiction'':137 ''frank'':57 ''freedom'':41 ''fyodor'':4 ''himself'':129 ''home'':90 ''ignore'':113 ''intention'':26 ''is'':77 ''it'':60 ''its'':21,70 ''john'':97 ''joseph'':56 ''justice'':18 ''karamazov'':3,111 ''knows'':108 ''language'':76 ''last'':15 ''levels'':22 ''life'':74 ''longer'':126 ''lại'':160 ''m'':149 ''magnificent'':14,115 ''may'':61 ''medium'':83 ''modern'':136 ''murder'':28 ''mystery'':29 ''new'':8,100 ''ngày'':142,155 ''nhật'':141,154 ''no'':105,118 ''novel'':16 ''now'':79 ''of'':11,23,34,73,84,103,132,135 ''one'':131 ''only'':78 ''peaks'':134 ''phẩm'':152 ''pioneering'':32 ''possible'':55 ''princeton'':58 ''psychological'':35 ''reader'':96,106,119 ''realism'':36 ''resourceful'':71 ''review'':102 ''russian'':53 ''s'':13,52,66 ''should'':112,123 ''sin'':42 ''speaking'':95 ''statement'':39 ''suffering'':44 ''sung'':148,164 ''sản'':151 ''t'':122 ''that'':64 ''the'':1,45,82,92,99,109,133 ''this'':6,85,114 ''through'':81 ''tiếp'':161 ''to'':19,50,88,91,127 ''today'':139 ''translation'':86,116 ''translators'':46 ''tả'':150 ''tục'':162 ''university'':59 ''usa'':138 ''version'':10 ''wait'':124 ''well'':62 ''who'':107,120 ''with'':68,130 ''work'':33 ''world'':67 ''york'':101'),
  (163, 'iPhone 17 Pro 256GB | Chính hãng', 17, 6, '<h2 id="gia-iphone-17-pro-bao-nhieu-tien-tai-cellphones-cap-nhat-lien-tuc-01-2026"><strong>Gi&aacute; iPhone 17 Pro bao nhi&ecirc;u tiền tại CellphoneS, cập nhật li&ecirc;n tục 01/2026</strong></h2>
<p>iPhone 17 bản Pro đang được ph&acirc;n phối ch&iacute;nh h&atilde;ng tại CellphoneS với mức gi&aacute; ưu đ&atilde;i, k&egrave;m nhiều chương tr&igrave;nh hỗ trợ hấp dẫn. Gi&aacute; b&aacute;n của thiết bị thay đổi t&ugrave;y theo dung lượng v&agrave; phi&ecirc;n bản, gi&uacute;p kh&aacute;ch h&agrave;ng dễ d&agrave;ng chọn lựa theo nhu cầu.</p>
<h3 id="iphone-17-pro-gia-chinh-hang-tai-viet-nam-va-quoc-te"><strong>iPhone 17 Pro gi&aacute; ch&iacute;nh h&atilde;ng tại Việt Nam v&agrave; quốc tế</strong></h3>
<p>iPhone 17 Pro ch&iacute;nh h&atilde;ng tại thị trường Việt Nam hiện đang được ph&acirc;n phối trong tầm gi&aacute; khoảng 34,99 triệu đồng cho phi&ecirc;n bản 256GB. Ở hai phi&ecirc;n bản cấu h&igrave;nh cao hơn, gi&aacute; b&aacute;n sẽ ch&ecirc;nh lệch từ 5 - 7 triệu đồng ở từng phi&ecirc;n bản bộ nhớ.</p>
<table>
<tbody>
<tr>
<td>
<p><strong>Phi&ecirc;n bản</strong></p>
</td>
<td>
<p><strong>Gi&aacute; tại Việt Nam (CellphoneS)</strong></p>
</td>
<td>
<p><strong>Gi&aacute; quốc tế (Apple.com)</strong></p>
</td>
</tr>
<tr>
<td>
<p><strong><a title="iPhone 17 Pro 256GB" href="https://cellphones.com.vn/iphone-17-pro.html" target="_blank" rel="noopener">iPhone 17 Pro 256GB</a></strong></p>
</td>
<td>
<p>34.990.000 đ</p>
</td>
<td>
<p>1,099 USD</p>
</td>
</tr>
<tr>
<td>
<p><strong><a title="iPhone 17 Pro 512GB" href="https://cellphones.com.vn/iphone-17-pro-512gb.html" target="_blank" rel="noopener">iPhone 17 Pro 512GB</a></strong></p>
</td>
<td>
<p>41.490.000 đ</p>
</td>
<td>
<p>1.299 USD</p>
</td>
</tr>
<tr>
<td>
<p><strong><a title="iPhone 17 Pro 1TB" href="https://cellphones.com.vn/iphone-17-pro-1tb.html" target="_blank" rel="noopener">iPhone 17 Pro 1TB</a></strong></p>
</td>
<td>
<p>47.990.000 đ</p>
</td>
<td>
<p>1.499 USD</p>
</td>
</tr>
</tbody>
</table>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-1_2.jpg" alt="iPhone 17 Pro 256GB gi&aacute; ch&iacute;nh h&atilde;ng tại Việt Nam" loading="lazy"></p>
<p>Gi&aacute; ni&ecirc;m yết của 17 Pro theo từng model dung lượng</p>
<p>Ở thị trường quốc tế, Apple iPhone 17 bản Pro c&oacute; gi&aacute; khởi điểm từ 1.099 USD cho bản 256GB. Mức gi&aacute; c&oacute; thể ch&ecirc;nh lệch nhẹ giữa c&aacute;c khu vực như Mỹ, ch&acirc;u &Acirc;u hay Nhật Bản do kh&aacute;c biệt về thuế nhập khẩu v&agrave; ch&iacute;nh s&aacute;ch ph&acirc;n phối của từng quốc gia.</p>
<h3 id="so-sanh-gia-iphone-17-pro-va-iphone-17-pro-max"><strong>So s&aacute;nh gi&aacute; iPhone 17 Pro v&agrave; iPhone 17 Pro Max</strong></h3>
<p>Apple iPhone 17 Pro v&agrave; 17 Pro Max c&oacute; mức gi&aacute; ch&ecirc;nh lệch khoảng 3 triệu đồng t&ugrave;y dung lượng bộ nhớ. Model 17 Pro hướng đến kh&aacute;ch h&agrave;ng tiềm năng l&agrave; người ưu ti&ecirc;n sự nhỏ gọn v&agrave; tiện lợi trong thao t&aacute;c. Trong khi&nbsp;<a title="iPhone 17 Pro Max" href="https://cellphones.com.vn/iphone-17-pro-max.html" target="_blank" rel="noopener"><strong>iPhone 17 Pro Max</strong></a>&nbsp;hướng đến nh&oacute;m kh&aacute;ch h&agrave;ng cần m&agrave;n h&igrave;nh lớn v&agrave; pin l&acirc;u hơn.</p>
<p>&nbsp;</p>
<div>
<table class="seo-table seo-product-price table is-bordered is-narrow is-hoverable is-fullwidth">
<thead>
<tr>
<td>
<p><strong>T&ecirc;n sản phẩm</strong></p>
</td>
<td>
<p><strong>Gi&aacute; b&aacute;n</strong></p>
</td>
<td>
<p><strong>Gi&aacute; thu cũ l&ecirc;n đời</strong></p>
</td>
</tr>
</thead>
<tbody>
<tr>
<td>
<p>iPhone 17 Pro 256GB | Ch&iacute;nh h&atilde;ng</p>
</td>
<td>
<p>34.390.000đ</p>
</td>
<td>
<p>32.390.000đ</p>
</td>
</tr>
<tr>
<td>
<p>iPhone 17 Pro Max 256GB | Ch&iacute;nh h&atilde;ng</p>
</td>
<td>
<p>37.690.000đ</p>
</td>
<td>
<p>35.690.000đ</p>
</td>
</tr>
</tbody>
</table>
</div>
<p>&nbsp;</p>
<p>Ở g&oacute;c độ trải nghiệm, sự kh&aacute;c biệt gi&aacute; giữa hai model kh&ocirc;ng chỉ đến từ k&iacute;ch thước m&agrave; c&ograve;n từ dung lượng pin v&agrave; thời lượng sử dụng. C&ugrave;ng với đ&oacute;, cả hai đều sử dụng chung chip A19 Pro v&agrave; hệ thống camera chuy&ecirc;n nghiệp, gi&uacute;p trải nghiệm mượt m&agrave; v&agrave; ổn định tương tự.&nbsp;</p>
<h3 id="gia-iphone-17-pro-vs-16-pro-va-15-pro-chenh-lech-nhieu-khong"><strong>Gi&aacute; iPhone 17 Pro vs 16 Pro v&agrave; 15 Pro ch&ecirc;nh lệch nhiều kh&ocirc;ng?</strong></h3>
<p>Apple iPhone 17 Pro l&agrave; mẫu smartphone cao cấp h&agrave;ng đầu năm 2025, n&ecirc;n mức gi&aacute; cao hơn khoảng 5-7 triệu đồng so với&nbsp;<a title="iPhone 16 Pro" href="https://cellphones.com.vn/iphone-16-pro.html" target="_blank" rel="noopener"><strong>iPhone 16 Pro</strong></a>&nbsp;v&agrave; gần 10 triệu đồng so với 15 Pro. Chi tiết gi&aacute; b&aacute;n ở từng phi&ecirc;n bản tại CellphoneS v&agrave;o th&aacute;ng 01/2026 như sau:</p>
<p>&nbsp;</p>
<div>
<table class="seo-table seo-product-price table is-bordered is-narrow is-hoverable is-fullwidth">
<thead>
<tr>
<td>
<p><strong>T&ecirc;n sản phẩm</strong></p>
</td>
<td>
<p><strong>Gi&aacute; b&aacute;n</strong></p>
</td>
<td>
<p><strong>Gi&aacute; thu cũ l&ecirc;n đời</strong></p>
</td>
</tr>
</thead>
<tbody>
<tr>
<td>
<p>iPhone 17 Pro 256GB | Ch&iacute;nh h&atilde;ng</p>
</td>
<td>
<p>34.390.000đ</p>
</td>
<td>
<p>32.390.000đ</p>
</td>
</tr>
<tr>
<td>
<p>iPhone 16 Pro 128GB | Ch&iacute;nh h&atilde;ng VN/A</p>
</td>
<td>
<p>25.490.000đ</p>
</td>
<td>
<p>23.490.000đ</p>
</td>
</tr>
<tr>
<td>
<p>iPhone 15 Pro 128GB | Ch&iacute;nh h&atilde;ng VN/A</p>
</td>
<td>
<p>23.990.000đ</p>
</td>
<td>
<p>21.990.000đ</p>
</td>
</tr>
</tbody>
</table>
</div>
<p>&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-5_1.jpg" alt="Gi&aacute; iPhone 17 Pro vs 16 Pro v&agrave; 15 Pro" loading="lazy"></p>
<p>So s&aacute;nh nhanh gi&aacute; của 3 phi&ecirc;n bản iPhone mới</p>
<p>So với hai thế hệ trước, 17 Pro được n&acirc;ng cấp to&agrave;n diện về hiệu năng, khả năng tản nhiệt v&agrave; độ s&aacute;ng m&agrave;n h&igrave;nh nhờ đ&oacute; mang đến trải nghiệm mượt m&agrave; hơn. Hệ thống camera tr&ecirc;n model iPhone mới n&agrave;y cũng được cải tiến đ&aacute;ng kể, gi&uacute;p ảnh v&agrave; video c&oacute; độ chi tiết cao, m&agrave;u sắc c&acirc;n bằng tự nhi&ecirc;n hơn.&nbsp;</p>
<p>B&ecirc;n cạnh đ&oacute;, hiệu suất thực tế cho thấy thiết bị vận h&agrave;nh ổn định v&agrave; tiết kiệm năng lượng r&otilde; rệt nhờ chip A19 Pro tối ưu. V&igrave; thế, d&ugrave; mức gi&aacute; hiện tại cao hơn, Apple iP 17 Pro vẫn l&agrave; lựa chọn đ&aacute;ng c&acirc;n nhắc cho kh&aacute;ch h&agrave;ng muốn n&acirc;ng cấp từ iPhone 15 Pro hoặc 16 Pro.</p>
<h3 id="iphone-17-pro-tra-gop-tai-cellphones-tra-truoc-bao-nhieu-tien"><strong>iPhone 17 Pro trả g&oacute;p tại CellphoneS, trả trước bao nhi&ecirc;u tiền?</strong></h3>
<p><a title="iPhone 17 series" href="https://cellphones.com.vn/mobile/apple/iphone-17.html" target="_blank" rel="noopener"><strong>iPhone 17 series</strong></a>&nbsp;n&oacute;i chung v&agrave; bản Pro hiện được CellphoneS triển khai chương tr&igrave;nh trả g&oacute;p linh hoạt. Kh&aacute;ch h&agrave;ng chỉ cần trả trước từ 20&ndash;30% gi&aacute; trị m&aacute;y, tương đương khoảng 7 &ndash; 10 triệu đồng t&ugrave;y phi&ecirc;n bản. Ngo&agrave;i ra, kh&aacute;ch h&agrave;ng c&ograve;n c&oacute; thể chọn g&oacute;i trả trước 0 đồng th&ocirc;ng qua đối t&aacute;c t&agrave;i ch&iacute;nh, với l&atilde;i suất 0% v&agrave; thủ tục x&eacute;t duyệt nhanh ch&oacute;ng.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-6_1.jpg" alt="Ưu đ&atilde;i trả g&oacute;p iPhone 17 Pro tại CellphoneS" loading="lazy"></p>
<p>Ưu đ&atilde;i trả g&oacute;p linh hoạt khi mua m&aacute;y tại CellphoneS&nbsp;</p>
<p>C&ugrave;ng với đ&oacute;, CellphoneS hỗ trợ nhiều h&igrave;nh thức thanh to&aacute;n kh&aacute;c nhau, bao gồm thẻ t&iacute;n dụng, v&iacute; điện tử v&agrave; trả g&oacute;p trực tiếp qua ng&acirc;n h&agrave;ng. C&aacute;c ưu đ&atilde;i đi k&egrave;m như giảm gi&aacute; phụ kiện, tặng phiếu mua h&agrave;ng hoặc g&oacute;i bảo h&agrave;nh mở rộng cũng gi&uacute;p việc sở hữu iPhone 17 phi&ecirc;n bản Pro trở n&ecirc;n dễ d&agrave;ng hơn nhiều.</p>
<h2 id="iphone-17-pro-co-may-mau-can-canh-hinh-anh-17-pro"><strong>iPhone 17 Pro c&oacute; mấy m&agrave;u? Cận cảnh h&igrave;nh ảnh 17 Pro</strong></h2>
<blockquote>
<p><strong>iPhone 17 Pro</strong>&nbsp;c&oacute;&nbsp;3 m&agrave;u ch&iacute;nh thức:&nbsp;<strong>Cam Vũ Trụ, Xanh Đậm, v&agrave; Bạc.&nbsp;</strong>Xem chi tiết h&igrave;nh ảnh điện thoại iPhone 17 Pro ngay</p>
</blockquote>
<h3 id="iphone-17-pro-mau-cam-vu-tru-cosmic-orange"><strong>iPhone 17 Pro m&agrave;u Cam Vũ Trụ (Cosmic Orange)</strong></h3>
<blockquote>
<p><strong>iPhone 17 Pro m&agrave;u Cam Vũ Trụ (Cosmic Orange)</strong>, mang đến l&agrave;n gi&oacute; mới đầy ấn tượng trong bảng m&agrave;u cao cấp của d&ograve;ng Pro năm nay. Lấy cảm hứng từ &aacute;nh ho&agrave;ng h&ocirc;n rực rỡ, sắc cam được ho&agrave;n thiện với độ sắc n&eacute;t tinh tế, to&aacute;t l&ecirc;n vẻ thời thượng v&agrave; kh&aacute;c biệt, tạo điểm nhấn đậm chất c&aacute; t&iacute;nh cho thiết bị.</p>
</blockquote>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-33.jpg" alt="Điện thoại iPhone 17 Pro m&agrave;u Cam Vũ Trụ" loading="lazy"><img title="" alt="" loading="lazy"></p>
<p>Gam m&agrave;u n&agrave;y mang lại trải nghiệm thị gi&aacute;c sinh động v&agrave; tạo cảm gi&aacute;c cuốn h&uacute;t mạnh mẽ ngay từ lần đầu chạm mắt. Sự kết hợp giữa sắc cam rực rỡ c&ugrave;ng đường n&eacute;t thiết kế tinh xảo mang đến vẻ sang trọng, thời thượng v&agrave; khẳng định phong c&aacute;ch ri&ecirc;ng đầy c&aacute; t&iacute;nh, nổi bật trong mọi bối cảnh.</p>
<h3 id="iphone-17-pro-mau-xanh-dam-deep-blue"><strong>iPhone 17 Pro m&agrave;u Xanh Đậm (Deep Blue)</strong></h3>
<blockquote>
<p><strong>iPhone 17 Pro m&agrave;u Xanh Đậm (Deep Blue)</strong>&nbsp;đầy cuốn h&uacute;t. Lấy cảm hứng từ sắc xanh huyền b&iacute; của đại dương s&acirc;u thẳm, gam m&agrave;u n&agrave;y mang lại cảm gi&aacute;c sang trọng v&agrave; tinh tế, g&oacute;p phần l&agrave;m nổi bật n&eacute;t đặc trưng của d&ograve;ng Pro cao cấp.</p>
</blockquote>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-34.jpg" alt="Điện thoại iPhone 17 Pro Deep Blue" loading="lazy"><img title="" alt="" loading="lazy"></p>
<p>M&agrave;u xanh đậm gi&uacute;p thiết bị to&aacute;t l&ecirc;n vẻ thanh lịch v&agrave; mạnh mẽ, dễ d&agrave;ng nổi bật trong nhiều điều kiện &aacute;nh s&aacute;ng kh&aacute;c nhau. Sự h&ograve;a quyện giữa gam m&agrave;u trầm sang v&agrave; thiết kế tối giản hiện đại mang lại tổng thể h&agrave;i h&ograve;a, khẳng định phong c&aacute;ch ri&ecirc;ng v&agrave; thể hiện gu thẩm mỹ kh&aacute;c biệt.</p>
<h3 id="iphone-17-pro-mau-bac-silver"><strong>iPhone 17 Pro m&agrave;u Bạc (Silver)</strong></h3>
<blockquote>
<p><strong>iPhone 17 Pro 256GB m&agrave;u Bạc (Silver)</strong>&nbsp;ch&iacute;nh thức ra mắt, mang đến lựa chọn sang trọng, tinh tế v&agrave; hiện đại cho người d&ugrave;ng y&ecirc;u th&iacute;ch thiết kế cao cấp. Sắc bạc &aacute;nh kim mềm mại, lấy cảm hứng từ &aacute;nh kim loại tinh khiết, t&ocirc;n l&ecirc;n từng đường n&eacute;t tinh xảo v&agrave; mang lại vẻ ngo&agrave;i thanh lịch, đầy sức h&uacute;t trong mọi g&oacute;c nh&igrave;n.</p>
</blockquote>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-35.jpg" alt="Điện thoại iPhone 17 Pro Silver" loading="lazy"><img alt="" loading="lazy"></p>
<p>Sắc bạc phản chiếu &aacute;nh s&aacute;ng tự nhi&ecirc;n, l&agrave;m nổi bật c&aacute;c đường n&eacute;t tinh tế v&agrave; tạo chiều s&acirc;u thị gi&aacute;c. Gam m&agrave;u trung t&iacute;nh kết hợp c&ugrave;ng kiểu d&aacute;ng hiện đại mang đến tổng thể h&agrave;i h&ograve;a, thanh lịch v&agrave; nổi bật trong mọi bối cảnh, thể hiện phong c&aacute;ch thời thượng v&agrave; đẳng cấp sang trọng.</p>
<h2 id="hieu-nang-iphone-17-pro--chip-a19-pro-bo-nho-da-dang"><strong>Hiệu năng iPhone 17 Pro &ndash; Chip A19 Pro, bộ nhớ đa dạng</strong></h2>
<p>iPhone 17 Pro kh&ocirc;ng chỉ chinh phục người d&ugrave;ng bằng vẻ ngo&agrave;i sang trọng m&agrave; c&ograve;n bởi khả năng vận h&agrave;nh mượt m&agrave;. Từng thao t&aacute;c mở ứng dụng, chuyển cảnh hay xử l&yacute; t&aacute;c vụ nặng đều diễn ra nhanh ch&oacute;ng v&agrave; ổn định, mang đến cảm gi&aacute;c liền mạch.</p>
<h3 id="cong-nghe-chip-a19-pro-manh-hon-tiet-kiem-pin-hon"><strong>C&ocirc;ng nghệ chip A19 Pro: Mạnh hơn, tiết kiệm pin hơn</strong></h3>
<p>iPhone 17 bản Pro sử dụng chip A19 Pro được sản xuất tr&ecirc;n tiến tr&igrave;nh hiện đại, gi&uacute;p tăng hiệu suất cao hơn tới 40% so với A18 Pro. Việc trang bị ray tracing phần cứng mang đến khả năng xử l&yacute; đồ họa ch&acirc;n thực v&agrave; chi tiết hơn khi chơi game 3D.&nbsp;</p>
<p>B&ecirc;n cạnh đ&oacute;, kiến tr&uacute;c năng lượng mới cũng gi&uacute;p thiết bị tiết kiệm pin hiệu quả, k&eacute;o d&agrave;i thời gian sử dụng trong ng&agrave;y. Kh&ocirc;ng chỉ dừng ở hiệu năng, iPhone 17 Pro c&ograve;n cho ph&eacute;p người d&ugrave;ng tận hưởng trải nghiệm liền mạch giữa c&aacute;c ứng dụng nặng như edit video hoặc chơi game AAA.&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-7_1.jpg" alt="iPhone 17 bản Pro sử dụng chip A19 Pro" loading="lazy"></p>
<p>Chip mới tối ưu hiệu năng v&agrave; pin</p>
<p>Ngo&agrave;i ra, khả năng xử l&yacute; h&igrave;nh ảnh, thuật to&aacute;n AI của chip mới cũng được n&acirc;ng cấp đ&aacute;ng kể, gi&uacute;p thiết bị học hỏi th&oacute;i quen người d&ugrave;ng để tối ưu h&oacute;a tốc độ phản hồi. Nhờ vậy, hiệu năng tổng thể của m&aacute;y đạt đến mức ổn định cao v&agrave; đ&aacute;p ứng mọi nhu cầu sử dụng chuy&ecirc;n nghiệp.</p>
<h3 id="bo-nho-da-dang-tu-256gb-den-1tb"><strong>Bộ nhớ đa dạng từ 256GB đến 1TB</strong></h3>
<p>Apple iPhone 17 Pro mang đến nhiều t&ugrave;y chọn bộ nhớ trong gồm 256GB, 512GB v&agrave; 1TB, đ&aacute;p ứng linh hoạt nhu cầu lưu trữ của từng người d&ugrave;ng. Với dung lượng lớn, thiết bị cho ph&eacute;p lưu trữ h&agrave;ng ngh&igrave;n bức ảnh, video 4K v&agrave; ứng dụng nặng m&agrave; kh&ocirc;ng lo thiếu kh&ocirc;ng gian.&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-8_2.jpg" alt="Dung lượng Apple iPhone 17 Pro" loading="lazy"></p>
<p>T&ugrave;y chọn dung lượng lưu trữ phong ph&uacute;&nbsp;</p>
<p>B&ecirc;n cạnh đ&oacute;, việc sử dụng chuẩn lưu trữ tốc độ cao gi&uacute;p truy xuất dữ liệu nhanh hơn, r&uacute;t ngắn thời gian mở ứng dụng v&agrave; tải tệp. Kh&ocirc;ng chỉ phục vụ nhu cầu c&aacute; nh&acirc;n, iPhone 17 phi&ecirc;n bản Pro c&ograve;n l&agrave; c&ocirc;ng cụ l&yacute; tưởng cho người l&agrave;m s&aacute;ng tạo nội dung nhờ khả năng lưu trữ v&agrave; truy cập dữ liệu tức th&igrave;.&nbsp;</p>
<p>C&ugrave;ng với đ&oacute;, t&iacute;nh năng đồng bộ iCloud gi&uacute;p sao lưu an to&agrave;n v&agrave; truy cập dễ d&agrave;ng từ mọi thiết bị trong hệ sinh th&aacute;i Apple. Nhờ vậy, người d&ugrave;ng c&oacute; thể y&ecirc;n t&acirc;m sử dụng l&acirc;u d&agrave;i m&agrave; kh&ocirc;ng gặp giới hạn về dung lượng lưu trữ.</p>
<h3 id="antutu-benchmark-v10-kha-nang-choi-game-duy-tri-fps-on-dinh"><strong>AnTuTu Benchmark v10, khả năng chơi game duy tr&igrave; FPS ổn định</strong></h3>
<p>iPhone 17 Pro đạt điểm hiệu năng gần 2,27 triệu tr&ecirc;n AnTuTu v10, chứng minh sức mạnh vượt trội trong ph&acirc;n kh&uacute;c smartphone cao cấp. GPU 6 nh&acirc;n mới gi&uacute;p tăng khả năng xử l&yacute; đồ họa, duy tr&igrave; khung h&igrave;nh ổn định ngay cả trong c&aacute;c tựa game nặng như Genshin Impact hay PUBG Mobile.&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-9_2.jpg" alt="Điểm hiệu năng tr&ecirc;n iPhone 17 Pro " loading="lazy"></p>
<p>Hiệu suất ổn định khi đạt 2,27 triệu điểm AnTuTu v10</p>
<p>B&ecirc;n cạnh đ&oacute;, hệ thống tản nhiệt hơi được thiết kế lại gi&uacute;p giảm nhiệt độ m&aacute;y khi hoạt động l&acirc;u. Kết quả thử nghiệm cho thấy iPhone 17 Pro c&oacute; thể duy tr&igrave; FPS trung b&igrave;nh 60 khung h&igrave;nh/gi&acirc;y trong thời gian d&agrave;i, kh&ocirc;ng xuất hiện t&igrave;nh trạng giật lag.&nbsp;</p>
<p>Điều đ&oacute; gi&uacute;p trải nghiệm chơi game trở n&ecirc;n ổn định, liền mạch v&agrave; &iacute;t giật lag hơn. C&ugrave;ng với đ&oacute;, việc kết hợp giữa chip A19 Pro v&agrave; iOS 26 gi&uacute;p tối ưu khả năng xử l&yacute; đồ họa, đảm bảo m&aacute;y vận h&agrave;nh &ecirc;m &aacute;i trong mọi điều kiện sử dụng.</p>
<h2 id="thiet-ke-va-man-hinh-iphone-17-pro--sang-trong-va-ben-bi"><strong>Thiết kế v&agrave; m&agrave;n h&igrave;nh iPhone 17 Pro &ndash; Sang trọng v&agrave; bền bỉ</strong></h2>
<p>iPhone 17 Pro được ho&agrave;n thiện tỉ mỉ từ chất liệu cứng c&aacute;p, mang đến cảm gi&aacute;c cầm nắm chắc tay v&agrave; bền bỉ. Thiết bị thể hiện r&otilde; phong c&aacute;ch sang trọng với c&aacute;c t&ocirc;ng m&agrave;u mới, ph&ugrave; hợp người d&ugrave;ng y&ecirc;u th&iacute;ch vẻ ngo&agrave;i tinh tế.</p>
<h3 id="chat-lieu-khung-nhom-ceramic-shield-2-nhe-cung-cap-chong-tray-xuoc"><strong>Chất liệu khung nh&ocirc;m Ceramic Shield 2: Nhẹ, cứng c&aacute;p, chống trầy xước</strong></h3>
<p>iPhone 17 bản Pro sở hữu khung nh&ocirc;m c&ugrave;ng với mặt trước Ceramic Shield 2, nhẹ hơn nhưng vẫn giữ độ cứng c&aacute;p đ&aacute;ng kể so với thế hệ trước. Vật liệu n&agrave;y kh&ocirc;ng chỉ gi&uacute;p m&aacute;y bền bỉ hơn m&agrave; c&ograve;n hạn chế trầy xước trong qu&aacute; tr&igrave;nh sử dụng hằng ng&agrave;y.&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-10.jpg" alt="Khung m&aacute;y iPhone 17 Pro" loading="lazy"></p>
<p>Khung nh&ocirc;m, Ceramic Shield 2 gi&uacute;p tăng độ bền cho m&aacute;y</p>
<p>C&ugrave;ng với đ&oacute;, m&aacute;y được ho&agrave;n thiện với g&oacute;c cạnh bo cong mềm mại, tạo cảm gi&aacute;c cầm nắm thoải m&aacute;i hơn khi d&ugrave;ng l&acirc;u. Điện thoại iPhone 17 Pro c&ograve;n được thiết kế để chịu được va chạm nhẹ v&agrave; bụi bẩn trong m&ocirc;i trường l&agrave;m việc hoặc di chuyển.&nbsp;</p>
<p>Sự kết hợp giữa khung nh&ocirc;m v&agrave; mặt k&iacute;nh Ceramic Shield 2 gi&uacute;p thiết bị vừa nhẹ nh&agrave;ng vừa sang trọng. Nhờ đặc t&iacute;nh bền bỉ của vật liệu, thiết bị duy tr&igrave; được h&igrave;nh thức sang trọng v&agrave; độ mới qua thời gian d&agrave;i sử dụng.</p>
<h3 id="man-hinh-super-retina-xdr-6-3-inch-3000-nits-tan-so-quet-120hz"><strong>M&agrave;n h&igrave;nh Super Retina XDR 6.3 inch, 3000 nits, tần số qu&eacute;t 120Hz</strong></h3>
<p>iPhone 17 Pro được trang bị m&agrave;n h&igrave;nh Super Retina XDR OLED k&iacute;ch thước 6.3 inch, hỗ trợ độ s&aacute;ng tối đa đến 3000 nits, gi&uacute;p hiển thị r&otilde; n&eacute;t dưới &aacute;nh s&aacute;ng mạnh. C&ugrave;ng với đ&oacute;, tần số qu&eacute;t 120Hz mang lại chuyển động mượt m&agrave;, ph&ugrave; hợp khi chơi game hay xem video tốc độ cao.&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-11_1.jpg" alt="M&agrave;n h&igrave;nh iPhone 17 Pro" loading="lazy"></p>
<p>M&agrave;n h&igrave;nh hiển thị rực rỡ, sắc n&eacute;t dưới &aacute;nh s&aacute;ng mạnh</p>
<p>Ngo&agrave;i ra, độ ph&acirc;n giải 2622&times;1206 pixel tr&ecirc;n m&aacute;y c&ograve;n đảm bảo h&igrave;nh ảnh chi tiết, sắc n&eacute;t v&agrave; sống động. C&ocirc;ng nghệ True Tone v&agrave; HDR10+ gi&uacute;p Apple iPhone 17 Pro t&aacute;i hiện m&agrave;u sắc ch&acirc;n thực, độ tương phản cao trong mọi điều kiện &aacute;nh s&aacute;ng. Khi xem nội dung HDR, người d&ugrave;ng dễ d&agrave;ng nhận thấy sự cải thiện r&otilde; r&agrave;ng về m&agrave;u sắc.</p>
<h2 id="camera-iphone-17-pro--cong-nghe-nhiep-anh-chuyen-nghiep"><strong>Camera iPhone 17 Pro &ndash; C&ocirc;ng nghệ nhiếp ảnh chuy&ecirc;n nghiệp</strong></h2>
<p>iPhone 17 Pro mở ra trải nghiệm nhiếp ảnh chuy&ecirc;n nghiệp ngay trong tầm tay, gi&uacute;p ghi lại dễ d&agrave;ng những khoảnh khắc đời thường với chất lượng ấn tượng. Từ chụp ảnh tới ghi h&igrave;nh, mọi khung h&igrave;nh đều được thể hiện sống động, gi&agrave;u cảm x&uacute;c.</p>
<h3 id="camera-chinh-48mp-vuot-moi-nghich-canh-chup-thieu-sang"><strong>Camera ch&iacute;nh 48MP vượt mọi nghịch cảnh chụp thiếu s&aacute;ng</strong></h3>
<p>iPhone 17 Pro sở hữu cảm biến 48MP thế hệ mới với k&iacute;ch thước điểm ảnh lớn, cho khả năng thu s&aacute;ng vượt trội. C&ugrave;ng với đ&oacute;, c&ocirc;ng nghệ Photonic Engine kết hợp thuật to&aacute;n Deep Fusion gi&uacute;p ảnh giữ chi tiết tốt v&agrave; m&agrave;u sắc tự nhi&ecirc;n.&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-13.jpg" alt="iPhone 17 Pro sở hữu cảm biến 48MP" loading="lazy"></p>
<p>Chụp đ&ecirc;m s&aacute;ng r&otilde;, m&agrave;u sắc c&acirc;n bằng</p>
<p>Ngo&agrave;i ra, chế độ chụp ban đ&ecirc;m được tối ưu để giảm nhiễu, cải thiện độ s&aacute;ng v&agrave; độ tương phản. Với khẩu độ f/1.78, iPhone 17 Pro mang lại bokeh tự nhi&ecirc;n khi chụp ch&acirc;n dung v&agrave; hỗ trợ lấy n&eacute;t nhanh hơn trong điều kiện &aacute;nh s&aacute;ng yếu.&nbsp;</p>
<p>Nhờ sự phối hợp giữa phần cứng mạnh mẽ v&agrave; phần mềm xử l&yacute; th&ocirc;ng minh, người d&ugrave;ng c&oacute; thể tạo ra những bức ảnh chất lượng cao m&agrave; kh&ocirc;ng cần chỉnh sửa nhiều. Đ&acirc;y ch&iacute;nh l&agrave; l&yacute; do d&ograve;ng Pro được đ&aacute;nh gi&aacute; cao về khả năng nhiếp ảnh.</p>
<h3 id="zoom-quang-hoc-8x-va-quay-video-4k-chat-luong-ro-net"><strong>Zoom quang học 8x v&agrave; quay video 4K chất lượng r&otilde; n&eacute;t</strong></h3>
<p>Apple iPhone 17 Pro được trang bị ống k&iacute;nh tele 100mm (4x quang học) v&agrave; 8x optical-quality (200mm), cho ph&eacute;p người d&ugrave;ng chụp r&otilde; chi tiết ở khoảng c&aacute;ch xa. C&ocirc;ng nghệ tetraprism gi&uacute;p ổn định h&igrave;nh ảnh tốt hơn khi zoom, hạn chế rung lắc đ&aacute;ng kể.&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-12_1.jpg" alt="iPhone 17 Pro sở hữu cảm biến 48MP" loading="lazy"></p>
<p>Zoom quang học 8x, quay 4K sắc n&eacute;t</p>
<p>Ngo&agrave;i ra, m&aacute;y c&ograve;n ghi điểm với chế độ quay video 4K Dolby Vision hỗ trợ tốc độ 120fps, mang đến chất lượng điện ảnh chuy&ecirc;n nghiệp. Kh&ocirc;ng chỉ vậy, 17 Pro c&ograve;n hỗ trợ quay video Spatial Video, cho ph&eacute;p t&aacute;i tạo h&igrave;nh ảnh ba chiều khi xem lại tr&ecirc;n Apple Vision Pro.&nbsp;</p>
<p>C&aacute;c chế độ Cinematic Mode v&agrave; Action Mode tiếp tục được cải thiện tr&ecirc;n model iPhone 17 n&agrave;y để chuyển động mượt m&agrave;, m&agrave;u sắc ch&iacute;nh x&aacute;c. Nhờ đ&oacute;, người d&ugrave;ng c&oacute; thể tạo n&ecirc;n những video chất lượng cao chỉ với một chiếc điện thoại nhỏ gọn.</p>
<h3 id="so-sanh-iphone-17-pro-thong-so-camera-va-iphone-16-pro-khac-nhieu-khong"><strong>So s&aacute;nh iPhone 17 Pro th&ocirc;ng số camera v&agrave; iPhone 16 Pro kh&aacute;c nhiều kh&ocirc;ng?</strong></h3>
<p>iPhone 17 Pro được n&acirc;ng cấp cảm biến v&agrave; thuật to&aacute;n xử l&yacute; h&igrave;nh ảnh so với iPhone 16 Pro, gi&uacute;p ảnh chụp đạt độ chi tiết v&agrave; c&acirc;n bằng s&aacute;ng tốt hơn. Cụ thể, m&aacute;y sử dụng cảm biến ch&iacute;nh 48MP với ti&ecirc;u cự 24mm, hỗ trợ quay video Dolby Vision 4K ở 120fps v&agrave; khả năng chụp &lsquo;optical-quality&rsquo; zoom tới 200mm.&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-14_1.jpg" alt="So s&aacute;nh th&ocirc;ng số camera iPhone 17 Pro v&agrave; iPhone 16 Pro" loading="lazy"></p>
<p>Th&ocirc;ng số camera n&acirc;ng cấp so với thế hệ trước</p>
<p>Trong khi đ&oacute;, iPhone 16 Pro chỉ đạt mức zoom quang học 5x, chưa hỗ trợ đầy đủ c&ocirc;ng nghệ Spatial Video mới. B&ecirc;n cạnh đ&oacute;, iPhone 17 phi&ecirc;n bản Pro c&ograve;n tối ưu cảm biến Ultra Wide v&agrave; Telephoto gi&uacute;p bắt s&aacute;ng tốt hơn, đặc biệt trong điều kiện &aacute;nh s&aacute;ng yếu.&nbsp;</p>
<table>
<tbody>
<tr>
<td>
<p><strong>Hạng mục</strong></p>
</td>
<td>
<p><strong>iPhone 17 Pro</strong></p>
</td>
<td>
<p><strong>iPhone 16 Pro</strong></p>
</td>
</tr>
<tr>
<td>
<p>Camera ch&iacute;nh</p>
</td>
<td>
<p>48MP, thuật to&aacute;n xử l&yacute; thế hệ mới, cải thiện thiếu s&aacute;ng</p>
</td>
<td>
<p>48MP, xử l&yacute; h&igrave;nh ảnh n&acirc;ng cấp so với 15 Pro</p>
</td>
</tr>
<tr>
<td>
<p>Ống k&iacute;nh Telephoto</p>
</td>
<td>
<p>Tetraprism 100mm, &lsquo;optical-quality&rsquo; zoom tới ~200mm</p>
</td>
<td>
<p>Tetraprism 120mm, zoom quang học 5x</p>
</td>
</tr>
<tr>
<td>
<p>Ống k&iacute;nh Ultra Wide</p>
</td>
<td>
<p>G&oacute;c si&ecirc;u rộng thế hệ mới, tối ưu thu s&aacute;ng</p>
</td>
<td>
<p>G&oacute;c si&ecirc;u rộng, cải thiện m&eacute;o v&agrave; nhiễu</p>
</td>
</tr>
<tr>
<td>
<p>Zoom tổng thể</p>
</td>
<td>
<p>Hỗ trợ &lsquo;optical-quality&rsquo; 8x, dải zoom rộng hơn</p>
</td>
<td>
<p>Zoom quang học 5x, hỗ trợ zoom số</p>
</td>
</tr>
<tr>
<td>
<p>Quay video</p>
</td>
<td>
<p>Dolby Vision 4K tới 120fps, hỗ trợ Spatial Video</p>
</td>
<td>
<p>Dolby Vision 4K, Cinematic/Action Mode</p>
</td>
</tr>
</tbody>
</table>
<p>Nhờ chip A19 Pro v&agrave; Neural Engine 16 nh&acirc;n, khả năng xử l&yacute; h&igrave;nh ảnh AI của iPhone 17 Pro cũng nhanh hơn đ&aacute;ng kể so với thế hệ trước. Nhờ vậy, người d&ugrave;ng c&oacute; thể nhận thấy r&otilde; sự kh&aacute;c biệt khi chuyển từ iPhone 16 Pro sang d&ograve;ng 17 Pro mới.</p>
<h2 id="pin-va-sac-iphone-17-pro-vs-iphone-16-pro-khac-nhau-nhieu-khong"><strong>Pin v&agrave; sạc iPhone 17 Pro vs iPhone 16 Pro kh&aacute;c nhau nhiều kh&ocirc;ng?</strong></h2>
<p>iPhone 17 bản Pro kh&ocirc;ng chỉ mạnh hơn về hiệu năng m&agrave; c&ograve;n được tối ưu đ&aacute;ng kể về thời lượng pin v&agrave; khả năng sạc nhanh. M&aacute;y sử dụng pin dung lượng cao hơn, kết hợp chip mới tiết kiệm điện, gi&uacute;p thời lượng sử dụng k&eacute;o d&agrave;i suốt ng&agrave;y d&agrave;i.</p>
<h3 id="so-sanh-thoi-luong-pin-test-thuc-te-giua-17-pro-vs-16-pro-tai-cellphones"><strong>So s&aacute;nh thời lượng pin test thực tế giữa 17 Pro vs 16 Pro tại CellphoneS</strong></h3>
<p>iPhone 17 Pro cho thời lượng ph&aacute;t video l&ecirc;n tới 31 giờ, cao hơn khoảng 4 giờ so với iPhone 16 Pro theo c&ocirc;ng bố của Apple. Khi chơi game hoặc quay 4K li&ecirc;n tục, thiết bị vẫn giữ nhiệt ổn định nhờ hệ thống tản nhiệt được tinh chỉnh.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-16.jpg" alt="So s&aacute;nh thời lượng pin test thực tế giữa 17 Pro vs 16 Pro" loading="lazy"></p>
<p>Thời lượng pin d&agrave;i hơn trong thử nghiệm</p>
<table>
<tbody>
<tr>
<td>
<p><strong>Mẫu m&aacute;y</strong></p>
</td>
<td>
<p><strong>M&ocirc;i trường/thiết lập khi test</strong></p>
</td>
<td>
<p><strong>Thời lượng sử dụng ghi nhận</strong></p>
</td>
<td>
<p><strong>Mức pin c&ograve;n lại</strong></p>
</td>
<td>
<p><strong>Ghi ch&uacute; quan s&aacute;t</strong></p>
</td>
</tr>
<tr>
<td>
<p>iPhone 17 bản Pro</p>
</td>
<td>
<p>Lắp SIM,&nbsp;<strong>chỉ d&ugrave;ng 5G&nbsp;</strong>; nghe nhạc YouTube trong giờ l&agrave;m; giải lao chơi PUBG</p>
</td>
<td>
<p>Từ&nbsp;<strong>08:30 đến ~20:00</strong></p>
</td>
<td>
<p><strong>~20%&nbsp;</strong>c&ograve;n lại l&uacute;c ~20:00</p>
</td>
<td>
<p>Sau đ&oacute; chơi th&ecirc;m&nbsp;<strong>1 trận PUBG&nbsp;</strong>, đến&nbsp;<strong>~20:45 c&ograve;n 5%&nbsp;</strong>(tụt nhanh v&igrave; chơi game nặng).</p>
</td>
</tr>
<tr>
<td>
<p>iPhone 16 bản Pro</p>
</td>
<td>
<p>D&ugrave;ng&nbsp;<strong>đa t&aacute;c vụ li&ecirc;n tục&nbsp;</strong>(chơi game, lướt web, xem video, quay phim)</p>
</td>
<td>
<p><strong>~10 giờ li&ecirc;n tục</strong></p>
</td>
<td>
<p><strong>~20%&nbsp;</strong>c&ograve;n lại sau ~10 giờ</p>
</td>
<td>
<p>Khi d&ugrave;ng cơ bản, t&aacute;c giả cho rằng&nbsp;<strong>c&oacute; thể l&ecirc;n tới hai ng&agrave;y&nbsp;</strong>(nhận định chủ quan).</p>
</td>
</tr>
</tbody>
</table>
<p>Trải nghiệm tại Sforum cho thấy m&aacute;y duy tr&igrave; hiệu suất ổn định ngay cả khi pin dưới 20%; đồng thời iOS 26 tối ưu quản l&yacute; năng lượng, hạn chế hao hụt khi chờ. Lưu &yacute;, thời lượng sử dụng thực tế của người d&ugrave;ng tr&ecirc;n 2 model iPhone hiện đại n&agrave;y c&oacute; thay đổi theo độ s&aacute;ng, &acirc;m lượng, kết nối v&agrave; điều kiện sử dụng.</p>
<h3 id="sac-nhanh-usb-c-va-sac-khong-day-magsafe-hieu-qua-va-an-toan"><strong>Sạc nhanh USB-C v&agrave; sạc kh&ocirc;ng d&acirc;y MagSafe: Hiệu quả v&agrave; an to&agrave;n</strong></h3>
<p>iPhone 17 Pro tiếp tục sử dụng cổng USB-C tốc độ cao nhưng được n&acirc;ng cấp c&ocirc;ng suất sạc nhanh tối đa 40W, cao hơn mức 20W tr&ecirc;n iPhone 16 Pro. Nhờ đ&oacute;, thiết bị c&oacute; thể nạp 50% pin chỉ trong khoảng 20 ph&uacute;t khi d&ugrave;ng củ sạc tương th&iacute;ch, trong khi model tiền nhiệm mất gần 30 ph&uacute;t cho c&ugrave;ng dung lượng.&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-18_1.jpg" alt="iPhone 17 Pro tiếp tục sử dụng cổng USB-C " loading="lazy"></p>
<p>Sạc nhanh 40W, MagSafe ổn định</p>
<p>B&ecirc;n cạnh đ&oacute;, chuẩn sạc kh&ocirc;ng d&acirc;y MagSafe 30W tr&ecirc;n phi&ecirc;n bản mới cũng hoạt động ổn định hơn, gi&uacute;p truyền năng lượng hiệu quả m&agrave; kh&ocirc;ng bị n&oacute;ng qu&aacute; mức. Ngo&agrave;i ra, iPhone 17 Pro đ&atilde; bổ sung hỗ trợ chuẩn Qi2, gi&uacute;p tăng hiệu suất sạc kh&ocirc;ng d&acirc;y so với Qi thế hệ cũ tr&ecirc;n iPhone 16 Pro.&nbsp;</p>
<p>Hệ thống kiểm so&aacute;t nhiệt độ được tinh chỉnh nhằm duy tr&igrave; mức an to&agrave;n v&agrave; hạn chế giảm hiệu năng khi sạc l&acirc;u. Nhờ vậy, người d&ugrave;ng c&oacute; thể y&ecirc;n t&acirc;m sạc nhanh hoặc sạc kh&ocirc;ng d&acirc;y thường xuy&ecirc;n m&agrave; vẫn đảm bảo tuổi thọ pin l&acirc;u d&agrave;i v&agrave; hiệu suất ổn định.</p>
<h2 id="apple-intelligence-thong-minh-tren-iphone-17-pro"><strong>Apple Intelligence th&ocirc;ng minh tr&ecirc;n iPhone 17 Pro</strong></h2>
<p>iPhone 17 Pro l&agrave; model được Apple t&iacute;ch hợp nền tảng Apple Intelligence, mang đến trải nghiệm c&aacute; nh&acirc;n h&oacute;a v&agrave; th&ocirc;ng minh hơn trong mọi t&aacute;c vụ. Từ việc soạn tin nhắn, t&oacute;m tắt nội dung đến gợi &yacute; ngữ cảnh, thiết bị đều hoạt động nhanh v&agrave; ch&iacute;nh x&aacute;c.</p>
<h3 id="ho-tro-5g-wi-fi-7-va-sim-kep--ket-noi-muot-ma-nhanh-chong"><strong>Hỗ trợ 5G, Wi-Fi 7 v&agrave; sim k&eacute;p &ndash; Kết nối mượt m&agrave;, nhanh ch&oacute;ng</strong></h3>
<p>iPhone 17 Pro được trang bị chuẩn kết nối Wi-Fi 7 (802.11be) mới, gi&uacute;p tốc độ truyền dữ liệu cao hơn so với Wi-Fi 6E. Thiết bị hỗ trợ 5G sub-6 GHz v&agrave; mmWave, mang lại trải nghiệm mạng ổn định, độ trễ thấp khi xem video hoặc chơi game trực tuyến.&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-19_2.jpg" alt="Hỗ trợ 5G, Wi-Fi 7 v&agrave; sim k&eacute;p" loading="lazy"></p>
<p>Wi-Fi 7, 5G v&agrave; eSIM k&eacute;p</p>
<p>B&ecirc;n cạnh đ&oacute;, việc sử dụng sim k&eacute;p gi&uacute;p người d&ugrave;ng dễ d&agrave;ng chuyển đổi giữa c&aacute;c nh&agrave; mạng tiện lợi. Đặc biệt, Apple iPhone 17 Pro c&ograve;n t&iacute;ch hợp chip UWB thế hệ 2 v&agrave; Bluetooth 6, gi&uacute;p định vị thiết bị ch&iacute;nh x&aacute;c hơn khi d&ugrave;ng AirTag hoặc chia sẻ AirDrop.&nbsp;</p>
<p>C&aacute;c kết nối đều được tối ưu năng lượng, hạn chế ti&ecirc;u hao pin trong thời gian d&agrave;i sử dụng. Nhờ vậy, khả năng kết nối của m&aacute;y vừa nhanh, vừa th&ocirc;ng minh, mang lại trải nghiệm liền mạch cho người d&ugrave;ng hiện đại.</p>
<h3 id="bao-mat-face-id-va-cac-tinh-nang-bao-ve-du-lieu-moi-nhat-tren-ios-26"><strong>Bảo mật Face ID v&agrave; c&aacute;c t&iacute;nh năng bảo vệ dữ liệu mới nhất tr&ecirc;n iOS 26</strong></h3>
<p>iPhone 17 Pro tiếp tục ph&aacute;t huy thế mạnh về bảo mật với Face ID thế hệ mới, cho khả năng nhận diện nhanh v&agrave; ch&iacute;nh x&aacute;c hơn trong nhiều g&oacute;c độ &aacute;nh s&aacute;ng. B&ecirc;n cạnh đ&oacute;, iOS 26 bổ sung t&iacute;nh năng kiểm so&aacute;t quyền ri&ecirc;ng tư n&acirc;ng cao, gi&uacute;p người d&ugrave;ng chủ động hơn khi chia sẻ dữ liệu.&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-20_2.jpg" alt="Bảo mật Face ID" loading="lazy"></p>
<p>Face ID nhanh, bảo vệ dữ liệu tốt hơn</p>
<p>C&aacute;c t&iacute;nh năng như Keychain Password Manager hay Private Relay được cải tiến để giữ an to&agrave;n cho th&ocirc;ng tin c&aacute; nh&acirc;n. Nhờ vậy, người d&ugrave;ng c&oacute; thể y&ecirc;n t&acirc;m lưu trữ v&agrave; sử dụng thiết bị trong m&ocirc;i trường trực tuyến ng&agrave;y c&agrave;ng phức tạp.</p>
<h2 id="mua-iphone-17-pro-tai-cellphones-bao-hanh-co-gi-khac"><strong>Mua iPhone 17 Pro tại CellphoneS, bảo h&agrave;nh c&oacute; g&igrave; kh&aacute;c?</strong></h2>
<p>Mua iPhone 17 Pro ch&iacute;nh h&atilde;ng ph&acirc;n phối tại CellphoneS đi k&egrave;m nhiều ch&iacute;nh s&aacute;ch hậu m&atilde;i v&agrave; bảo h&agrave;nh minh bạch. Kh&aacute;ch h&agrave;ng khi mua m&aacute;y tại hệ thống sẽ được hỗ trợ tận t&igrave;nh, đảm bảo trải nghiệm trọn vẹn từ kh&acirc;u chọn sản phẩm đến sau mua.</p>
<h3 id="bao-hanh-chinh-hang-12-thang"><strong>Bảo h&agrave;nh ch&iacute;nh h&atilde;ng 12 th&aacute;ng</strong></h3>
<p>Khi mua sắm iPhone 17 bản Pro tại CellphoneS, người d&ugrave;ng sẽ được hưởng chế độ bảo h&agrave;nh thời gian d&agrave;i tại trung t&acirc;m bảo h&agrave;nh ch&iacute;nh h&atilde;ng Apple: CareS.vn. Trong suốt thời hạn bảo h&agrave;nh, kh&aacute;ch h&agrave;ng c&oacute; thể đem thiết bị đến c&aacute;c trung t&acirc;m ủy quyền của Apple n&agrave;y để được kiểm tra v&agrave; hỗ trợ kỹ thuật kh&ocirc;ng mất ph&iacute;.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-21.jpg" alt="Bảo h&agrave;nh ch&iacute;nh h&atilde;ng 12 th&aacute;ng" loading="lazy"></p>
<p>Bảo h&agrave;nh ch&iacute;nh h&atilde;ng 12 th&aacute;ng to&agrave;n hệ thống</p>
<p>Ngo&agrave;i ra, CellphoneS cũng hỗ trợ đổi mới trong 30 ng&agrave;y đầu nếu m&aacute;y gặp lỗi từ nh&agrave; sản xuất. B&ecirc;n cạnh đ&oacute;, kh&aacute;ch h&agrave;ng mua Apple iPhone 17 Pro c&ograve;n được khuyến nghị tham gia g&oacute;i bảo h&agrave;nh mở rộng AppleCare+ để được bảo vệ to&agrave;n diện hơn.</p>
<h3 id="chinh-sach-thu-cu-doi-moi-den-5-trieu-cho-moi-dong-iphone"><strong>Ch&iacute;nh s&aacute;ch thu cũ đổi mới đến 5 triệu cho mọi d&ograve;ng iPhone</strong></h3>
<p>iPhone 17 bản Pro nằm trong chương tr&igrave;nh thu cũ đổi mới của CellphoneS, cho ph&eacute;p kh&aacute;ch h&agrave;ng tiết kiệm chi ph&iacute; n&acirc;ng cấp. Cụ thể, khi mang m&aacute;y cũ đến, kh&aacute;ch h&agrave;ng c&oacute; thể nhận mức hỗ trợ l&ecirc;n đến 5 triệu đồng t&ugrave;y theo t&igrave;nh trạng thiết bị.&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-22.jpg" alt="Ch&iacute;nh s&aacute;ch thu cũ đổi mới" loading="lazy"></p>
<p>Ưu đ&atilde;i thu cũ đổi mới tới 5 triệu khi mua tại CellphoneS</p>
<p>Quy tr&igrave;nh định gi&aacute; diễn ra nhanh ch&oacute;ng, minh bạch v&agrave; c&oacute; thể b&ugrave; phần ch&ecirc;nh lệch để sở hữu model mới ngay. C&ugrave;ng với đ&oacute;, ch&iacute;nh s&aacute;ch n&agrave;y &aacute;p dụng cho cả những d&ograve;ng iPhone đời cũ, gi&uacute;p kh&aacute;ch h&agrave;ng dễ d&agrave;ng n&acirc;ng cấp l&ecirc;n gi&aacute; iPhone 17 Pro m&agrave; kh&ocirc;ng phải chi trả to&agrave;n bộ.&nbsp;</p>
<h3 id="mua-iphone-17-tra-truoc-0-dong-tra-sau-khong-lai"><strong>Mua iPhone 17 trả trước 0 đồng, trả sau kh&ocirc;ng l&atilde;i</strong></h3>
<p>iPhone 17 Pro tại CellphoneS được hỗ trợ chương tr&igrave;nh trả g&oacute;p 0% với nhiều ng&acirc;n h&agrave;ng v&agrave; c&ocirc;ng ty t&agrave;i ch&iacute;nh lớn. Kh&aacute;ch h&agrave;ng c&oacute; thể chọn trả trước 0 đồng, chia nhỏ chi ph&iacute; theo th&aacute;ng m&agrave; vẫn nhận m&aacute;y ngay.&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-23.jpg" alt="Mua iphone 17pro trả g&oacute;p 0%" loading="lazy"></p>
<p>Trả g&oacute;p 0 đồng, l&atilde;i suất 0% linh hoạt</p>
<p>Ch&iacute;nh s&aacute;ch n&agrave;y gi&uacute;p kh&aacute;ch h&agrave;ng dễ d&agrave;ng tiếp cận d&ograve;ng sản phẩm cao cấp m&agrave; kh&ocirc;ng phải lo g&aacute;nh nặng t&agrave;i ch&iacute;nh. Ngo&agrave;i ra, khi mua iPhone 17 Pro trả g&oacute;p, kh&aacute;ch h&agrave;ng vẫn được hưởng đầy đủ ưu đ&atilde;i đi k&egrave;m như giảm gi&aacute; phụ kiện, g&oacute;i bảo h&agrave;nh mở rộng hoặc phiếu mua h&agrave;ng.</p>
<h2 id="danh-gia-dien-thoai-iphone-17-pro-trai-nghiem-thuc-te-tai-cellphones"><strong>Đ&aacute;nh gi&aacute; điện thoại iPhone 17 Pro trải nghiệm thực tế tại CellphoneS</strong></h2>
<p>iPhone 17 bản Pro được CellphoneS tiến h&agrave;nh đ&aacute;nh gi&aacute; chi tiết từ thiết kế, camera cho đến hiệu năng v&agrave; thời lượng pin. C&aacute;c b&agrave;i test thực tế n&agrave;y sẽ gi&uacute;p người d&ugrave;ng h&igrave;nh dung r&otilde; r&agrave;ng về trải nghiệm sử dụng h&agrave;ng ng&agrave;y.</p>
<h3 id="dap-hop-iphone-17-pro-can-canh-hinh-anh-tren-tay"><strong>Đập hộp iPhone 17 Pro, cận cảnh h&igrave;nh ảnh tr&ecirc;n tay</strong></h3>
<p>iPhone 17 bản Pro g&acirc;y ấn tượng ngay từ khi mở hộp với thiết kế sang trọng v&agrave; c&aacute;ch tr&igrave;nh b&agrave;y tinh tế đặc trưng của Apple. B&ecirc;n trong hộp gồm th&acirc;n m&aacute;y, c&aacute;p USB-C to USB-C v&agrave; t&agrave;i liệu hướng dẫn.&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-24.jpg" alt="Đập hộp iPhone 17 Pro" loading="lazy"></p>
<p>Mở hộp, tr&ecirc;n tay chi tiết thực tế</p>
<p>C&ugrave;ng với đ&oacute;, cảm gi&aacute;c cầm nắm chắc chắn v&agrave; mặt k&iacute;nh mờ hạn chế b&aacute;m dấu v&acirc;n tay. Viền m&agrave;n h&igrave;nh được thu gọn c&ugrave;ng độ s&aacute;ng vượt trội mang đến khả năng hiển thị r&otilde; n&eacute;t ở nhiều m&ocirc;i trường kh&aacute;c nhau. Nhờ thiết kế tinh tế n&agrave;y, sản phẩm vừa mang t&iacute;nh thẩm mỹ vừa tạo cảm gi&aacute;c cao cấp đặc trưng của Apple.</p>
<h3 id="hieu-nang-va-tan-nhiet-tren-17-pro"><strong>Hiệu năng v&agrave; tản nhiệt tr&ecirc;n 17 Pro</strong></h3>
<p>iPhone 17 Pro cho kết quả ổn định khi chơi game v&agrave; xử l&yacute; t&aacute;c vụ nặng nhờ hệ thống tản nhiệt hơi mới. Trong c&aacute;c thử nghiệm, m&aacute;y duy tr&igrave; hiệu năng cao m&agrave; kh&ocirc;ng xuất hiện hiện tượng qu&aacute; nhiệt. Việc ph&acirc;n bổ năng lượng hợp l&yacute; giữa CPU v&agrave; GPU gi&uacute;p nhiệt độ bề mặt trong ngưỡng an to&agrave;n.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-25.jpg" alt="Hiệu năng v&agrave; tản nhiệt tr&ecirc;n 17 Pro" loading="lazy"></p>
<p>Chơi game mượt, tản nhiệt ổn định</p>
<p>Nhờ chip A19 Pro v&agrave; kiến tr&uacute;c GPU 6 nh&acirc;n, 17 Pro mang đến trải nghiệm đồ họa mượt m&agrave;, FPS ổn định ở mức cao. Đồng thời, Apple Intelligence cũng gi&uacute;p quản l&yacute; tiến tr&igrave;nh chạy nền th&ocirc;ng minh hơn, giảm tải cho hệ thống. Nhờ vậy, hiệu năng của thiết bị duy tr&igrave; ở trạng th&aacute;i tốt d&ugrave; sử dụng trong thời gian d&agrave;i.</p>
<h3 id="review-thoi-luong-pin-thuc-te-iphone-17-pro"><strong>Review thời lượng pin thực tế iPhone 17 Pro</strong></h3>
<p>iPhone 17 Pro cho ph&eacute;p người d&ugrave;ng sử dụng cả ng&agrave;y d&agrave;i với c&aacute;c t&aacute;c vụ hỗn hợp như chụp ảnh, quay video, chơi game v&agrave; lướt web. D&ugrave; Apple kh&ocirc;ng c&ocirc;ng bố dung lượng pin, nhưng thực tế thử nghiệm cho thấy thiết bị hoạt động bền bỉ, chỉ hao khoảng 5&ndash;6% sau một giờ xem YouTube HDR.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Apple/iPhone-17/iphone-17-pro-26_1.jpg" alt="Review thời lượng pin thực tế iPhone 17 Pro" loading="lazy"></p>
<p>Pin bền bỉ, sử dụng cả ng&agrave;y</p>
<p>B&ecirc;n cạnh đ&oacute;, m&aacute;y c&ograve;n cho khả năng sạc nhanh 50% trong 20 ph&uacute;t, tiện lợi cho người thường xuy&ecirc;n di chuyển. Hệ thống quản l&yacute; năng lượng của iOS 26 tự động c&acirc;n chỉnh để bảo vệ tuổi thọ pin trong qu&aacute; tr&igrave;nh sạc qua đ&ecirc;m. Nhờ vậy, thời lượng pin của thiết bị được duy tr&igrave; ổn định, đ&aacute;p ứng tốt nhu cầu sử dụng trong thực tế.</p>', '5000000', '100000', '30000000', '10000000', '2026-01-15T02:13:00.000Z', 1, 19, '2026-01-04T21:14:04.116Z', true, true, '''-6'':4161 ''-7'':497 ''/thi'':3599 ''0'':819,835,4872,4894,4919,4937,4942 ''00'':3646,3654 ''01/2026'':22,530 ''08'':3642 ''099'':178 ''1'':177,3660 ''1.099'':223 ''1.299'':186 ''1.499'':194 ''10'':507,795,3706 ''100mm'':2914,3298 ''12'':4549,4637 ''1206'':2552 ''120fps'':2991,3172,3367 ''120hz'':2460,2510 ''120mm'':3306 ''128gb'':561,574 ''15'':467,512,572,735,3291 ''16'':464,503,559,738,3102,3130,3199,3261,3384,3428,3444,3526,3552,3676,3854,3971 ''17'':2,9,24,86,100,172,181,189,201,215,274,278,283,286,306,334,370,382,461,477,547,602,713,741,755,929,943,954,957,982,986,996,1145,1154,1287,1294,1448,1458,1530,1626,1746,1859,1967,2074,2170,2178,2252,2365,2462,2584,2631,2642,2709,2805,2905,3005,3052,3094,3110,3224,3258,3397,3433,3440,3453,3523,3531,3621,3821,3943,4046,4049,4125,4223,4328,4468,4481,4556,4678,4720,4856,4869,4881,4986,5029,5038,5096,5107,5259,5262,5349,5417,5420 ''1tb'':191,1743,1761 ''2'':1974,2036,2243,2267,2320,2404,3779,4234 ''20'':785,3645,3653,3749,3868,5510 ''200mm'':2923,3182,3304 ''2025'':488 ''20w'':3850 ''21.990.000'':582 ''23.490.000'':569 ''23.990.000'':580 ''24mm'':3163 ''25.490.000'':567 ''256gb'':4,129,174,227,372,385,549,1296,1741,1758 ''26'':2136,3753,4326,4371,5530 ''2622'':2551 ''27'':1975,2037 ''3'':296,590,960 ''30'':786,3643,3886,4654 ''3000'':2454,2488 ''30w'':3911 ''31'':3542 ''32.390.000'':379,556 ''34'':121 ''34.390.000'':377,554 ''34.990.000'':175 ''35.690.000'':392 ''37.690.000'':390 ''3d'':1586 ''4'':3547 ''40'':1556 ''40w'':3846,3896 ''41.490.000'':184 ''45'':3665 ''47.990.000'':192 ''48mp'':2699,2715,3158,3266,3280 ''4k'':1794,2897,2966,2984,3170,3365,3374,3565 ''4x'':2915 ''5'':148,496,3668,4712,4769,4788,5479 ''50'':3863,5508 ''512gb'':183,1759 ''5g'':3629,4108,4159,4187 ''5x'':3207,3310,3356 ''6'':1996,4237,5346,5480 ''6.3'':2452,2478 ''60'':2084 ''6e'':4154 ''7'':149,794,4112,4136,4186 ''802.11'':4137 ''8x'':2893,2919,2964,3348 ''99'':122 ''a'':1247,1269,1423,1704,4070 ''a18'':1559 ''a19'':439,698,1451,1521,1536,2132,3379,5339 ''aaa'':1654 ''action'':3041 ''ai'':1676,3394 ''airdrop'':4256 ''airtag'':4252 ''an'':1907,3817,3987,4426,5327 ''antutu'':1954,1979,2040 ''apple'':213,281,475,711,1744,1925,2582,2903,3031,3559,4038,4054,4060,4221,4587,4614,4676,5136,5251,5367,5454 ''apple.com'':170 ''applecare'':4694 ''b'':55,141,361,517,538,672,1173,1587,1816,2042,2082,3219,3900,4192,4366,4667,4809,5065,5129,5137,5188,5495 ''ba'':3024 ''ban'':2782 ''bao'':11,750,876 ''be'':4138 ''benchmark'':1955 ''biến'':2714,3117,3155,3234 ''biệt'':252,403,1060,1285,3247,3423,4220 ''blue'':1152,1161 ''bluetooth'':4236 ''bo'':2343 ''bokeh'':2809 ''bạc'':972,1291,1299,1330,1373 ''bạch'':4508,4805 ''bản'':25,70,128,134,156,161,216,226,248,523,593,761,802,932,1531,1862,2253,3227,3454,3622,3677,3712,3916,4557,4721,5039,5108 ''bảng'':1015 ''bảo'':917,2148,2561,4025,4307,4317,4338,4403,4472,4504,4528,4542,4569,4580,4593,4630,4689,4697,5013,5537 ''bẩn'':2380 ''bật'':1139,1201,1234,1385,1428 ''bắt'':3241 ''bằng'':667,1468,2775,3143 ''bề'':5323 ''bền'':2175,2202,2296,2325,2420,5474,5488 ''bỉ'':2176,2203,2297,2421,5475,5489 ''bị'':59,683,1071,1219,1563,1601,1691,1781,1919,2205,2408,2426,2466,2909,3570,3859,3934,4096,4129,4156,4243,4453,4604,4779,5394,5471,5557 ''bố'':3557,5459 ''bối'':1142,1431 ''bổ'':3946,4372,5310 ''bộ'':157,303,1453,1736,1754,1901,4866 ''bởi'':1477 ''bụi'':2379 ''bức'':1791,2858 ''c'':218,230,237,238,251,289,330,396,402,417,428,657,665,721,810,812,826,859,874,896,897,945,959,1059,1066,1083,1090,1110,1130,1135,1189,1243,1273,1284,1369,1386,1387,1400,1409,1436,1475,1488,1498,1514,1517,1593,1628,1643,1644,1855,1864,1867,1893,1931,1991,2019,2020,2076,2123,2190,2196,2210,2215,2216,2246,2260,2275,2300,2329,2341,2350,2367,2502,2558,2573,2633,2695,2734,2738,2773,2853,2936,2939,2975,3007,3034,3035,3066,3072,3105,3141,3213,3229,3317,3330,3415,3422,3447,3465,3555,3612,3648,3652,3666,3683,3702,3714,3718,3786,3806,3830,3839,3860,3890,4005,4066,4079,4105,4213,4214,4225,4247,4257,4258,4312,4313,4356,4361,4409,4410,4433,4441,4462,4475,4478,4600,4606,4607,4680,4760,4807,4820,4902,4914,5063,5064,5125,5146,5150,5154,5170,5176,5202,5224,5245,5276,5287,5288,5344,5436,5437,5439,5457,5501,5533 ''cam'':966,990,1000,1038,1107 ''camera'':444,637,2629,2696,3099,3186,3263,5054 ''cao'':138,482,493,661,709,1018,1210,1327,1553,1723,1828,1993,2527,2598,2862,2884,3081,3489,3544,3833,3847,4147,4386,4966,5246,5297,5364 ''cares.vn'':4588 ''cellphones'':16,37,166,525,747,765,858,863,3529,4471,4491,4560,4647,4733,4793,4884,5036,5042 ''ceramic'':2241,2265,2318,2402 ''ch'':32,74,89,102,144,232,243,258,261,292,311,342,373,386,414,469,550,562,575,726,777,807,829,843,963,1131,1274,1301,1324,1437,1505,1576,2211,2230,2476,2592,2697,2721,2815,2872,2937,3063,3156,3264,3616,3878,4056,4102,4122,4228,4244,4353,4483,4496,4499,4510,4545,4583,4597,4633,4672,4703,4706,4738,4757,4802,4811,4824,4827,4843,4907,4911,4945,4948,4954,4978,4992,5126 ''chi'':514,659,974,1580,2565,2754,2932,3138,4743,4862,4923,5049,5166 ''chia'':4254,4396,4921 ''chinh'':1463 ''chip'':438,697,1450,1520,1535,1655,1678,2131,3378,3493,4230,5338 ''chiếc'':3085 ''chiếu'':1375 ''chiều'':1395,3025 ''cho'':125,225,680,724,1069,1317,1630,1782,1872,2071,2326,2726,2924,3015,3533,3716,3734,3889,4301,4346,4429,4714,4734,4832,5055,5264,5385,5422,5468,5503,5515 ''chung'':437,759 ''chuy'':445,1733,2638,2650,2998 ''chuyển'':1492,2390,2513,3056,3425,4210,5521 ''chuẩn'':1823,3904,3950,4130 ''chính'':5 ''chơi'':1584,1652,1959,2109,2520,3561,3639,3657,3672,3688,4179,5270,5330,5448 ''chưa'':3208 ''chương'':47,768,4725,4888 ''chạm'':1100,2376 ''chạy'':5377 ''chất'':1065,2187,2236,2670,2860,2898,2994,3079 ''chắc'':2199,5179 ''chắn'':5180 ''chế'':2303,2779,2955,2980,3036,3761,3992,4268,4567,5187 ''chỉ'':410,780,1462,1620,1850,2291,3003,3082,3201,3458,3626,3865,5476 ''chỉnh'':2867,3583,3982,5535 ''chịu'':2373 ''chọn'':80,718,814,1309,1753,1809,4536,4916 ''chống'':2248 ''chờ'':3765 ''chụp'':2675,2704,2764,2781,2814,2930,3135,3176,5444 ''chủ'':3728,4392 ''chứng'':1981 ''cinematic'':3038 ''cinematic/action'':3375 ''cong'':2344 ''cosmic'':993,1003 ''cpu'':5316 ''cuốn'':1091,1163 ''cũ'':365,542,3967,4708,4729,4754,4784,4839 ''cũng'':645,922,1597,1680,3399,3918,4648,5369 ''cơ'':3711 ''cạnh'':674,1589,1818,2044,2342,3221,3902,4194,4368,4669,5497 ''cả'':432,2017,3745,4833,5430,5492 ''cải'':647,2620,2791,3046,3275,3334,4422 ''cảm'':1027,1088,1167,1187,1336,1512,2194,2348,2693,2713,3116,3154,3233,5174,5243 ''cảnh'':950,1143,1432,1493,2703,4094,5099 ''cấp'':483,607,732,1019,1211,1328,1442,1684,1994,3115,3189,3288,3838,4747,4851,4967,5247 ''cấu'':135 ''cầm'':2197,2351,5177 ''cần'':345,781,2866 ''cầu'':84,1730,1768,1854,5568 ''cận'':949,4961,5098 ''cập'':17,1888,1912 ''cổng'':3827 ''cụ'':1869,3148,4748 ''củ'':3874 ''của'':57,200,265,589,1020,1174,1206,1677,1715,1771,2422,3395,3558,3773,4286,4613,4732,5135,5250,5392,5528,5555 ''cứng'':1567,2189,2245,2274,2839 ''cự'':3162 ''d'':78,704,938,1021,1207,1231,1319,1412,1466,1609,1634,1698,1774,1914,1929,1941,2092,2225,2358,2441,2612,2615,2662,2851,2877,2928,3070,3413,3431,3506,3511,3587,3627,3679,3709,3775,3811,3872,3908,3960,4003,4017,4031,4205,4208,4250,4276,4303,4390,4439,4562,4574,4716,4835,4847,4958,4962,5076,5402,5408,5426,5433,5453 ''deep'':1151,1160,2748 ''di'':2389,5520 ''diễn'':1502,4799 ''diện'':610,4350,4701 ''do'':249,2876 ''dolby'':2985,3168,3363,3372 ''dung'':65,206,301,420,1777,1810,1880,1950,2609,2817,3487,3892,4090,5080,5460 ''duy'':1961,2009,2078,2427,3738,3984,5293,5395,5559 ''duyệt'':841 ''dương'':1176 ''dưới'':2497,2539,3748 ''dạng'':1456,1739 ''dải'':3349 ''dấu'':5190 ''dẫn'':53,5160 ''dễ'':77,937,1230,1913,2614,2661,4207,4846,4957 ''dụng'':427,436,881,1491,1534,1614,1646,1732,1797,1822,1844,1938,2161,2311,2444,3153,3485,3503,3607,3770,3801,3826,4198,4279,4451,4831,5088,5404,5429,5491,5570 ''dừng'':1621 ''dữ'':1833,1889,4145,4319,4398,4405 ''edit'':1649 ''engine'':2742,3383 ''esim'':4189 ''f/1.78'':2803 ''face'':4309,4341,4400 ''fi'':4111,4135,4153,4185 ''fps'':1963,2080,5359 ''fusion'':2749 ''g'':395,744,772,815,849,887,915,1195,1368,2340,3316,3329,4360,4476,4687,4892,4935,4973,4989,5011,5110 ''gam'':1072,1180,1250,1401 ''game'':1585,1653,1960,2022,2110,2521,3562,3673,3689,4180,5271,5331,5449 ''genshin'':2025 ''ghi'':2659,2678,2977,3608,3615 ''ghz'':4162 ''gi'':7,40,54,71,88,119,140,162,167,196,219,229,272,291,360,363,404,448,459,492,516,537,540,588,652,706,787,906,923,1009,1082,1089,1188,1216,1399,1513,1548,1598,1688,1829,1903,2000,2055,2105,2137,2195,2292,2321,2349,2405,2490,2580,2657,2691,2750,2883,2943,3132,3239,3498,3924,3952,4140,4202,4238,4387,4798,4840,4854,4951,5008,5025,5048,5073,5175,5244,5319,5370 ''gia'':268,4686 ''gian'':1612,1806,1841,2091,2440,4275,4573,5407 ''giả'':3715 ''giải'':2550,3637 ''giảm'':905,2057,2789,3993,5007,5383 ''giản'':1259 ''giật'':2101,2120 ''giới'':1947 ''giờ'':3543,3548,3634,3697,3707,5483 ''giữ'':2272,2753,3572,4425 ''giữa'':236,405,1105,1249,1642,2130,2394,2837,3522,4212,5315 ''gpu'':1995,5318,5345 ''gu'':1280 ''gần'':506,1973,3885 ''gặp'':1946,4661 ''gọn'':323,3089,5201 ''gồm'':877,1757,5141 ''gợi'':4092 ''h'':34,75,91,104,136,312,343,348,375,388,484,552,564,577,624,685,727,778,808,867,894,912,918,951,976,1033,1092,1164,1246,1266,1268,1364,1420,1422,1481,1670,1703,1787,2012,2086,2152,2167,2430,2447,2469,2530,2562,2679,2683,2947,3021,3124,3283,3391,4069,4473,4485,4505,4511,4543,4547,4570,4581,4585,4594,4598,4631,4635,4673,4690,4739,4758,4844,4899,4912,4955,4993,5014,5021,5044,5078,5089,5100,5197 ''hai'':131,406,433,598,3723 ''hao'':3762,4271,5477 ''hay'':246,1494,2027,2522,4418 ''hdr'':2610,5486 ''hdr10'':2579 ''hiển'':2492,2532,5213 ''hiện'':111,707,763,1260,1279,1315,1414,1434,1546,2097,2207,2588,2688,3782,4305,5302,5303 ''hiệu'':612,676,1445,1551,1605,1623,1659,1711,1971,2030,3462,3740,3814,3929,3955,3994,4034,5057,5252,5295,5390 ''ho'':1031,1040,2181,2336 ''hoạt'':775,852,1766,2063,3919,4098,4944,5472 ''hoặc'':737,914,1651,2388,3563,4013,4178,4253,5018 ''huy'':4334 ''huyền'':1172 ''hãng'':6 ''hơi'':2050,5284 ''hơn'':139,355,494,634,671,710,940,1524,1528,1554,1582,1836,2122,2269,2298,2356,2825,2951,3147,3245,3352,3401,3460,3490,3545,3589,3848,3923,4075,4148,4248,4357,4394,4408,4702,5382 ''hướng'':308,337,5159 ''hưởng'':1637,4566,4997 ''hạn'':1948,2302,2954,3760,3991,4267,4592,5186 ''hạng'':3255 ''hấp'':52 ''hậu'':4500 ''hằng'':2312 ''hệ'':442,600,635,1921,2046,2283,2717,3193,3273,3322,3408,3577,3966,3973,4233,4344,4518,4642,5280,5386,5522 ''họa'':1575,2008,2146,5356 ''học'':1692,2892,2917,2963,3206,3309,3355 ''hỏi'':1693 ''hồi'':1708 ''hỗ'':50,864,2480,2819,2987,3009,3164,3209,3343,3357,3368,3948,4106,4157,4522,4622,4649,4764,4886 ''hỗn'':5441 ''hộp'':5094,5118,5140,5162 ''hợp'':1104,1408,2129,2223,2393,2518,2744,2836,3492,4057,4229,5313,5442 ''hụt'':3763 ''hứng'':1028,1168,1337 ''hữu'':927,2256,2712,4816 ''i'':43,758,804,816,828,833,847,900,916,1267,1359,1421,1471,1610,1664,1695,1924,1942,2093,2155,2233,2355,2383,2442,2545,2587,2777,2971,3019,3507,3512,3588,3597,3940,4032,4277,4456,4502,4575,4645,4688,4782,4879,4906,4940,4977,4981,5002,5012,5066,5157,5221,5400,5409,5434 ''icloud'':1902 ''id'':4310,4342,4401 ''impact'':2026 ''inch'':2453,2479 ''intelligence'':4039,4061,5368 ''ios'':2135,3752,4325,4370,5529 ''ip'':712 ''iphone'':1,8,23,85,99,171,180,188,214,273,277,282,333,369,381,460,476,502,546,558,571,594,641,734,740,754,928,942,956,981,985,995,1144,1153,1286,1293,1447,1457,1529,1625,1745,1858,1966,2073,2169,2177,2251,2364,2461,2583,2630,2641,2708,2804,2904,3051,3093,3101,3109,3129,3198,3223,3257,3260,3396,3427,3439,3443,3452,3530,3551,3620,3675,3781,3820,3853,3942,3970,4045,4048,4124,4222,4327,4467,4480,4555,4677,4718,4719,4837,4855,4868,4880,4985,5028,5037,5095,5106,5261,5416,5419 ''k'':44,413,902,1607,2400,2475,2720,2911,3294,3312,3504,4115,4190,4200,4493,5004,5183 ''keychain'':4415 ''kh'':73,250,310,341,401,408,473,725,776,806,873,1058,1242,1283,1460,1618,1800,1804,1848,1944,1990,2094,2289,2864,3001,3104,3107,3421,3446,3450,3456,3809,3906,3932,3958,4015,4477,4509,4534,4596,4626,4671,4737,4756,4842,4859,4876,4910,4953,4969,4991,5223,5299,5455 ''khai'':767 ''khi'':332,853,1583,2034,2062,2357,2519,2606,2813,2952,3026,3196,3424,3560,3602,3708,3746,3764,3871,3880,3996,4175,4249,4395,4513,4552,4750,4790,4983,5116,5269 ''khiết'':1343 ''khoảng'':120,295,495,793,2935,3546,3867,5478 ''khoảnh'':2665 ''khu'':239 ''khung'':2011,2085,2238,2257,2315,2395,2682 ''khuyến'':4683 ''khả'':614,1478,1570,1666,1882,1957,2003,2141,2727,2886,3174,3387,3478,4282,4347,5211,5504 ''khẩu'':256,2801 ''khắc'':2666 ''khẳng'':1127,1270 ''khởi'':220 ''kim'':1332,1340 ''kiến'':1591,5342 ''kiểm'':3975,4377,4619 ''kiểu'':1411 ''kiệm'':691,1526,1603,3496,4742 ''kiện'':908,1238,2159,2602,2828,3250,3799,5010 ''kế'':1116,1257,1326,2053,2163,2371,5053,5121,5228 ''kết'':1103,1407,2067,2128,2392,2743,3491,3795,4117,4131,4259,4284,5265 ''kể'':651,1687,2279,2960,3404,3472 ''kỹ'':4624 ''l'':316,353,366,479,543,716,832,1007,1052,1198,1222,1346,1382,1496,1573,1669,1866,1870,1874,1939,2006,2065,2144,2360,2385,2846,2874,2875,3123,3271,3282,3390,3539,3635,3651,3720,3757,3998,4029,4051,4766,4852,4878,4939,5274,5314,5373,5525 ''lag'':2102,2121 ''lao'':3638 ''li'':19,3566,3685,3698 ''linh'':774,851,1765,4943 ''liền'':1515,1640,2116,4299 ''liệu'':1834,1890,2188,2237,2286,2424,4146,4320,4399,4406,5158 ''lo'':1802,4972 ''loại'':1341 ''lưu'':1769,1785,1812,1824,1884,1906,1952,3766,4447 ''lướt'':3690,5451 ''lượng'':66,207,302,421,425,693,1595,1778,1811,1951,2671,2861,2899,2995,3080,3475,3488,3501,3517,3535,3585,3605,3759,3768,3794,3893,3928,4266,5061,5312,5412,5461,5527,5553 ''lại'':1078,1186,1263,1356,2054,2512,2660,2808,3028,3614,3650,3704,4166,4296 ''lấy'':1026,1166,1335,2821 ''lần'':1098 ''lập'':3601 ''lắc'':2957 ''lắp'':3624 ''lệch'':146,234,294,471,4813 ''lịch'':1226,1361,1425 ''lỗi'':4662 ''lớn'':350,1779,2725,4909 ''lợi'':326,4218,5514 ''lựa'':81,717,1308 ''m'':45,198,340,346,416,453,622,633,662,789,855,903,947,961,988,998,1016,1073,1147,1156,1181,1199,1212,1251,1289,1297,1383,1402,1474,1484,1716,1799,1875,1936,1943,2060,2149,2154,2165,2219,2240,2259,2294,2299,2317,2327,2333,2354,2382,2386,2397,2445,2467,2516,2528,2556,2589,2626,2758,2766,2770,2784,2863,2973,3059,3060,3150,3336,3464,3482,3594,3596,3636,3659,3736,3793,3931,4010,4022,4087,4120,4287,4446,4455,4494,4501,4515,4579,4610,4659,4752,4858,4928,4931,4968,5005,5144,5189,5195,5220,5291,5298,5358,5499,5549 ''magsafe'':3813,3897,3910 ''manager'':4417 ''mang'':628,1005,1077,1119,1185,1262,1306,1355,1416,1510,1568,1748,2192,2511,2807,2992,4062,4165,4295,4751,5209,5236,5351 ''max'':280,288,336,384 ''minh'':1982,2849,4042,4074,4294,4507,4804,5381 ''mmwave'':4164 ''mobile'':2029 ''mode'':3039,3042,3376 ''model'':205,305,407,640,3050,3780,3881,4052,4817 ''mua'':854,911,4466,4479,4514,4541,4553,4675,4791,4867,4984,5020 ''muốn'':729 ''mượt'':452,632,1483,2515,3058,4119,5332,5357 ''mạch'':1516,1641,2117,4300 ''mại'':1334,2346 ''mạng'':4169,4216 ''mạnh'':1094,1228,1523,1984,2501,2543,2840,3459,4336 ''mất'':3884,4628 ''mấy'':946 ''mẫu'':480,3593 ''mật'':4308,4339 ''mắt'':1101,1305 ''mặt'':2263,2399,5182,5324 ''mẽ'':1095,1229,2841 ''mềm'':1333,2345,2844 ''mỉ'':2185 ''mọi'':1141,1367,1430,1728,1917,2157,2600,2681,2701,4077,4715 ''một'':3084,5482 ''mới'':595,642,1010,1596,1656,1679,1999,2221,2437,2718,3218,3274,3323,3435,3494,3917,4139,4321,4345,4652,4710,4731,4786,4818,5285 ''mờ'':5185 ''mở'':920,1489,1842,2644,4692,5016,5117,5161 ''mục'':3256 ''mức'':39,228,290,491,705,1720,3203,3610,3849,3938,3986,4763,5363 ''mỹ'':242,1282,5240 ''n'':20,30,56,69,115,127,133,142,155,160,263,320,347,357,362,367,418,446,489,490,518,522,534,539,544,592,605,609,623,639,643,666,670,673,722,730,757,801,811,872,880,893,931,935,936,1008,1034,1041,1046,1053,1075,1113,1183,1202,1223,1345,1347,1350,1371,1381,1389,1476,1542,1577,1588,1629,1675,1682,1734,1790,1817,1857,1861,1865,1909,1934,1978,1989,1998,2043,2112,2113,2166,2182,2287,2301,2337,2368,2446,2468,2495,2529,2537,2549,2555,2559,2568,2593,2639,2651,2747,2763,2774,2812,2816,2822,2901,2968,2976,2999,3008,3030,3049,3053,3075,3076,3113,3121,3142,3187,3220,3226,3230,3269,3286,3386,3466,3540,3567,3613,3649,3667,3686,3699,3703,3721,3778,3784,3819,3836,3852,3901,3913,3915,3935,3969,3989,4008,4021,4044,4068,4193,4226,4324,4367,4384,4428,4435,4444,4488,4615,4641,4668,4681,4700,4745,4767,4828,4849,4853,4865,4898,4949,5070,5104,5138,5143,5164,5192,5196,5216,5231,5258,5309,5329,5348,5496,5502,5519,5534 ''nam'':95,110,165 ''nay'':1025 ''neural'':3382 ''ng'':35,76,79,92,105,313,344,376,389,409,429,474,485,529,553,565,578,606,621,650,720,728,731,779,809,822,844,860,892,895,913,939,1022,1032,1111,1133,1208,1232,1241,1276,1320,1378,1410,1413,1461,1467,1506,1518,1616,1619,1635,1683,1686,1699,1775,1788,1801,1805,1849,1868,1877,1894,1915,1930,1945,2095,2124,2218,2226,2261,2278,2290,2313,2330,2359,2412,2484,2500,2503,2542,2574,2605,2613,2616,2624,2634,2663,2707,2731,2735,2739,2768,2795,2831,2848,2852,2865,2878,2929,2940,2959,3002,3071,3097,3108,3114,3145,3184,3188,3214,3243,3253,3279,3287,3328,3403,3414,3432,3451,3457,3471,3509,3556,3628,3680,3710,3724,3776,3792,3810,3837,3840,3873,3891,3907,3933,3936,3959,4004,4016,4041,4073,4123,4206,4209,4251,4293,4304,4365,4382,4385,4391,4431,4440,4460,4463,4486,4512,4548,4551,4563,4586,4599,4627,4636,4639,4655,4674,4717,4740,4746,4759,4803,4821,4836,4845,4848,4850,4860,4877,4897,4900,4903,4913,4927,4956,4959,4963,4970,4994,5022,5077,5083,5090,5091,5171,5203,5206,5300,5380,5427,5431,5456,5458,5493 ''ngay'':984,1096,2016,2653,3744,4819,4933,5114 ''ngh'':1789 ''nghe'':3630 ''nghiệm'':399,451,631,1080,1639,2070,2108,2647,3592,3731,4065,4168,4298,4530,5032,5086,5290,5354,5467 ''nghiệp'':447,1735,2640,2652,3000 ''nghệ'':1519,2575,2635,2740,2941,3215 ''nghị'':4684 ''nghịch'':2702 ''ngo'':803,1358,1470,1663,2232,2544,2776,2970,3939,4644,4980 ''người'':317,1318,1465,1633,1697,1773,1873,1928,2224,2611,2850,2927,3069,3412,3774,4002,4204,4302,4389,4438,4561,5075,5425,5516 ''ngưỡng'':5326 ''ngắn'':1839 ''ngữ'':4093 ''nh'':33,49,90,103,137,145,233,259,271,293,339,349,374,387,470,551,563,576,586,625,686,770,830,868,919,952,964,977,1030,1068,1137,1239,1302,1331,1339,1370,1376,1406,1482,1545,1671,1856,1898,1997,2013,2083,2099,2153,2168,2239,2258,2309,2316,2396,2401,2411,2419,2431,2448,2470,2498,2531,2540,2563,2603,2680,2684,2698,2829,2873,2882,2912,2948,3022,3064,3092,3125,3157,3251,3265,3284,3295,3313,3385,3392,3515,4067,4103,4215,4245,4315,4354,4363,4375,4412,4434,4474,4484,4497,4506,4526,4544,4546,4571,4582,4584,4595,4632,4634,4664,4691,4704,4727,4776,4796,4812,4825,4890,4908,4946,4974,4979,5015,5024,5045,5047,5079,5101,5128,5184,5198,5238,5347,5376,5545 ''nh/gi'':2087 ''nhanh'':587,842,1504,1835,2824,3400,3481,3670,3803,3843,3895,4012,4100,4121,4290,4351,4402,4801,5507 ''nhau'':875,1244,3448,5225 ''nhi'':12,669,751,1380,2762,2811 ''nhiếp'':2636,2648,2888 ''nhiều'':46,472,866,941,1236,1750,2869,3106,3449,4359,4495,4896,5219 ''nhiễu'':2790,3339 ''nhiệm'':3883 ''nhiệt'':617,2049,2058,3573,3580,3978,5256,5283,5306,5321,5334 ''nhu'':83,1729,1767,1853,5567 ''như'':241,531,904,1648,2024,4414,5006,5443 ''nhưng'':2270,3834,5463 ''nhạc'':3631 ''nhấn'':1063 ''nhất'':4322 ''nhận'':2617,3417,3609,3726,4349,4762,4930 ''nhập'':255 ''nhật'':18,247 ''nhắc'':723 ''nhắn'':4085 ''nhằm'':3983 ''nhẹ'':235,2244,2268,2377,2410 ''nhỏ'':322,3088,4922 ''nhớ'':158,304,1454,1737,1755 ''nhờ'':626,696,1709,1881,1926,2416,2833,3067,3377,3410,3576,3856,4000,4280,4436,5226,5279,5337,5388,5550 ''những'':2664,2857,3077,4834 ''ni'':197 ''nits'':2455,2489 ''năm'':487,1024 ''năng'':315,613,615,692,1446,1479,1571,1594,1624,1660,1667,1712,1883,1899,1958,1972,2004,2142,2728,2887,3175,3388,3463,3479,3758,3927,3995,4265,4283,4316,4348,4376,4413,5058,5212,5253,5296,5311,5391,5505,5526 ''nạp'':3862 ''nắm'':2198,2352,5178 ''nằm'':4723 ''nặng'':1500,1647,1798,2023,3674,4975,5278 ''nếu'':4658 ''nền'':4058,5378 ''nối'':3796,4118,4132,4260,4285 ''nổi'':1138,1200,1233,1384,1427 ''nội'':1879,2608,4089 ''o'':527,1608,3337,3505 ''oled'':2474 ''optical'':2921,3178,3300,3346 ''optical-quality'':2920,3177,3299,3345 ''orange'':994,1004 ''p'':72,449,653,745,773,850,888,924,1196,1217,1549,1599,1632,1689,1726,1763,1784,1830,1904,2001,2056,2106,2138,2191,2247,2276,2293,2322,2406,2491,2581,2658,2751,2926,2944,3017,3133,3240,3499,3925,3953,4116,4141,4191,4201,4203,4239,4388,4736,4830,4841,4893,4936,4952,4990,5074,5147,5320,5371,5424,5564 ''password'':4416 ''ph'':29,114,262,1631,1783,1815,1988,2222,2517,2548,2925,3016,3536,3869,3887,4332,4487,4629,4735,4744,4924,5308,5423,5511 ''phi'':68,126,132,154,159,521,591,800,930,1860,3225,3914 ''phim'':3695 ''phiếu'':910,5019 ''phong'':1129,1272,1435,1814,2209 ''photonic'':2741 ''phải'':4861,4971 ''phản'':1374,1707,2597,2799 ''phần'':1197,1566,2838,2843,4810 ''phẩm'':359,536,4538,4965,5234 ''phối'':31,116,264,2835,4489 ''phụ'':907,5009 ''phục'':1464,1851 ''phức'':4464 ''pin'':352,422,1527,1604,1662,3436,3476,3486,3518,3586,3611,3747,3864,4028,4272,5062,5413,5462,5487,5541,5554 ''pixel'':2553 ''private'':4419 ''pro'':3,10,26,87,101,173,182,190,202,217,275,279,284,287,307,335,371,383,440,462,465,468,478,504,513,548,560,573,603,699,714,736,739,742,762,933,944,955,958,983,987,997,1023,1146,1155,1209,1288,1295,1449,1452,1459,1522,1532,1537,1560,1627,1747,1863,1968,2075,2133,2171,2179,2254,2366,2463,2585,2632,2643,2710,2806,2879,2906,3006,3033,3095,3103,3111,3131,3200,3228,3259,3262,3292,3380,3398,3429,3434,3441,3445,3455,3524,3527,3532,3553,3623,3678,3822,3855,3944,3972,4047,4050,4126,4224,4329,4469,4482,4558,4679,4722,4857,4882,4987,5030,5040,5097,5109,5260,5263,5340,5350,5418,5421 ''pubg'':2028,3640,3662 ''qi'':3964 ''qi2'':3951 ''qu'':2307,2458,2508,3937,5305,5543 ''qua'':823,891,2438,5547 ''quality'':2922,3179,3301,3347 ''quan'':3617,3729 ''quang'':2891,2916,2962,3205,3308,3354 ''quay'':2895,2965,2982,3011,3166,3361,3564,3694,5446 ''quen'':1696 ''quy'':4794 ''quyền'':4380,4612 ''quyện'':1248 ''quả'':1606,2068,3815,3930,5266 ''quản'':3756,5372,5524 ''quốc'':97,168,211,267 ''r'':694,1837,2208,2494,2622,2623,2769,2900,2931,3419,5081,5082,5215 ''ra'':805,1304,1503,1665,2546,2645,2778,2856,2972,3941,4646,4800,4982 ''ray'':1564 ''relay'':4420 ''retina'':2450,2472 ''review'':5410 ''ri'':1132,1275,4381 ''rung'':2956 ''rằng'':3717 ''rệt'':695 ''rộng'':921,3320,3333,3351,4693,5017 ''rỡ'':1036,1109,2535 ''rực'':1035,1108,2534 ''s'':260,270,585,620,1177,1240,1377,1396,1876,2483,2499,2541,2604,2706,2730,2767,2794,2830,3091,3144,3242,3252,3278,3327,3514,3618,3791,4364,4498,4705,4826,4947,5205 ''sang'':1122,1190,1254,1310,1443,1472,2172,2212,2414,2433,3430,5122 ''sao'':1905 ''sau'':532,3655,3705,4540,4875,5481 ''series'':756 ''sforum'':3733 ''shield'':2242,2266,2319,2403 ''si'':3318,3331 ''silver'':1292,1300 ''sim'':3625,4114,4199 ''sinh'':1084,1922 ''smartphone'':481,1992 ''so'':269,500,510,584,596,1557,2280,3090,3127,3190,3289,3405,3513,3549,3962,3976,4149,4378 ''soạn'':4083 ''spatial'':3013,3216,3370 ''sub'':4160 ''sung'':3947,4373 ''super'':2449,2471 ''suất'':677,834,1552,2031,3741,3841,3956,4035,4941 ''suốt'':3508,4590 ''sạc'':3438,3480,3802,3808,3842,3875,3894,3905,3957,3997,4011,4014,5506,5546 ''sản'':358,535,1539,4537,4665,4964,5233 ''sắc'':664,1037,1045,1106,1170,1329,1372,2536,2567,2591,2628,2760,2772,2967,3062 ''sắm'':4554 ''sẻ'':4255,4397 ''sẽ'':143,4520,4564,5072 ''số'':2457,2507,3098,3185,3360 ''sống'':2571,2689 ''sở'':926,2255,2711,4815 ''sức'':1363,1983 ''sử'':426,435,1533,1613,1731,1821,1937,2160,2310,2443,3152,3484,3502,3606,3769,3800,3825,4197,4278,4450,5087,5403,5428,5490,5569 ''sửa'':2868 ''sự'':321,400,1102,1245,2391,2619,2834,3420 ''t'':62,299,329,356,533,798,825,827,840,879,1047,1051,1067,1093,1114,1136,1165,1203,1221,1344,1351,1365,1390,1405,1487,1497,1751,1807,1838,1897,1935,2098,2119,2217,2418,2459,2496,2509,2538,2569,2586,2823,2902,2969,3018,3537,3619,3682,3713,3870,3888,3977,4009,4055,4078,4086,4227,4314,4333,4374,4379,4411,4445,4525,4578,4609,4772,4775,4905,4976,5156,5217,5237,5275,5438,5512 ''tay'':2200,2656,5105,5165,5193 ''tele'':2913 ''telephoto'':3238,3296 ''test'':3519,3603,5067 ''tetraprism'':2942,3297,3305 ''th'':528,821,1323,1694,1892,1923,2229,2847,3096,3183,3658,3877,4040,4072,4292,4430,4550,4638,4926,5142,5379,5399 ''tham'':4685 ''thanh'':870,1225,1360,1424 ''thao'':328,1486 ''thay'':60,3787 ''theo'':64,82,203,3554,3789,4774,4925 ''thiết'':58,682,1070,1115,1218,1256,1325,1600,1690,1780,1918,2052,2162,2204,2370,2407,2425,3569,3858,4095,4155,4242,4452,4603,4778,5052,5120,5227,5393,5470,5556 ''thiếu'':1803,2705,3277 ''thiện'':1042,2183,2338,2621,2792,3047,3276,3335 ''thoại'':980,2363,3087,5027 ''thoải'':2353 ''thu'':364,541,2729,3326,4707,4728,4783,5200 ''thuật'':1673,2745,3119,3267,4625 ''thuế'':254 ''thước'':415,2477,2722 ''thường'':2668,4019,5517 ''thượng'':1056,1125,1439 ''thấp'':4174 ''thấy'':681,2072,2618,3418,3735,5469 ''thẩm'':1281,5239 ''thẳm'':1179 ''thẻ'':878 ''thế'':599,703,2282,2716,3192,3272,3321,3407,3965,4232,4335,4343 ''thể'':231,813,1265,1278,1419,1433,1714,1932,2077,2206,2687,2854,3073,3149,3342,3416,3719,3861,4006,4442,4601,4749,4761,4808,4915 ''thị'':107,209,1081,1398,2493,2533,5214 ''thọ'':4027,5540 ''thống'':443,636,2047,3578,3974,4519,4643,5281,5387,5523 ''thời'':424,1055,1124,1438,1611,1840,2090,2439,3474,3500,3516,3534,3584,3604,3751,3767,4274,4572,4591,5060,5366,5406,5411,5552 ''thủ'':837 ''thức'':869,965,1303,2432 ''thử'':2069,3591,5289,5466 ''thực'':678,1578,2594,3520,3771,5033,5068,5168,5414,5464,5572 ''ti'':319,3160,4269 ''tin'':4084,4432 ''tinh'':1048,1117,1193,1312,1342,1352,1391,2234,3582,3981,5131,5229 ''tiến'':648,1543,4423,5043,5374 ''tiếp'':890,3043,3823,4330,4960 ''tiết'':515,660,690,975,1525,1581,1602,2566,2755,2933,3139,3495,4741,5050,5167 ''tiềm'':314 ''tiền'':14,753,3882 ''tiện'':325,4217,5513 ''to'':608,871,1050,1220,1674,1908,2746,3120,3268,3818,3988,4427,4640,4699,4864,5151,5328 ''tone'':2577 ''tr'':48,638,769,1541,1544,1592,1962,1977,2010,2079,2308,2428,2554,3029,3048,3739,3777,3851,3912,3968,3985,4043,4323,4726,4795,4889,5103,5127,5163,5257,5294,5343,5375,5396,5544,5560 ''tra'':4620 ''tracing'':1565 ''trang'':1562,2465,2908,4128 ''triển'':766 ''triệu'':123,150,297,498,508,796,1976,2038,4713,4770,4789 ''trong'':117,327,331,1014,1140,1235,1366,1429,1615,1756,1920,1987,2018,2089,2156,2306,2381,2599,2654,2826,3195,3248,3590,3633,3866,3879,4076,4273,4358,4454,4589,4653,4724,5139,5286,5325,5405,5509,5542,5571 ''true'':2576 ''trung'':1404,2081,4577,4608 ''truy'':1831,1887,1911 ''truyền'':3926,4144 ''trưng'':1205,5134,5249 ''trước'':601,749,783,818,2264,2284,3194,3409,4871,4918 ''trường'':108,210,2384,3598,4457,5222 ''trạng'':2100,4777,5398 ''trả'':743,748,771,782,817,848,886,4863,4870,4874,4891,4917,4934,4988 ''trải'':398,450,630,1079,1638,2107,2646,3730,4064,4167,4297,4529,5031,5085,5353 ''trầm'':1253 ''trầy'':2249,2304 ''trận'':3661 ''trễ'':4173 ''trị'':788 ''trọn'':4531 ''trọng'':1123,1191,1311,1444,1473,2173,2213,2415,2434,5123 ''trội'':1986,2733,5208 ''trở'':934,2111 ''trợ'':51,865,2481,2820,2988,3010,3165,3210,3344,3358,3369,3949,4107,4158,4523,4623,4650,4765,4887 ''trụ'':968,992,1002 ''trữ'':1770,1786,1813,1825,1885,1953,4448 ''trực'':889,4181,4458 ''tuyến'':4182,4459 ''tuổi'':4026,5539 ''ty'':4904 ''tăng'':1550,2002,2323,3954 ''tư'':4383 ''tương'':457,791,2596,2798,3876 ''tưởng'':1871 ''tượng'':1013,2673,5113,5304 ''tại'':15,36,93,106,163,524,708,746,857,3528,3732,4470,4490,4517,4559,4576,4792,4883,5035 ''tạo'':1061,1087,1394,1878,2347,2855,3020,3074,5242 ''tạp'':4465 ''tải'':1846,5384 ''tản'':616,2048,3579,5255,5282,5333 ''tảng'':4059 ''tầm'':118,2655 ''tần'':2456,2506 ''tận'':1636,4524 ''tắt'':4088 ''tặng'':909 ''tế'':98,169,212,679,1049,1194,1313,1392,2235,3521,3772,5034,5069,5132,5169,5230,5415,5465,5573 ''tệp'':1847 ''tỉ'':2184 ''tốc'':1705,1826,2525,2989,3831,4142 ''tối'':700,1258,1657,1701,2139,2485,2786,3231,3324,3468,3754,3844,4263 ''tốt'':2756,2950,3146,3244,4407,5401,5566 ''tổng'':1264,1418,1713,3341 ''tới'':1555,2677,3181,3303,3366,3541,3722,4787 ''tục'':21,838,3044,3568,3687,3700,3824,4331 ''tụt'':3669 ''tức'':1891 ''từ'':147,222,412,419,733,784,1029,1097,1169,1338,1740,1916,2186,2674,3426,3641,4081,4533,4663,5051,5115 ''từng'':153,204,266,520,1348,1485,1772 ''tử'':884 ''tự'':458,668,1379,2761,2810,5531 ''tựa'':2021 ''u'':13,244,245,354,663,752,948,962,989,999,1017,1074,1148,1157,1178,1182,1213,1252,1290,1298,1322,1397,1403,1940,2066,2220,2228,2361,2590,2627,2692,2759,2771,3061,3161,3319,3332,3999,4030,4270,4535 ''ultra'':3235,3314 ''usb'':3805,3829,5149,5153 ''usb-c'':3804,3828,5148,5152 ''usd'':179,187,195,224 ''uwb'':4231 ''v'':67,96,257,276,285,324,351,423,441,454,466,505,526,618,655,689,702,760,836,882,885,971,1057,1086,1126,1192,1227,1255,1277,1314,1354,1393,1426,1440,1507,1579,1661,1724,1760,1795,1845,1886,1910,2118,2134,2164,2174,2201,2378,2398,2435,2570,2578,2757,2796,2818,2842,2894,2918,3040,3100,3118,3140,3173,3237,3338,3381,3437,3477,3671,3797,3807,3816,3990,4033,4071,4101,4113,4163,4188,4235,4311,4352,4449,4503,4621,4806,4901,5059,5124,5155,5181,5191,5254,5272,5317,5341,5450 ''v10'':1956,1980,2041 ''va'':2375 ''video'':656,1650,1793,2524,2896,2983,3012,3014,3078,3167,3217,3362,3371,3538,3693,4177,5447 ''vision'':2986,3032,3169,3364,3373 ''viền'':5194 ''việc'':925,1561,1820,2127,2387,4082,4196,5307 ''việt'':94,109,164 ''vn/a'':566,579 ''vs'':463,3442,3525 ''vũ'':967,991,1001 ''vượt'':1985,2700,2732,5207 ''vẫn'':715,2271,3571,4023,4929,4995 ''vận'':684,1480,2151 ''vật'':2285,2423 ''vậy'':1710,1927,3004,3411,4001,4281,4437,5389,5551 ''vẹn'':4532 ''vẻ'':1054,1121,1224,1357,1469,2231 ''về'':253,611,1949,2625,2885,3461,3473,4337,5084 ''vệ'':4318,4404,4698,5538 ''vị'':4241 ''với'':38,430,501,511,597,831,861,1043,1558,1776,1895,2125,2214,2262,2281,2331,2339,2504,2669,2719,2736,2800,2979,3083,3128,3159,3191,3290,3406,3550,3963,4150,4340,4822,4895,5119,5172,5435 ''vụ'':1499,1852,3684,4080,5277,5440 ''vừa'':2409,2413,4289,4291,5235,5241 ''vực'':240 ''web'':3691,5452 ''wi'':4110,4134,4152,4184 ''wi-fi'':4109,4133,4151,4183 ''wide'':3236,3315 ''x'':839,2694,3065,4104,4246,4355 ''xa'':2938 ''xanh'':969,1149,1158,1171,1214 ''xdr'':2451,2473 ''xem'':973,2523,2607,3027,3692,4176,5484 ''xuy'':4020,5518 ''xuất'':1540,1832,2096,4666,5301 ''xước'':2250,2305 ''xảo'':1118,1353 ''xử'':1495,1572,1668,2005,2143,2845,3122,3270,3281,3389,5273 ''y'':63,300,644,790,799,856,1076,1184,1321,1617,1717,1752,1808,1933,2061,2088,2150,2227,2288,2295,2314,2328,2334,2557,2871,2974,3054,3151,3483,3510,3595,3725,3737,3785,3812,3909,3961,4007,4018,4288,4443,4461,4516,4616,4656,4660,4753,4773,4829,4932,4950,5071,5092,5111,5130,5145,5232,5292,5432,5494,5500 ''youtube'':3632,5485 ''yết'':199 ''yếu'':2832,3254 ''zoom'':2890,2953,2961,3180,3204,3302,3307,3340,3350,3353,3359 ''~10'':3696 ''~20'':3647,3664,3701 ''đ'':42,176,185,193,378,380,391,393,431,555,557,568,570,581,583,627,649,675,719,846,862,899,1590,1685,1725,1762,1819,1896,2045,2104,2126,2277,2332,2505,2737,2765,2783,2870,2881,2958,3068,3197,3222,3402,3470,3656,3857,3903,3945,4195,4369,4670,4781,4823,5001,5023,5046,5173,5498,5548,5563 ''đa'':1455,1738,2486,3681,3845 ''đang'':27,112 ''đem'':4602 ''đi'':901,4492,5003 ''điều'':1237,2103,2158,2601,2827,3249,3798 ''điểm'':221,1062,1970,2039,2723,2978 ''điện'':883,979,2362,2996,3086,3497,5026 ''đương'':792 ''đường'':1112,1349,1388 ''được'':28,113,604,646,764,1039,1538,1681,2051,2180,2335,2369,2374,2429,2464,2686,2785,2880,2907,3045,3112,3467,3581,3835,3980,4053,4127,4262,4421,4521,4565,4618,4682,4696,4885,4996,5041,5199,5558 ''đại'':1175,1261,1316,1415,1547,3783,4306 ''đạt'':1718,1969,2035,3136,3202 ''đảm'':2147,2560,4024,4527 ''đầu'':486,1099,4657 ''đầy'':1011,1134,1162,1362,3211,4998 ''đậm'':970,1064,1150,1159,1215 ''đập'':5093 ''đẳng'':1441 ''đặc'':1204,2417,3246,4219,5133,5248 ''đến'':309,338,411,629,1006,1120,1307,1417,1511,1569,1719,1742,1749,2193,2487,2993,3644,3663,4063,4091,4539,4605,4711,4755,4768,5056,5210,5352 ''đều'':434,1501,2685,4097,4261 ''để'':1700,2372,2788,3055,4424,4617,4695,4814,5536 ''định'':456,688,1128,1271,1509,1722,1965,2015,2033,2115,2946,3575,3727,3743,3899,3922,4037,4171,4240,4797,5268,5336,5361,5562 ''đối'':824 ''đồ'':1574,2007,2145,5355 ''đồng'':124,151,298,499,509,797,820,1900,3750,4771,4873,4920,4938,5365 ''đổi'':61,3788,4211,4651,4709,4730,4785 ''độ'':397,619,658,1044,1706,1827,2059,2273,2324,2436,2482,2526,2547,2595,2780,2793,2797,2802,2981,2990,3037,3137,3790,3832,3979,4143,4172,4362,4568,5204,5322 ''động'':1085,2064,2514,2572,2690,3057,3920,4099,4393,5473,5532 ''đời'':368,545,2667,4838 ''đủ'':3212,4999 ''ưu'':41,318,701,845,898,1658,1702,2140,2787,3232,3325,3469,3755,4264,4780,5000 ''ảnh'':654,953,978,1672,1792,2564,2637,2649,2676,2724,2752,2859,2889,2949,2997,3023,3126,3134,3285,3393,5102,5445 ''ấn'':1012,2672,5112 ''ết'':3600 ''ống'':2910,3293,3311 ''ổn'':455,687,1508,1721,1964,2014,2032,2114,2945,3574,3742,3898,3921,4036,4170,5267,5335,5360,5561 ''ở'':130,152,208,394,519,1622,2934,3171,5218,5362,5397 ''ủy'':4611 ''ứng'':1490,1645,1727,1764,1796,1843,5565'),
  (164, 'iPad Pro M4 13 inch Wifi 256GB I Chính hãng Apple Việt Nam', 17, 7, '<h2 id="ipad-pro-m4-13-inch-wifi-256gb-cau-hinh-sieu-manh-me-thiet-ke-sieu-mong-sang-trong"><strong>iPad Pro M4 13 inch Wifi 256GB - Cấu h&igrave;nh si&ecirc;u mạnh mẽ, thiết kế si&ecirc;u mỏng, sang trọng</strong></h2>
<p><strong>iPad Pro M4 13 inch Wifi 256GB</strong>&nbsp;được xem l&agrave; điểm nhấn c&ocirc;ng nghệ xuất sắc của Apple trong nửa đầu năm 2024. Với thiết kế si&ecirc;u mỏng v&agrave; c&ocirc;ng nghệ m&agrave;n h&igrave;nh h&agrave;ng đầu, mẫu iPad Pro M4 2024 n&agrave;y đem tới trải nghiệm cầm nắm nhẹ nh&agrave;ng c&ugrave;ng chất lượng h&igrave;nh ảnh sắc n&eacute;t trong từng pixels. Trong phần dưới n&agrave;y của b&agrave;i viết, h&atilde;y c&ugrave;ng đ&aacute;nh gi&aacute; s&acirc;u hơn về sản phẩm&nbsp;<strong>iPad Pro M4 2024</strong>&nbsp;n&agrave;y th&ocirc;ng qua cấu h&igrave;nh mạnh mẽ, thiết kế sang trọng nh&eacute;!</p>
<h3 id="cung-cap-muc-hieu-nang-dinh-cao-voi-chip-manh-thong-so-bo-nho-khung"><strong>Cung cấp mức hiệu năng đỉnh cao với chip mạnh, th&ocirc;ng số bộ nhớ khủng</strong></h3>
<p>Chiếc&nbsp;iPad Pro M4 13 inch Wifi 256GB mới của Apple mang lại bước tiến đột ph&aacute; trong c&ocirc;ng nghệ với sự ra mắt của chip Apple M4. Theo đ&oacute;, d&ograve;ng chip n&agrave;y được thiết kế với tiến tr&igrave;nh 3 nm cung cấp khả năng xử l&yacute; dữ liệu cực kỳ nhanh ch&oacute;ng v&agrave; hiệu quả. Với sự hỗ trợ của chip M4 si&ecirc;u mạnh mẽ n&agrave;y, iPad Pro mới kh&ocirc;ng chỉ n&acirc;ng cao khả năng xử l&yacute; đồ họa m&agrave; c&ograve;n cải thiện đ&aacute;ng kể hiệu suất sử dụng năng lượng.&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/tablet/iPad/Pro/M4/ipad-pro-m4-13-inch-5.jpg" alt="Cấu h&igrave;nh iPad Pro M4 13 inch" loading="lazy"></p>
<p>(Nguồn ảnh: Apple)</p>
<p>B&ecirc;n cạnh đ&oacute;, iPad Pro 13 inch M4 c&ograve;n sở hữu c&aacute;c t&ugrave;y chọn bộ nhớ trong, với dung lượng l&ecirc;n đến 256GB, hỗ trợ lưu trữ một lượng lớn tập tin v&agrave; ứng dụng. Đồng thời, m&aacute;y cũng sẽ đi k&egrave;m với dung lượng RAM đạt 8GB, đảm bảo xử l&yacute; c&ocirc;ng việc, giải tr&iacute; đa nhiệm cực mượt m&agrave;.</p>
<h3 id="tao-hinh-sieu-mong-hien-thi-sieu-sac-net-voi-man-hinh-oled-xdr-cao-cap"><strong>Tạo h&igrave;nh si&ecirc;u mỏng, hiển thị si&ecirc;u sắc n&eacute;t với m&agrave;n h&igrave;nh OLED XDR cao cấp</strong></h3>
<p>M&aacute;y t&iacute;nh bảng&nbsp;<strong>iPad Pro M4 13 inch Wifi 256GB</strong>&nbsp;thể hiện sự tinh tế trong thiết kế với th&acirc;n m&aacute;y si&ecirc;u mỏng chỉ từ 5.1 mm v&agrave; sở hữu độ bền cao nhờ ho&agrave;n thiện ho&agrave;n to&agrave;n từ nh&ocirc;m t&aacute;i chế. K&egrave;m theo đ&oacute; l&agrave; m&agrave;n h&igrave;nh OLED Ultra Retina XDR độ ph&acirc;n giải cao c&ugrave;ng độ s&aacute;ng hiển thị l&ecirc;n đến 1600 nits. Nhờ vậy m&agrave; mọi trải nghiệm hiển thị của người d&ugrave;ng tr&ecirc;n d&ograve;ng iPad Pro n&agrave;y sẽ cực kỳ ch&acirc;n thực v&agrave; chi tiết sắc n&eacute;t.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/tablet/iPad/Pro/M4/ipad-pro-m4-13-inch-1.jpg" alt="Thiết kế iPad Pro M4 13 inch" loading="lazy"></p>
<p>(Nguồn ảnh: Apple)</p>
<h3 id="cong-ket-noi-cao-cap-va-co-ho-tro-apple-pencil-pro-magic-keyboard"><strong>Cổng kết nối cao cấp v&agrave; c&oacute; hỗ trợ Apple Pencil Pro, Magic Keyboard</strong></h3>
<p>iPad Pro M4 13 inch nổi bật với khả năng kết nối ngoại vi vượt trội với cổng USB-C hỗ trợ Thunderbolt 3 v&agrave; USB 4, cho tốc độ truyền dữ liệu đạt tới 40Gb/s. Kết nối kh&ocirc;ng d&acirc;y của thế hệ iPad Pro mới n&agrave;y cũng kh&ocirc;ng k&eacute;m phần ấn tượng với Wi-Fi 6E v&agrave; hỗ trợ 5G. Qua đ&oacute;, n&oacute; đảm bảo kết nối di động nhanh ch&oacute;ng, đảm bảo độ ổn định của đường truyền t&iacute;n hiệu kh&ocirc;ng d&acirc;y.&nbsp;</p>
<p>Ngo&agrave;i ra, iPad Pro M4 cũng sẽ tương th&iacute;ch tốt với Apple Pencil Pro v&agrave; Magic Keyboard, mang lại trải nghiệm nhập liệu v&agrave; điều khiển nhanh nhạy, chuẩn x&aacute;c.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/tablet/iPad/Pro/M4/ipad-pro-m4-13-inch-1.jpg" alt="Kết nối iPad Pro M4 13 inch" loading="lazy"></p>
<p>(Nguồn ảnh: Apple)</p>
<h3 id="quay-chup-tot-hon-voi-he-thong-may-anh-12mp-cao-cap"><strong>Quay chụp tốt hơn với hệ thống m&aacute;y ảnh 12MP cao cấp</strong></h3>
<p><strong>Tablet&nbsp;iPad Pro M4 13 inch Wifi 256GB</strong>&nbsp;khẳng định vị thế h&agrave;ng đầu về năng lực chụp ảnh v&agrave; quay video với camera trước 12MP được đặt ở cạnh viền, tối ưu cho gọi video. Camera sau của m&aacute;y cũng sở hữu độ r&otilde; n&eacute;t l&ecirc;n đến 12MP, hỗ trợ quay video ProRes v&agrave; Smart HDR 4, cải thiện đ&aacute;ng kể chất lượng h&igrave;nh ảnh trong mọi điều kiện &aacute;nh s&aacute;ng.&nbsp;</p>
<p>Đồng thời, iPad Pro n&agrave;y c&ograve;n hỗ trợ qu&eacute;t t&agrave;i liệu hiệu quả hơn nhờ được t&iacute;ch hợp đ&egrave;n flash TrueTone hiện đại. Điều n&agrave;y l&agrave;m cho iPad Pro M4 trở th&agrave;nh c&ocirc;ng cụ l&yacute; tưởng cho c&aacute;c nhiệm vụ đ&ograve;i hỏi độ ch&iacute;nh x&aacute;c cao v&agrave; chất lượng h&igrave;nh ảnh vượt trội.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/tablet/iPad/Pro/M4/ipad-pro-m4-13-inch-3.jpg" alt="Camera iPad Pro M4 13 inch" loading="lazy"></p>
<p>(Nguồn ảnh: Apple)</p>
        <div style="margin-top: 20px; border-top: 1px dashed #ccc; padding-top: 10px;">
            <p>
                <span style="background-color: #fff3cd; padding: 5px 10px; border-radius: 5px; font-weight: bold;">
                    ✏️ Cập nhật ngày: 04:33:12 5/1/2026
                </span>
            </p>
        </div>
    <div class="box-more-promotion-title has-text-black has-text-weight-semibold">Ưu đ&atilde;i thanh to&aacute;n</div>
<div class="render-promotion fix-ul-height">
<ul>
<li><a href="https://cellphones.com.vn/uu-dai-smember" target="_blank" rel="noopener">Xem ch&iacute;nh s&aacute;ch ưu đ&atilde;i d&agrave;nh cho th&agrave;nh vi&ecirc;n Smember</a></li>
<li><img title="Kredivo" src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/DUMT_ZV0.png" alt="Kredivo" width="46" height="16" loading="lazy">&nbsp;<a href="https://cellphones.com.vn/uu-dai-doi-tac/kredivo" target="_blank" rel="noopener">Giảm đến 5.000.000đ khi thanh to&aacute;n qua Kredivo</a></li>
<li><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Icon/hsbc_icon.png" loading="lazy">&nbsp;<a href="https://cellphones.com.vn/uu-dai-doi-tac/mo-the-tin-dung-hsbc">Ho&agrave;n tiền đến 2 triệu khi mở thẻ t&iacute;n dụng HSBC</a></li>
<li><a href="https://cellphones.com.vn/uu-dai-mo-the-vib-cash-back" target="_blank" rel="noopener"><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Icon/vibb_bank.png" loading="lazy">Mở thẻ VIB nhận E-Voucher đến 600K</a></li>
<li><a href="https://cellphones.com.vn/uu-dai-doi-tac/hsbc"><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Icon/logo-ocb.png" loading="lazy"></a>&nbsp;<a href="https://cellphones.com.vn/uu-dai-doi-tac/ocb">Giảm 500K khi thanh to&aacute;n qua thẻ t&iacute;n dụng OCB</a></li>
<li><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Icon/image_1747.png" loading="lazy">&nbsp;<a href="https://cellphones.com.vn/uu-dai-doi-tac/tpbank-evo">Giảm đến 500K khi mở thẻ TPBANK EVO</a></li>
<li><a href="https://cellphones.com.vn/uu-dai-doi-tac/home-credit"><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Icon/logo-home-credit-new.png" loading="lazy">&nbsp;Giảm 400K khi thanh to&aacute;n bằng thẻ t&iacute;n dụng Home Credit</a></li>
<li><a href="https://cellphones.com.vn/dich-vu-khach-hang-doanh-nghiep" target="_blank" rel="noopener">Li&ecirc;n hệ B2B để được tư vấn gi&aacute; tốt nhất cho kh&aacute;ch h&agrave;ng doanh nghiệp khi mua số lượng nhiều</a></li>
</ul>
</div>
        <div style="margin-top: 20px; border-top: 1px dashed #ccc; padding-top: 10px;">
            <p>
                <span style="background-color: #fff3cd; padding: 5px 10px; border-radius: 5px; font-weight: bold;">
                    ✏️ Cập nhật ngày: 04:55:10 5/1/2026
                </span>
            </p>
        </div>
    <p class="upsell-title">Phụ kiện mua c&ugrave;ng</p>
<div class="upsell-block-product">
<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-multirow">
<div class="swiper-wrapper">
<div class="upsell-item swiper-slide swiper-slide-active">
<div class="upsell-item-wrapper"><img class="upsell-item-image" src="https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/b/a/ban-phim-apple-magic-keyboard-ipad-pro-13-inch-m4.png" width="358" height="358">
<div class="upsell-item-info">
<div class="upsell-item-text"><a href="https://cellphones.com.vn/ban-phim-apple-magic-keyboard-ipad-pro-13-inch-m4.html">
<p class="upsell-item-name">B&agrave;n ph&iacute;m iPad Pro 13 M4/M5 Apple Magic Keyboard + Trackpad</p>
</a>
<p class="upsell-item-member">Smember giảm th&ecirc;m đến&nbsp;196.000đ</p>
</div>
<div class="upsell-item-action">
<div class="block-box-price">
<div class="box-info__box-price">
<p class="product__price--show">9.790.000đ</p>
</div>
</div>
<button class="button"></button></div>
</div>
</div>
</div>
<div class="upsell-item swiper-slide swiper-slide-next">
<div class="upsell-item-wrapper"><img class="upsell-item-image" src="https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/b/a/ban-phim-apple-magic-keyboard-trackpad-ipad-pro-13-inch-2024_1_.png" width="358" height="358">
<div class="upsell-item-info">
<div class="upsell-item-text"><a href="https://cellphones.com.vn/ban-phim-apple-magic-keyboard-trackpad-ipad-pro-13-inch-2024.html">
<p class="upsell-item-name">B&agrave;n ph&iacute;m Apple Magic Keyboard + Trackpad iPad Pro 13 inch 2024</p>
</a>
<p class="upsell-item-member">Smember giảm th&ecirc;m đến&nbsp;196.000đ</p>
</div>
<div class="upsell-item-action">
<div class="block-box-price">
<div class="box-info__box-price">
<p class="product__price--show">9.790.000đ</p>
</div>
</div>
<button class="button"></button></div>
</div>
</div>
</div>
<div class="upsell-item swiper-slide">
<div class="upsell-item-wrapper"><img class="upsell-item-image" src="https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_93__1_3.png" width="358" height="358">
<div class="upsell-item-info">
<div class="upsell-item-text"><a href="https://cellphones.com.vn/apple-pencil-pro.html">
<p class="upsell-item-name">B&uacute;t cảm ứng Apple Pencil Pro</p>
</a>
<p class="upsell-item-member">Smember giảm th&ecirc;m đến&nbsp;64.000đ</p>
</div>
<div class="upsell-item-action">
<div class="block-box-price">
<div class="box-info__box-price">
<p class="product__price--show">3.190.000đ</p>
<p class="product__price--through">3.490.000đ</p>
</div>
</div>
<button class="button"></button></div>
</div>
</div>
</div>
<div class="upsell-item swiper-slide">
<div class="upsell-item-wrapper"><img class="upsell-item-image" src="https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/b/u/but-cam-ung-zagg-pro-stylus-2-pencil.png" width="358" height="358">
<div class="upsell-item-info">
<div class="upsell-item-text"><a href="https://cellphones.com.vn/but-cam-ung-zagg-pro-stylus-2-pencil.html">
<p class="upsell-item-name">B&uacute;t cảm ứng ZAGG Pro Stylus 2 Pencil</p>
</a>
<p class="upsell-item-member">Smember giảm th&ecirc;m đến&nbsp;81.000đ</p>
</div>
<div class="upsell-item-action">
<div class="block-box-price">
<div class="box-info__box-price">
<p class="product__price--show">1.620.000đ</p>
<p class="product__price--through">1.800.000đ</p>
</div>
</div>
<button class="button"></button></div>
</div>
</div>
</div>
<div class="upsell-item swiper-slide">
<div class="upsell-item-wrapper"><img class="upsell-item-image" src="https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-pencil-usb-c-thumb.png" width="358" height="358">
<div class="upsell-item-info">
<div class="upsell-item-text"><a href="https://cellphones.com.vn/apple-pencil-usb-c.html">
<p class="upsell-item-name">Apple Pencil 2023 USB-C ch&iacute;nh h&atilde;ng (MUWA3)</p>
</a>
<p class="upsell-item-member">Smember giảm th&ecirc;m đến&nbsp;42.000đ</p>
</div>
<div class="upsell-item-action">
<div class="block-box-price">
<div class="box-info__box-price">
<p class="product__price--show">2.090.000đ</p>
<p class="product__price--through">2.190.000đ</p>
</div>
</div>
<button class="button"></button></div>
</div>
</div>
</div>
<div class="upsell-item swiper-slide">
<div class="upsell-item-wrapper"><img class="upsell-item-image" src="https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/k/i/kinh-cuong-luc-apple-ipad-air-pro-13-2024-zeelot-solidsleek_1_.png" width="358" height="358">
<div class="upsell-item-info">
<div class="upsell-item-text"><a href="https://cellphones.com.vn/kinh-cuong-luc-apple-ipad-air-pro-13-2024-zeelot-solidsleek.html">
<p class="upsell-item-name">D&aacute;n k&iacute;nh cường lực m&agrave;n h&igrave;nh iPad Air 13 (M2/M3)/PRO 13 (M4/M5) Zeelot SOLIDsleek Full cao cấp</p>
</a>
<p class="upsell-item-member">Smember giảm th&ecirc;m đến&nbsp;27.000đ</p>
</div>
<div class="upsell-item-action">
<div class="block-box-price">
<div class="box-info__box-price">
<p class="product__price--show">531.000đ</p>
<p class="product__price--through">590.000đ</p>
</div>
</div>
<button class="button"></button></div>
</div>
</div>
</div>
<div class="upsell-item swiper-slide">
<div class="upsell-item-wrapper"><img class="upsell-item-image" src="https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/f/r/frame_104_6_1_1.png" width="358" height="358">
<div class="upsell-item-info">
<div class="upsell-item-text"><a href="https://cellphones.com.vn/dich-vu-apple-care-plus-ipad-pro-13-inch-m4.html">
<p class="upsell-item-name">Dịch vụ gia hạn bảo h&agrave;nh Applecare+ cho iPad Pro 13 inch (M4)</p>
</a>
<p class="upsell-item-member">Smember giảm th&ecirc;m đến&nbsp;0đ</p>
</div>
<div class="upsell-item-action">
<div class="block-box-price">
<div class="box-info__box-price">
<p class="product__price--show">4.699.000đ</p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="upsell-item swiper-slide">
<div class="upsell-item-wrapper"><img class="upsell-item-image" src="https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/k/i/kinh-cuong-luc-mipow-ipad-pro-13-2024_1_.png" width="358" height="358">
<div class="upsell-item-info">
<div class="upsell-item-text"><a href="https://cellphones.com.vn/kinh-cuong-luc-mipow-ipad-pro-13-2024.html">
<p class="upsell-item-name">D&aacute;n k&iacute;nh cường lực m&agrave;n h&igrave;nh Apple iPad Pro 13 (M4/M5) Mipow full cao cấp</p>
</a>
<p class="upsell-item-member">Smember giảm th&ecirc;m đến&nbsp;24.000đ</p>
</div>
<div class="upsell-item-action">
<div class="block-box-price">
<div class="box-info__box-price">
<p class="product__price--show">486.000đ</p>
<p class="product__price--through">540.000đ</p>
</div>
</div>
<button class="button"></button></div>
</div>
</div>
</div>
<div class="upsell-item swiper-slide">&nbsp;</div>
</div>
</div>
</div>', '5000000', '100000', '30000000', '12000000', '2026-01-17T03:25:00.000Z', 1, 19, '2026-01-04T21:21:17.661Z', true, true, '''/pro'':1030 ''04'':787,904 ''0đ'':1068 ''1.620.000'':990 ''1.800.000'':992 ''10'':906 ''12'':789 ''12mp'':631,660,686 ''13'':4,17,38,166,274,367,493,638,919,944,1028,1031,1060,1084 ''1600'':439 ''196.000'':930,952 ''2'':827,981 ''2.090.000'':1012 ''2.190.000'':1014 ''2023'':996 ''2024'':58,80,130,946 ''24.000'':1095 ''256gb'':7,20,41,169,295,370,641 ''27.000'':1043 ''3'':205,514 ''3.190.000'':970 ''3.490.000'':972 ''33'':788 ''4'':517,695 ''4.699.000'':1069 ''400k'':866 ''40gb/s'':526 ''42.000'':1010 ''486.000'':1097 ''5.000.000'':815 ''5.1'':389 ''5/1/2026'':790,907 ''500k'':846,859 ''531.000'':1045 ''540.000'':1099 ''55'':905 ''590.000'':1047 ''5g'':557 ''600k'':844 ''64.000'':968 ''6e'':553 ''81.000'':988 ''8gb'':322 ''9.790.000'':932,954 ''air'':1027 ''apple'':11,53,172,189,267,475,485,598,620,783,921,938,960,994,1081 ''applecare'':1056 ''b'':111,268,913,934,956,974 ''b2b'':881 ''bước'':175 ''bảng'':363 ''bảo'':324,562,571,1053 ''bật'':496 ''bằng'':871 ''bền'':395 ''bộ'':159,286 ''c'':47,66,92,116,180,252,277,281,282,327,429,482,510,617,719,754,760,761,771,911,999 ''camera'':658,671 ''cao'':152,244,357,396,428,479,632,772,1036,1088 ''ch'':218,464,568,595,734,768,798,801,891,1000 ''chi'':468 ''chip'':154,188,195,228 ''chiếc'':162 ''cho'':518,668,747,759,807,889,1057 ''chuẩn'':615 ''chính'':9 ''chất'':94,701,774 ''chế'':410 ''chỉ'':241,387 ''chọn'':285 ''chụp'':622,652 ''credit'':877 ''cung'':146,207 ''cũng'':312,541,591,676 ''cường'':1020,1075 ''cạnh'':270,664 ''cải'':254,696 ''cảm'':958,976 ''cấp'':147,208,358,480,633,1037,1089 ''cấu'':21,136 ''cầm'':87 ''cập'':784,901 ''cổng'':476,507 ''cụ'':756 ''của'':52,110,171,187,227,449,533,575,673 ''cực'':215,334,462 ''d'':193,451,455,531,583,805,1016,1071 ''di'':565 ''doanh'':894 ''dung'':290,318 ''dưới'':107 ''dịch'':1049 ''dụng'':262,307,834,855,875 ''dữ'':213,522 ''e'':841 ''e-voucher'':840 ''evo'':864 ''fi'':552 ''flash'':738 ''full'':1035,1087 ''gi'':120,886 ''gia'':1051 ''giải'':330,427 ''giảm'':813,845,857,865,926,948,964,984,1006,1039,1064,1091 ''gọi'':669 ''h'':22,71,73,96,114,137,338,353,418,646,703,776,892,1002,1024,1054,1079 ''hdr'':694 ''hiển'':343,434,447 ''hiện'':372,740 ''hiệu'':149,221,259,580,728 ''ho'':398,401,823 ''home'':876 ''hsbc'':835 ''hãng'':10 ''hơn'':123,624,730 ''hạn'':1052 ''hệ'':535,626,880 ''họa'':250 ''hỏi'':766 ''hỗ'':225,296,483,511,555,687,721 ''hợp'':735 ''hữu'':280,393,678 ''i'':8,112,409,586,726,765,793,804 ''inch'':5,18,39,167,275,368,494,639,945,1061 ''ipad'':1,14,35,77,127,163,236,272,364,457,490,536,588,635,715,748,917,942,1026,1058,1082 ''k'':315,411,544,1018,1073 ''keyboard'':489,603,923,940 ''kh'':239,529,542,581,890 ''khi'':817,829,847,860,867,896 ''khiển'':612 ''khả'':209,245,498 ''khẳng'':642 ''khủng'':161 ''kiện'':709,909 ''kredivo'':822 ''kế'':29,61,142,200,378 ''kết'':477,500,527,563 ''kể'':258,700 ''kỳ'':216,463 ''l'':44,212,248,292,326,415,436,683,745,757 ''li'':878 ''liệu'':214,523,609,727 ''lưu'':298 ''lượng'':95,264,291,301,319,702,775,899 ''lại'':174,605 ''lớn'':302 ''lực'':651,1021,1076 ''m'':69,251,310,316,336,351,359,382,407,412,416,443,545,628,674,746,916,928,937,950,966,986,1008,1022,1041,1066,1077,1093 ''m2/m3'':1029 ''m4'':3,16,37,79,129,165,190,229,276,366,492,590,637,750,1062 ''m4/m5'':920,1032,1085 ''magic'':488,602,922,939 ''mang'':173,604 ''mipow'':1086 ''mm'':390 ''mua'':897,910 ''muwa3'':1004 ''mượt'':335 ''mạnh'':26,139,155,232 ''mẫu'':76 ''mắt'':186 ''mẽ'':27,140,233 ''mọi'':444,707 ''mỏng'':32,64,342,386 ''một'':300 ''mới'':170,238,538 ''mở'':830,836,861 ''mức'':148 ''n'':70,81,100,108,131,196,234,242,253,269,278,293,348,352,381,399,402,404,417,426,437,454,459,465,471,539,560,579,681,684,717,720,737,743,796,811,820,824,833,850,854,870,874,879,914,935,1017,1023,1072,1078 ''nam'':13 ''ng'':48,67,74,91,93,117,134,157,181,194,219,240,243,257,328,430,433,452,456,530,543,569,582,647,699,712,755,893,912,1003 ''nghiệm'':86,446,607 ''nghiệp'':895 ''nghệ'':49,68,182 ''ngo'':585 ''ngoại'':502 ''nguồn'':265,473,618,781 ''ngày'':786,903 ''người'':450 ''nh'':23,72,90,97,119,138,145,204,339,354,362,406,419,704,710,753,769,777,799,806,809,1001,1019,1025,1055,1074,1080 ''nhanh'':217,567,613 ''nhiều'':900 ''nhiệm'':333,762 ''nhạy'':614 ''nhấn'':46 ''nhất'':888 ''nhận'':839 ''nhập'':608 ''nhật'':785,902 ''nhẹ'':89 ''nhớ'':160,287 ''nhờ'':397,441,731 ''nits'':440 ''nm'':206 ''năm'':57 ''năng'':150,210,246,263,499,650 ''nắm'':88 ''nối'':478,501,528,564 ''nổi'':495 ''nửa'':55 ''ocb'':856 ''oled'':355,420 ''pencil'':486,599,961,982,995 ''ph'':178,425,915,936 ''phần'':106,546 ''phẩm'':126 ''phụ'':908 ''pixels'':104 ''pro'':2,15,36,78,128,164,237,273,365,458,487,491,537,589,600,636,716,749,918,943,962,979,1059,1083 ''prores'':691 ''qu'':723 ''qua'':135,558,821,851 ''quay'':621,655,689 ''quả'':222,729 ''r'':680 ''ra'':185,587 ''ram'':320 ''retina'':422 ''s'':121,432,711,800 ''sang'':33,143 ''sau'':672 ''si'':24,30,62,230,340,345,384 ''smart'':693 ''smember'':812,925,947,963,983,1005,1038,1063,1090 ''solidsleek'':1034 ''stylus'':980 ''suất'':260 ''sản'':125 ''sắc'':51,99,347,470 ''sẽ'':313,461,592 ''số'':158,898 ''sở'':279,392,677 ''sử'':261 ''sự'':184,224,373 ''t'':101,283,349,361,408,472,578,682,724,725,733,832,853,873,957,975 ''tablet'':634 ''th'':133,156,380,594,752,808,927,949,965,985,1007,1040,1065,1092 ''thanh'':794,818,848,868 ''theo'':191,413 ''thiết'':28,60,141,199,377 ''thiện'':255,400,697 ''thunderbolt'':513 ''thẻ'':831,837,852,862,872 ''thế'':534,645 ''thể'':371 ''thị'':344,435,448 ''thống'':627 ''thời'':309,714 ''thực'':466 ''tin'':304 ''tinh'':374 ''tiến'':176,202 ''tiết'':469 ''tiền'':825 ''to'':403,795,819,849,869 ''tpbank'':863 ''tr'':203,331,453 ''trackpad'':924,941 ''triệu'':828 ''trong'':54,102,105,179,288,376,706 ''truetone'':739 ''truyền'':521,577 ''trước'':659 ''trải'':85,445,606 ''trọng'':34,144 ''trội'':505,780 ''trở'':751 ''trợ'':226,297,484,512,556,688,722 ''trữ'':299 ''tư'':884 ''tương'':593 ''tưởng'':758 ''tượng'':548 ''tạo'':337 ''tập'':303 ''tế'':375 ''tốc'':519 ''tối'':666 ''tốt'':596,623,887 ''tới'':84,525 ''từ'':388,405 ''từng'':103 ''u'':25,31,63,122,231,341,346,385 ''ultra'':421 ''usb'':509,516,998 ''usb-c'':508,997 ''v'':65,220,305,391,467,481,515,554,601,610,654,692,773 ''vi'':503,810 ''vib'':838 ''video'':656,670,690 ''viết'':113 ''viền'':665 ''việc'':329 ''việt'':12 ''voucher'':842 ''vượt'':504,779 ''vấn'':885 ''vậy'':442 ''về'':124,649 ''vị'':644 ''với'':59,153,183,201,223,289,317,350,379,497,506,549,597,625,657 ''vụ'':763,1050 ''wi'':551 ''wi-fi'':550 ''wifi'':6,19,40,168,369,640 ''x'':616,770 ''xdr'':356,423 ''xem'':43,797 ''xuất'':50 ''xử'':211,247,325 ''y'':82,109,115,132,197,235,284,311,360,383,460,532,540,584,629,675,718,744 ''zagg'':978 ''zeelot'':1033 ''đ'':118,192,256,271,414,559,698,736,764,792,803,816,931,933,953,955,969,971,973,989,991,993,1011,1013,1015,1044,1046,1048,1070,1096,1098,1100 ''đa'':332 ''đem'':83 ''đi'':314 ''điều'':611,708,742 ''điểm'':45 ''đường'':576 ''được'':42,198,661,732,883 ''đại'':741 ''đạt'':321,524 ''đảm'':323,561,570 ''đầu'':56,75,648 ''đặt'':662 ''đến'':294,438,685,814,826,843,858,929,951,967,987,1009,1042,1067,1094 ''để'':882 ''đỉnh'':151 ''định'':574,643 ''đồ'':249 ''đồng'':308,713 ''độ'':394,424,431,520,572,679,767 ''động'':566 ''đột'':177 ''ưu'':667,791,802 ''ảnh'':98,266,474,619,630,653,705,778,782 ''ấn'':547 ''ổn'':573 ''ở'':663 ''ứng'':306,959,977'),
  (165, 'iPad Pro M4 11 inch Wifi 1TB Nano | Chính hãng Apple Việt Nam', 17, 7, '<ul class="list zD21B8B" role="list" aria-label="C&aacute;c điểm nổi bật của iPad Pro" data-v-a4f6dfec="">
<li class="list-item vF8365F" role="listitem" data-v-a4f6dfec="">
<div class="row large-display-bleed medium-display-bleed small-display-bleed d586CBD" data-v-a4f6dfec="">
<div class="column large-12 gF10D1D" data-v-a4f6dfec="">
<div class="bento-box p48C190" data-v-a4f6dfec="">
<div class="bentobox-item p20CCB4" data-v-a4f6dfec="">
<div class="row large-display-bleed medium-display-bleed small-display-bleed i660783" data-v-a4f6dfec="">
<div class="column large-12 zFC31D7" data-v-a4f6dfec="">
<div class="row large-display-bleed medium-display-bleed small-display-bleed j11EFFE" data-v-a4f6dfec="">
<div class="column large-12 nF2BC47" data-v-a4f6dfec="">
<p class="copy p96A200 channel-custom-font-03---Bento-headline" data-v-a4f6dfec="">Thiết kế mỏng nhẹ kh&ocirc;ng tưởng.&nbsp;<span data-v-a4f6dfec="">Mạnh mẽ, gọn nhẹ kh&ocirc;ng ngờ.</span></p>
</div>
</div>
<div class="row large-display-bleed medium-display-bleed small-display-bleed f40FF73" data-v-a4f6dfec="">
<div class="column large-12 bAAB081" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div data-v-a4f6dfec=""><picture class="picture" data-v-a4f6dfec=""><source srcset="https://static-product.cellphones.com.vn/img/size_large_2x.150eb9e.png 54w" type="image/png" media="(min-width: 1069px)" sizes="(min-width: 1069px) 27px" data-v-a4f6dfec=""><source srcset="https://static-product.cellphones.com.vn/img/size_medium_2x.0d0db48.png 58w" type="image/png" media="(min-width: 735px)" sizes="(min-width: 735px) 29px" data-v-a4f6dfec=""><img class="image c0F120B" src="https://static-product.cellphones.com.vn/img/size_small_2x.ca9ad58.png" sizes="29px" srcset="https://static-product.cellphones.com.vn/img/size_small_2x.ca9ad58.png 58w" alt="Mặt b&ecirc;n của iPad Pro cho thấy độ mỏng của thiết kế mới" data-v-a4f6dfec=""></picture></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</li>
<li class="list-item f8CDAE2" role="listitem" data-v-a4f6dfec="">
<div class="row large-display-bleed medium-display-bleed small-display-bleed k9A16A6" data-v-a4f6dfec="">
<div class="column large-12 jBAABAA" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div class="bento-box hD6F568" data-v-a4f6dfec="">
<div class="bentobox-item kD26FC8" data-v-a4f6dfec="">
<div class="row large-display-bleed medium-display-bleed small-display-bleed h74CEDD" data-v-a4f6dfec="">
<div class="column large-12 o4D77A2" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div class="row large-display-bleed medium-display-bleed small-display-bleed xC2A44D" data-v-a4f6dfec="">
<div class="column large-12 m62368F" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<p class="copy uC961B8 channel-custom-font-03---Bento-headline" data-v-a4f6dfec="">M&agrave;n h&igrave;nh Ultra Retina XDR&nbsp;<span data-v-a4f6dfec="">với c&ocirc;ng nghệ OLED hai lớp đột ph&aacute;.</span></p>
</div>
</div>
<div class="row large-display-bleed medium-display-bleed small-display-bleed oCB0811" data-v-a4f6dfec="">
<div class="column large-12 o4D83DE" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div data-v-a4f6dfec=""><picture class="picture" data-v-a4f6dfec=""><source srcset="https://static-product.cellphones.com.vn/img/display_large_2x.e3ddcc7.png 1052w" type="image/png" media="(min-width: 1069px)" sizes="(min-width: 1069px) 526px" data-v-a4f6dfec=""><source srcset="https://static-product.cellphones.com.vn/img/display_medium_2x.0fe927b.png 618w" type="image/png" media="(min-width: 735px)" sizes="(min-width: 735px) 309px" data-v-a4f6dfec=""><img class="image nFE0744" src="https://static-product.cellphones.com.vn/img/display_small_2x.33658d7.png" sizes="293px" srcset="https://static-product.cellphones.com.vn/img/display_small_2x.33658d7.png 586w" alt="Apple Pencil Pro gắn với iPad Pro 11 inch v&agrave; iPad Pro 13 inch ph&iacute;a sau. Cả hai phi&ecirc;n bản đang hiển thị h&igrave;nh ảnh tươi s&aacute;ng, sống động, rực rỡ tr&ecirc;n m&agrave;n h&igrave;nh Ultra Retina XDR" data-v-a4f6dfec=""></picture></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</li>
<li class="list-item sB5FB5D" role="listitem" data-v-a4f6dfec="">
<div class="row large-display-bleed medium-display-bleed small-display-bleed n7C21A5" data-v-a4f6dfec="">
<div class="column large-12 m3B4B35" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div class="bento-box y96DF01" data-v-a4f6dfec="">
<div class="bentobox-item a78CA7E" data-v-a4f6dfec="">
<div class="row large-display-bleed medium-display-bleed small-display-bleed v8E60D3" data-v-a4f6dfec="">
<div class="column large-12 i5C4E6C" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div class="row large-display-bleed medium-display-bleed small-display-bleed l5CC917" data-v-a4f6dfec="">
<div class="column large-12 v3D569F" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<p class="copy z08E8E5 channel-custom-font-03---Bento-headline" data-v-a4f6dfec=""><span data-v-a4f6dfec="">Chip Apple M4.</span>&nbsp;Hiệu năng như mơ, đồ họa&nbsp;<span data-v-a4f6dfec="">thay đổi cuộc chơi</span>&nbsp;v&agrave; năng lực AI mạnh mẽ.</p>
</div>
</div>
<div class="row large-display-bleed medium-display-bleed small-display-bleed i24E910" data-v-a4f6dfec="">
<div class="column large-12 t6C5498" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div data-v-a4f6dfec=""><picture class="picture" data-v-a4f6dfec=""><source srcset="https://static-product.cellphones.com.vn/img/chip_large_2x.0381034.png 780w" type="image/png" media="(min-width: 1069px)" sizes="(min-width: 1069px) 390px" data-v-a4f6dfec=""><source srcset="https://static-product.cellphones.com.vn/img/chip_medium_2x.c634e38.png 560w" type="image/png" media="(min-width: 735px)" sizes="(min-width: 735px) 280px" data-v-a4f6dfec=""><img class="image e079E16" src="https://static-product.cellphones.com.vn/img/chip_small_2x.8bce501.png" sizes="311px" srcset="https://static-product.cellphones.com.vn/img/chip_small_2x.8bce501.png 622w" alt="iPad Pro chạy một ứng dụng đồ họa khủng để giới thiệu hiệu năng của chip Apple M4" data-v-a4f6dfec=""></picture></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</li>
<li class="list-item xB61CB5" role="listitem" data-v-a4f6dfec="">
<div class="row large-display-bleed medium-display-bleed small-display-bleed sAC9FDE" data-v-a4f6dfec="">
<div class="column large-12 tFE0243" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div class="bento-box q2C9A84" data-v-a4f6dfec="">
<div class="bentobox-item z74D10A" data-v-a4f6dfec="">
<div class="row large-display-bleed medium-display-bleed small-display-bleed k64FD8F" data-v-a4f6dfec="">
<div class="column large-12 u33A135" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div class="row large-display-bleed medium-display-bleed small-display-bleed z3B003F" data-v-a4f6dfec="">
<div class="column large-10 small-9 j77E401" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<p class="copy q65C0A8 channel-custom-font-04---Bento-callout" data-v-a4f6dfec="">Pin d&ugrave;ng cả&nbsp;ng&agrave;y</p>
</div>
</div>
<p class="copy wB8BB1A channel-custom-font-04---Bento-callout" data-v-a4f6dfec="">để l&agrave;m việc, học tập, s&aacute;ng tạo v&agrave; giải tr&iacute;.</p>
</div>
</div>
</div>
</div>
</div>
</div>
</li>
<li class="list-item cBA4ECB" role="listitem" data-v-a4f6dfec="">
<div class="row large-display-bleed medium-display-bleed small-display-bleed uD734D0" data-v-a4f6dfec="">
<div class="column large-12 u31FB40" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div class="bento-box t6F295B" data-v-a4f6dfec="">
<div class="bentobox-item r695CD1" data-v-a4f6dfec="">
<div class="row large-display-bleed medium-display-bleed small-display-bleed e120E9C" data-v-a4f6dfec="">
<div class="column large-12 large-show medium-show small-hide b2B5455" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div class="row large-display-bleed medium-display-bleed small-display-bleed nB5F094" data-v-a4f6dfec="">
<div class="column large-4 medium-5 z231791" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<p class="copy jA42D37 channel-custom-font-03---Bento-headline" data-v-a4f6dfec="">Xử l&yacute; gọn ghẽ những luồng c&ocirc;ng việc pro với&nbsp;<span data-v-a4f6dfec="">iPadOS</span>&nbsp;v&agrave; c&aacute;c ứng dụng tuyệt vời.<span aria-hidden="true" data-v-a4f6dfec="">&loz;</span><span class="visuallyhidden" data-v-a4f6dfec="">Tham khảo tuy&ecirc;n bố từ chối tr&aacute;ch nhiệm ph&aacute;p l&yacute;</span></p>
</div>
</div>
<div class="row large-display-bleed medium-display-bleed small-display-bleed e15A039" data-v-a4f6dfec="">
<div class="column large-12 f09A6D5" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div data-v-a4f6dfec=""><picture class="picture" data-v-a4f6dfec=""><source srcset="https://static-product.cellphones.com.vn/img/apps_large_2x.688c5a4.png 1534w" type="image/png" media="(min-width: 1069px)" sizes="(min-width: 1069px) 767px" data-v-a4f6dfec=""><source srcset="https://static-product.cellphones.com.vn/img/apps_medium_2x.7d313c9.png 934w" type="image/png" media="(min-width: 735px)" sizes="(min-width: 735px) 467px" data-v-a4f6dfec=""><img class="image u3B4D2D" src="https://static-product.cellphones.com.vn/img/apps_small_2x.dc4d2f2.png" sizes="320px" srcset="https://static-product.cellphones.com.vn/img/apps_small_2x.dc4d2f2.png 640w" alt="Chế độ xem đa nhiệm của iPadOS tr&ecirc;n iPad Pro hiển thị nhiều ứng dụng chạy đồng thời." data-v-a4f6dfec=""></picture></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</li>
<li class="list-item sDA5433" role="listitem" data-v-a4f6dfec="">
<div class="row large-display-bleed medium-display-bleed small-display-bleed rB2A888" data-v-a4f6dfec="">
<div class="column large-12 q0C5A94" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div class="bento-box k6013F4" data-v-a4f6dfec="">
<div class="bentobox-item bF57F8A" data-v-a4f6dfec="">
<div class="row large-display-bleed medium-display-bleed small-display-bleed y4A112E" data-v-a4f6dfec="">
<div class="column large-12 o4652BF" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div class="row large-display-bleed medium-display-bleed small-display-bleed bAFBED1" data-v-a4f6dfec="">
<div class="column large-12 b1B86EB" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div data-v-a4f6dfec=""><picture class="picture" data-v-a4f6dfec=""><source srcset="https://static-product.cellphones.com.vn/img/pencil_large_2x.6494f74.png 626w" type="image/png" media="(min-width: 1069px)" sizes="(min-width: 1069px) 313px" data-v-a4f6dfec=""><source srcset="https://static-product.cellphones.com.vn/img/pencil_medium_2x.85091de.png 672w" type="image/png" media="(min-width: 735px)" sizes="(min-width: 735px) 336px" data-v-a4f6dfec=""><img class="image o0AF189" src="https://static-product.cellphones.com.vn/img/pencil_small_2x.aee47a9.png" sizes="320px" srcset="https://static-product.cellphones.com.vn/img/pencil_small_2x.aee47a9.png 640w" alt="Apple Pencil Pro sắp chạm v&agrave;o m&agrave;n h&igrave;nh iPad Pro đang hiển thị một đồ họa đầy m&agrave;u sắc được thiết kế bằng Apple Pencil Pro." data-v-a4f6dfec=""></picture></div>
</div>
</div>
<div class="row large-display-bleed medium-display-bleed small-display-bleed r382D77" data-v-a4f6dfec="">
<div class="column large-12 m92087D" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<p class="copy h273673 channel-custom-font-03---Bento-headline" data-v-a4f6dfec="">Apple Pencil Pro&nbsp;<span data-v-a4f6dfec="">với nhiều t&iacute;nh năng mạnh mẽ n&acirc;ng tầm s&aacute;ng tạo.</span></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</li>
<li class="list-item q92ADEF" role="listitem" data-v-a4f6dfec="">
<div class="row large-display-bleed medium-display-bleed small-display-bleed k42EE24" data-v-a4f6dfec="">
<div class="column large-12 rBC612F" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div class="bento-box t2B9E19" data-v-a4f6dfec="">
<div class="bentobox-item u3D4DFE" data-v-a4f6dfec="">
<div class="row large-display-bleed medium-display-bleed small-display-bleed rF4E5A1" data-v-a4f6dfec="">
<div class="column large-12 large-show medium-show small-hide kD3888B" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div class="row large-display-bleed medium-display-bleed small-display-bleed d0CCD37" data-v-a4f6dfec="">
<div class="column large-12 hAA99A2" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<p class="copy z18C2D7 channel-custom-font-03---Bento-headline" data-v-a4f6dfec=""><span data-v-a4f6dfec="">Magic&nbsp;Keyboard</span>&nbsp;được thiết kế mới, mỏng hơn. Trải nghiệm g&otilde; ph&iacute;m v&agrave; b&agrave;n di phản hồi cảm ứng cực kỳ thoải m&aacute;i.</p>
</div>
</div>
<div class="row large-display-bleed medium-display-bleed small-display-bleed lF973DD" data-v-a4f6dfec="">
<div class="column large-12 s3BEAFD" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div data-v-a4f6dfec=""><picture class="picture" data-v-a4f6dfec=""><source srcset="https://static-product.cellphones.com.vn/img/keyboard_large_2x.f21b4f4.png 1134w" type="image/png" media="(min-width: 1069px)" sizes="(min-width: 1069px) 567px" data-v-a4f6dfec=""><source srcset="https://static-product.cellphones.com.vn/img/keyboard_medium_2x.b357130.png 884w" type="image/png" media="(min-width: 735px)" sizes="(min-width: 735px) 442px" data-v-a4f6dfec=""><img class="image mA5ED01" src="https://static-product.cellphones.com.vn/img/keyboard_small_2x.6ba3f91.png" sizes="543px" srcset="https://static-product.cellphones.com.vn/img/keyboard_small_2x.6ba3f91.png 1086w" alt="Hai Magic Keyboard gắn với iPad Pro, đặt đối lưng, m&agrave;u Đen Kh&ocirc;ng Gian v&agrave; m&agrave;u Bạc" data-v-a4f6dfec=""></picture></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</li>
<li class="list-item uD7EE78" role="listitem" data-v-a4f6dfec="">
<div class="row large-display-bleed large-show medium-display-bleed medium-show small-display-bleed small-hide tBEF594" data-v-a4f6dfec="">
<div class="column large-12 tBEE726" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div class="bento-box nC898B3" data-v-a4f6dfec="">
<div class="bentobox-item v3222CF" data-v-a4f6dfec="">
<div class="row large-display-bleed medium-display-bleed small-display-bleed u834308" data-v-a4f6dfec="">
<div class="column large-12 xBEEC03" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div class="row large-display-bleed medium-display-bleed small-display-bleed u0815BE" data-v-a4f6dfec="">
<div class="column large-12 k95D5EC" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<p class="copy vEB4A1D channel-custom-font-03---Bento-headline" data-v-a4f6dfec="">Wi-Fi 6E&nbsp;<span data-v-a4f6dfec="">v&agrave;</span>&nbsp;kết nối 5G&nbsp;<span data-v-a4f6dfec="">nhanh như chớp.<span aria-hidden="true" data-v-a4f6dfec="">&loz;</span></span><span class="visuallyhidden" data-v-a4f6dfec="">Tham khảo tuy&ecirc;n bố từ chối tr&aacute;ch nhiệm ph&aacute;p l&yacute;</span></p>
</div>
</div>
<div class="row large-display-bleed medium-display-bleed small-display-bleed v41D598" data-v-a4f6dfec="">
<div class="column large-12 h4D6BE1" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div data-v-a4f6dfec=""><picture class="picture" data-v-a4f6dfec=""><source srcset="https://static-product.cellphones.com.vn/img/connectivity_large_2x.5056cfc.png 1258w" type="image/png" media="(min-width: 1069px)" sizes="(min-width: 1069px) 629px" data-v-a4f6dfec=""><source srcset="https://static-product.cellphones.com.vn/img/connectivity_medium_2x.13824b1.png 822w" type="image/png" media="(min-width: 735px)" sizes="(min-width: 735px) 411px" data-v-a4f6dfec=""><img class="image d1AB519" src="https://static-product.cellphones.com.vn/img/connectivity_small_2x.beabf46.png" sizes="320px" srcset="https://static-product.cellphones.com.vn/img/connectivity_small_2x.beabf46.png 640w" alt="iPad Pro hiển thị game đ&ograve;i hỏi hiệu năng cao đang được chơi trong SharePlay" data-v-a4f6dfec=""></picture></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</li>
<li class="list-item y04CDAF" role="listitem" data-v-a4f6dfec="">
<div class="row large-display-bleed large-show medium-display-bleed medium-show small-display-bleed small-hide u2B88A2" data-v-a4f6dfec="">
<div class="column large-12 h6B893F" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div class="bento-box w1374F7" data-v-a4f6dfec="">
<div class="bentobox-item o92A21B" data-v-a4f6dfec="">
<div class="row large-display-bleed medium-display-bleed small-display-bleed p2643E5" data-v-a4f6dfec="">
<div class="column large-12 q1735EB" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div class="row large-display-bleed medium-display-bleed small-display-bleed f8194CE" data-v-a4f6dfec="">
<div class="column large-12 z0F48CE" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<p class="copy d73B350 channel-custom-font-03---Bento-headline" data-v-a4f6dfec="">C&aacute;c camera pro&nbsp;<span data-v-a4f6dfec="">quay&nbsp;video ProRes&nbsp;4K, mở&nbsp;kh&oacute;a&nbsp;AR, scan&nbsp;t&agrave;i&nbsp;liệu.</span></p>
</div>
</div>
<div class="row medium-display-bleed small-display-bleed n9944E1" data-v-a4f6dfec="">
<div class="column large-12 zBD3BBE" data-v-a4f6dfec="">
<div data-v-a4f6dfec="">&nbsp;</div>
<div data-v-a4f6dfec=""><picture class="picture" data-v-a4f6dfec=""><source srcset="https://static-product.cellphones.com.vn/img/camera_large_2x.9aef6e9.png 550w" type="image/png" media="(min-width: 1069px)" sizes="(min-width: 1069px) 275px" data-v-a4f6dfec=""><source srcset="https://static-product.cellphones.com.vn/img/camera_medium_2x.ea8dca1.png 620w" type="image/png" media="(min-width: 735px)" sizes="(min-width: 735px) 310px" data-v-a4f6dfec=""><img class="image rBC2180" src="https://static-product.cellphones.com.vn/img/camera_small_2x.f7b05e9.png" sizes="281px" srcset="https://static-product.cellphones.com.vn/img/camera_small_2x.f7b05e9.png 562w" alt="Cận cảnh camera sau Wide 12MP tr&ecirc;n iPad Pro" data-v-a4f6dfec=""></picture></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</li>
</ul>
        <div style="margin-top: 20px; border-top: 1px dashed #ccc; padding-top: 10px;">
            <p>
                <span style="background-color: #fff3cd; padding: 5px 10px; border-radius: 5px; font-weight: bold;">
                    ✏️ Cập nhật ngày: 05:02:55 5/1/2026
                </span>
            </p>
        </div>
    <div class="box-product-promotion-header is-flex has-text-weight-semibold is-align-items-center">Khuyến m&atilde;i hấp dẫn</div>
<div class="box-product-promotion-content show-all">
<div class="list-promotion-pack">
<div class="promotion-pack_item is-flex is-align-content-center">
<div class="box-product-promotion-number has-text-primary-light">
<p>1</p>
</div>
<p class="box-product-promotion-detail has-text-black button__promotion">Đặc quyền trợ gi&aacute; l&ecirc;n đến 2 triệu khi thu cũ l&ecirc;n đời iPad</p>
</div>
</div>
</div>', '1111110', '100000', '30000000', '12000000', '2026-01-09T22:05:00.000Z', 2, 19, '2026-01-04T22:01:07.571Z', true, false, '''02'':199 ''05'':198 ''1'':207 ''11'':4 ''1tb'':7 ''2'':215 ''4k'':186 ''5/1/2026'':201 ''55'':200 ''5g'':162 ''6e'':158 ''a'':189 ''ai'':60 ''apple'':11,45,113 ''ar'':190 ''b'':143 ''bố'':104,170 ''c'':36,87,94,95,179,180 ''camera'':181 ''ch'':108,174 ''chip'':44 ''chính'':9 ''chơi'':56 ''chối'':106,172 ''chớp'':165 ''cuộc'':55 ''cũ'':219 ''cả'':66 ''cảm'':148 ''cập'':195 ''cực'':150 ''d'':64 ''di'':145 ''dẫn'':206 ''dụng'':97 ''fi'':157 ''g'':139 ''ghẽ'':84 ''gi'':211 ''giải'':79 ''gọn'':23,83 ''h'':30 ''hai'':40 ''hiệu'':47 ''hãng'':10 ''hơn'':136 ''hấp'':205 ''họa'':52 ''học'':73 ''hồi'':147 ''i'':154,193,204 ''inch'':5 ''ipad'':1,223 ''ipados'':92 ''keyboard'':130 ''kh'':18,25,188 ''khi'':217 ''khuyến'':202 ''khảo'':101,167 ''kế'':15,133 ''kết'':160 ''kỳ'':151 ''l'':70,82,112,178,212,220 ''liệu'':194 ''luồng'':86 ''lớp'':41 ''lực'':59 ''m'':28,71,141,153,203 ''m4'':3,46 ''magic'':129 ''mơ'':50 ''mạnh'':21,61,121 ''mẽ'':22,62,122 ''mỏng'':16,135 ''mới'':134 ''mở'':187 ''n'':29,103,123,144,169,213,221 ''nam'':13 ''nano'':8 ''ng'':19,26,37,65,67,76,88,124,127 ''nghiệm'':138 ''nghệ'':38 ''ngày'':197 ''ngờ'':27 ''nh'':31,119 ''nhanh'':163 ''nhiều'':117 ''nhiệm'':109,175 ''như'':49,164 ''nhật'':196 ''nhẹ'':17,24 ''những'':85 ''năng'':48,58,120 ''nối'':161 ''oled'':39 ''p'':111,177 ''pencil'':114 ''ph'':43,110,140,176 ''phản'':146 ''pin'':63 ''pro'':2,90,115,182 ''prores'':185 ''quay'':183 ''quyền'':209 ''retina'':33 ''s'':75,126 ''scan'':191 ''t'':118,192 ''tham'':100,166 ''thay'':53 ''thiết'':14,132 ''thoải'':152 ''thu'':218 ''tr'':80,107,173 ''triệu'':216 ''trải'':137 ''trợ'':210 ''tuy'':102,168 ''tuyệt'':98 ''tưởng'':20 ''tạo'':77,128 ''tầm'':125 ''tập'':74 ''từ'':105,171 ''ultra'':32 ''v'':57,78,93,142,159 ''video'':184 ''việc'':72,89 ''việt'':12 ''với'':35,91,116 ''vời'':99 ''wi'':156 ''wi-fi'':155 ''wifi'':6 ''xdr'':34 ''xử'':81 ''y'':68 ''được'':131 ''đặc'':208 ''đến'':214 ''để'':69 ''đồ'':51 ''đổi'':54 ''đột'':42 ''đời'':222 ''ứng'':96,149'),
  (166, 'Tai nghe Bluetooth chụp tai Sony WH-1000XM6', 17, 6, '<h2 class="ksp-title">Đặc điểm nổi bật</h2>
<div class="ksp-content">
<blockquote>
<p><a href="https://cellphones.com.vn/tai-nghe-chup-tai-sony-wh-1000xm6.html" target="_self"><strong>Sony WH-1000XM6</strong></a>&nbsp;nổi bật với c&ocirc;ng nghệ&nbsp;<strong>chống ồn Adaptive NC Optimizer</strong>, gi&uacute;p loại bỏ tạp &acirc;m hiệu quả trong nhiều m&ocirc;i trường kh&aacute;c nhau.&nbsp;<strong>M&agrave;ng loa 30mm</strong>&nbsp;mang đến &acirc;m thanh trong trẻo v&agrave; trải nghiệm ch&acirc;n thực. Hơn nữa, tai nghe sở hữu thời lượng&nbsp;<strong>pin đến 40 giờ</strong>, cho ph&eacute;p bạn thỏa sức đắm ch&igrave;m trong &acirc;m nhạc suốt ng&agrave;y d&agrave;i.</p>
</blockquote>
</div>
<div class="table-content" data-v-1bddbad4="">
<div class="table-content__title" data-v-1bddbad4="">
<p data-v-1bddbad4="">Nội dung ch&iacute;nh</p>
</div>
<div class="table-content__wrapper" data-v-1bddbad4="">
<div class="table-content__list" data-v-1bddbad4=""><a class="table-content__item level-2" href="https://cellphones.com.vn/tai-nghe-chup-tai-sony-wh-1000xm6.html#vi-sao-nen-mua-tai-nghe-sony-wh-1000xm6" data-v-1bddbad4="">1. V&igrave; sao n&ecirc;n mua tai nghe&nbsp;Sony WH-1000XM6?</a><a class="table-content__item level-2" href="https://cellphones.com.vn/tai-nghe-chup-tai-sony-wh-1000xm6.html#so-sanh-tai-nghe-sony-wh-1000xm6-voi-sony-wh-1000xm5-chi-tiet" data-v-1bddbad4="">2. So s&aacute;nh tai nghe&nbsp;Sony WH-1000XM6 với&nbsp;Sony WH-1000XM5 chi tiết</a><a class="table-content__item level-2" href="https://cellphones.com.vn/tai-nghe-chup-tai-sony-wh-1000xm6.html#tai-nghe-chup-tai-sony-wh-1000xm6-loc-on-xuat-sac-ket-noi-thong-minh" data-v-1bddbad4="">3. Tai nghe chụp tai Sony WH-1000XM6 - Lọc ồn xuất sắc, kết nối th&ocirc;ng minh&nbsp;</a><a class="table-content__item level-3" href="https://cellphones.com.vn/tai-nghe-chup-tai-sony-wh-1000xm6.html#thiet-ke-thoai-mai-dieu-chinh-thong-minh" data-v-1bddbad4="">3.1. Thiết kế thoải m&aacute;i, điều chỉnh th&ocirc;ng minh&nbsp;</a><a class="table-content__item level-3" href="https://cellphones.com.vn/tai-nghe-chup-tai-sony-wh-1000xm6.html#khu-on-xuat-sac-ket-noi-da-diem" data-v-1bddbad4="">3.2. Khử ồn xuất sắc, kết nối đa điểm&nbsp;</a><a class="table-content__item level-3" href="https://cellphones.com.vn/tai-nghe-chup-tai-sony-wh-1000xm6.html#tan-huong-am-thanh-chan-thuc-voi-cong-nghe-adaptive-nc-optimizer" data-v-1bddbad4="">3.3. Tận hưởng &acirc;m thanh ch&acirc;n thực với c&ocirc;ng nghệ Adaptive NC Optimizer</a><a class="table-content__item level-3" href="https://cellphones.com.vn/tai-nghe-chup-tai-sony-wh-1000xm6.html#tich-hop-mic-dam-thoai-tien-loi" data-v-1bddbad4="">3.4. T&iacute;ch hợp mic đ&agrave;m thoại tiện lợi</a><a class="table-content__item level-3" href="https://cellphones.com.vn/tai-nghe-chup-tai-sony-wh-1000xm6.html#thoi-luong-pin-su-dung-len-den-40-gio" data-v-1bddbad4="">3.5. Thời lượng pin sử dụng l&ecirc;n đến 40 giờ</a><a class="table-content__item level-3" href="https://cellphones.com.vn/tai-nghe-chup-tai-sony-wh-1000xm6.html#dieu-khien-tien-loi-qua-ung-dung-sound-connect" data-v-1bddbad4="">3.6. Điều khiển tiện lợi qua ứng dụng Sound Connect</a><a class="table-content__item level-2" href="https://cellphones.com.vn/tai-nghe-chup-tai-sony-wh-1000xm6.html#mua-tai-nghe-sony-wh-1000xm6-gia-re-chat-luong-tai-cellphones" data-v-1bddbad4="">4. Mua tai nghe Sony WH-1000XM6 gi&aacute; rẻ, chất lượng tại CellphoneS</a></div>
</div>
</div>
<div id="cpsContentSEO">
<h2 id="vi-sao-nen-mua-tai-nghe-sony-wh-1000xm6"><strong>V&igrave; sao n&ecirc;n mua tai nghe&nbsp;Sony WH-1000XM6?</strong></h2>
<p>Sony WH-1000XM6 l&agrave; sản phẩm tai nghe chụp tai sở hữu nhiều điểm nổi bật về thiết kế đến t&iacute;nh năng, đ&acirc;y l&agrave; một sản phẩm đ&aacute;ng để người d&ugrave;ng chọn mua v&agrave; sử dụng:</p>
<ul>
<li>
<p>T&ugrave;y chỉnh &acirc;m thanh EQ 10 dải c&ugrave;ng &acirc;m thanh 360 Reality Auido: Trải nghiệm &acirc;m thanh chất lượng cao</p>
</li>
<li>
<p>6 micro lọc tạp &acirc;m mỗi b&ecirc;n: Mang lại khả năng đ&agrave;m thoại r&otilde; n&eacute;t</p>
</li>
<li>
<p>Pin bền bỉ: Sử dụng đến 30 giờ c&ugrave;ng khả năng sạc nhanh ch&oacute;ng chỉ 3.5 giờ</p>
</li>
<li>
<p>Thiết kế c&oacute; thể gập gọn: Tiện lợi mang theo v&agrave; sử dụng</p>
</li>
</ul>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Am-thanh/Tai-nghe/Sony/tai-nghe-chup-tai-sony-wh-1000xm6-10.jpg" alt="V&igrave; sao n&ecirc;n mua tai nghe Sony WH-1000XM6" loading="lazy"></p>
<h2 id="so-sanh-tai-nghe-sony-wh-1000xm6-voi-sony-wh-1000xm5-chi-tiet"><strong>So s&aacute;nh tai nghe&nbsp;Sony WH-1000XM6 với&nbsp;Sony WH-1000XM5 chi tiết</strong></h2>
<p>&nbsp;</p>
<div class="table-container">
<table class="seo-table table is-bordered is-hoverable">
<thead>
<tr>
<td>
<p><strong>Th&ocirc;ng số</strong></p>
</td>
<td>
<p><strong>Tai nghe Bluetooth chụp tai Sony WH-1000XM6</strong></p>
</td>
<td>
<p><strong>Tai nghe Bluetooth chụp tai Sony WH-1000XM5</strong></p>
</td>
</tr>
</thead>
<tbody>
<tr>
<td>
<p><strong>K&iacute;ch thước</strong></p>
</td>
<td>
<p>D&agrave;i 20 cm - Rộng 7.83 cm - Cao 25.69 cm</p>
</td>
<td>
<p>D&agrave;i 27.62 cm - Rộng 21.67 cm - Cao 7.59 cm</p>
</td>
</tr>
<tr>
<td>
<p><strong>Trọng lượng</strong></p>
</td>
<td>
<p>254g</p>
</td>
<td>
<p>250 g</p>
</td>
</tr>
<tr>
<td>
<p><strong>C&ocirc;ng nghệ &acirc;m thanh</strong></p>
</td>
<td>
<p>C&ocirc;ng nghệ Adaptive NC Optimizer<br>DSEE Extreme (Cơ chế tăng cường &acirc;m thanh kỹ thuật số)<br>Hi-Res Audio<br>360 Reality Audio<br>Equalizer</p>
</td>
<td>
<p>SENSE ENGINE<br>Bộ xử l&yacute; t&iacute;ch hợp V1<br>DSEE Extreme (Cơ chế tăng cường &acirc;m thanh kỹ thuật số)<br>Hi-Res Audio<br>codec SBC<br>Active Noise Cancelling<br>Chống ồn HD QN1<br>codec LDAC<br>Ambient Sound<br>codec AAC<br>360 Reality Audio<br>Adaptiv</p>
</td>
</tr>
<tr>
<td>
<p><strong>Micro</strong></p>
</td>
<td>
<p>C&oacute;</p>
</td>
<td>
<p>C&oacute;</p>
</td>
</tr>
<tr>
<td>
<p><strong>Cổng kết nối</strong></p>
</td>
<td>
<p>3.5mm</p>
</td>
<td>
<p>3.5mm</p>
</td>
</tr>
<tr>
<td>
<p><strong>Thời lượng sử dụng Pin</strong></p>
</td>
<td>
<p>Tắt chống ồn: 40 giờ<br>Bật chống ồn: 30 giờ</p>
</td>
<td>
<p>Tắt chống ồn ANC: D&ugrave;ng 40 giờ<br>Bật chống ồn ANC: D&ugrave;ng 30 giờ</p>
</td>
</tr>
<tr>
<td>
<p><strong>Phương thức điều khiển</strong></p>
</td>
<td>
<p>N&uacute;t bấm vật l&yacute;<br>Cảm ứng</p>
</td>
<td>
<p>Cảm ứng chạm</p>
</td>
</tr>
<tr>
<td>
<p><strong>T&iacute;nh năng kh&aacute;c</strong></p>
</td>
<td>
<p>Chế độ &acirc;m thanh xung quanh<br>Fast pair<br>Dual connect<br>Cảm biến tiệm cận<br>Tương th&iacute;ch trợ l&yacute; ảo<br>Sạc nhanh<br>Micro chống ồn, lọc gi&oacute;</p>
</td>
<td>
<p>Tự động dừng nhạc khi bắt đầu tr&ograve; chuyện<br>Điều khiển bằng giọng n&oacute;i th&ocirc;ng qua Google, Alexa</p>
</td>
</tr>
<tr>
<td>
<p><strong>H&atilde;ng sản xuất</strong></p>
</td>
<td>
<p>Sony</p>
</td>
<td>
<p>Sony</p>
</td>
</tr>
</tbody>
</table>
</div>
<p>&nbsp;</p>
<p>Nh&igrave;n chung, tai nghe kh&ocirc;ng d&acirc;y Sony WH-1000XM6 mang đến nhiều cải tiến nhỏ nhưng đ&aacute;ng gi&aacute; so với thế hệ trước WH-1000XM5, tập trung ở chất lượng chống ồn v&agrave; thời gian phản hồi cảm ứng nhanh hơn. Thiết kế XM6 kh&ocirc;ng c&oacute; nhiều thay đổi về vẻ ngo&agrave;i nhưng cải thiện độ thoải m&aacute;i cũng như hỗ trợ codec &acirc;m thanh mới hơn. Tuy nhi&ecirc;n, sự kh&aacute;c biệt kh&ocirc;ng qu&aacute; lớn n&ecirc;n nếu đang sử dụng WH-1000XM5 th&igrave; chưa nhất thiết phải n&acirc;ng cấp. Tuy nhi&ecirc;n với ai đang t&igrave;m tai nghe chống ồn cao cấp mới th&igrave; WH-1000XM6 l&agrave; lựa chọn đ&aacute;ng c&acirc;n nhắc hơn.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Am-thanh/Tai-nghe/Sony/tai-nghe-chup-tai-sony-wh-1000xm6-11.jpg" alt="So s&aacute;nh tai nghe Sony WH-1000XM6 với Sony WH-1000XM5" loading="lazy"></p>
<h2 id="tai-nghe-chup-tai-sony-wh-1000xm6-loc-on-xuat-sac-ket-noi-thong-minh"><strong>Tai nghe chụp tai Sony WH-1000XM6 - Lọc ồn xuất sắc, kết nối th&ocirc;ng minh&nbsp;</strong></h2>
<p><strong>Tai nghe Sony WH-1000XM6</strong>&nbsp;l&agrave; d&ograve;ng tai nghe mềm mại, nhẹ nh&agrave;ng với phần bọc l&agrave;m từ da, &ocirc;m kh&iacute;t lấy đầu kh&ocirc;ng tạo &aacute;p lực kh&oacute; chịu. Đ&acirc;y l&agrave; si&ecirc;u phẩm kế tiếp sau th&agrave;nh c&ocirc;ng của tai nghe chụp tai Sony WH-1000XM5. H&atilde;y xem đoạn m&ocirc; tả dưới đ&acirc;y để hiểu r&otilde; hơn về chiếc tại nghe mới nhất nh&agrave; Sony n&agrave;y.</p>
<h3 id="thiet-ke-thoai-mai-dieu-chinh-thong-minh"><strong>Thiết kế thoải m&aacute;i, điều chỉnh th&ocirc;ng minh&nbsp;</strong></h3>
<p>Sony WH-1000XM6 c&oacute; thiết kế tinh tế với thanh trượt mượt m&agrave; c&oacute; m&oacute;c treo rất thoải m&aacute;i khi đeo v&agrave; tiện lợi cất gọn. M&agrave;u sắc trẻ trung hiện đại th&iacute;ch hợp cho mọi lứa tuổi, mọi giới t&iacute;nh.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Am-thanh/Tai-nghe/Sony/tai-nghe-chup-tai-sony-wh-1000xm6-6.jpg" alt="Tai nghe chụp tai Sony WH-1000XM6 - Lọc ồn xuất sắc, kết nối th&ocirc;ng minh " loading="lazy"></p>
<p>Tai nghe&nbsp;<strong>WH-1000XM6</strong>&nbsp;điều chỉnh &acirc;m thanh dựa tr&ecirc;n h&agrave;nh vi người d&ugrave;ng, gi&uacute;p ph&aacute;t ra &acirc;m thanh hợp &yacute;. Chức năng Speak-to-Chat hỗ trợ tự động dừng nhạc khi c&oacute; cuộc tr&ograve; chuyện v&agrave; ph&aacute;t lại nhạc ngay khi cuộc tr&ograve; chuyện kết th&uacute;c.</p>
<h3 id="khu-on-xuat-sac-ket-noi-da-diem"><strong>Khử ồn xuất sắc, kết nối đa điểm&nbsp;</strong></h3>
<p>C&ocirc;ng nghệ lọc tiếng ồn Auto NC Optimizer lọc hết &acirc;m c&oacute; tần số cao, giảm tiếng ch&oacute;i v&agrave; tạp &acirc;m. Phần r&igrave;a mềm cũng gi&uacute;p lọc bớt một phần tiếng nhiễu ồn xung quanh. Nhờ vậy, &acirc;m thanh được thanh lọc hiệu quả &ecirc;m nhẹ dễ nghe dễ hấp thụ.&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Am-thanh/Tai-nghe/Sony/tai-nghe-chup-tai-sony-wh-1000xm6-5.jpg" alt="Tai nghe chụp tai Sony WH-1000XM6 - Lọc ồn xuất sắc, kết nối th&ocirc;ng minh " loading="lazy"></p>
<p><strong>Sony WH-1000XM6</strong>&nbsp;c&oacute; khả năng kết nối đa điểm với nhiều thiết bị c&ugrave;ng l&uacute;c. Khả năng nhận biết của tai nghe rất tốt, cho ph&eacute;p bạn biết đ&acirc;u l&agrave; thiết bị đang đổ chu&ocirc;ng v&agrave; bắt kết nối ngay.</p>
<h3 id="tan-huong-am-thanh-chan-thuc-voi-cong-nghe-adaptive-nc-optimizer"><strong>Tận hưởng &acirc;m thanh ch&acirc;n thực với c&ocirc;ng nghệ Adaptive NC Optimizer</strong></h3>
<p>Tai nghe chụp tai Sony WH-1000XM6 được trang bị c&ocirc;ng nghệ Adaptive NC Optimizer, mang đến khả năng chống ồn th&ocirc;ng minh v&agrave; t&ugrave;y biến theo m&ocirc;i trường. D&ugrave; bạn đang ở s&acirc;n bay, qu&aacute;n c&agrave; ph&ecirc; hay văn ph&ograve;ng, tai nghe vẫn đảm bảo &acirc;m thanh lu&ocirc;n trong trẻo v&agrave; ch&acirc;n thực. Người d&ugrave;ng c&oacute; thể tận hưởng trọn vẹn từng giai điệu m&agrave; kh&ocirc;ng bị gi&aacute;n đoạn.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Am-thanh/Tai-nghe/Sony/tai-nghe-chup-tai-sony-wh-1000xm6-1_1.jpg" alt="Tai nghe chụp tai Sony WH-1000XM6 được trang bị c&ocirc;ng nghệ Adaptive NC Optimizer" loading="lazy"></p>
<p>Kh&ocirc;ng dừng lại ở khả năng chống ồn chủ động, Adaptive NC Optimizer c&ograve;n tinh chỉnh &acirc;m thanh theo cấu tr&uacute;c tai v&agrave; &aacute;p suất kh&iacute; quyển của từng người d&ugrave;ng. Nhờ đ&oacute;, tai nghe Sony WH-1000XM6 tạo n&ecirc;n trải nghiệm &acirc;m nhạc tuyệt vời đến từng chi tiết.&nbsp;</p>
<h3 id="tich-hop-mic-dam-thoai-tien-loi"><strong>T&iacute;ch hợp mic đ&agrave;m thoại tiện lợi</strong></h3>
<p>Tai nghe chụp tai Sony WH-1000XM6 nổi bật với t&iacute;nh năng t&iacute;ch hợp mic đ&agrave;m thoại tiện lợi, cho ph&eacute;p người d&ugrave;ng dễ d&agrave;ng quản l&yacute; c&aacute;c cuộc gọi m&agrave; kh&ocirc;ng cần phải th&aacute;o tai nghe. Microphone chất lượng cao gi&uacute;p thu &acirc;m r&otilde; r&agrave;ng, đảm bảo giao tiếp mượt m&agrave; ngay cả trong m&ocirc;i trường ồn &agrave;o.&nbsp;</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Am-thanh/Tai-nghe/Sony/tai-nghe-chup-tai-sony-wh-1000xm6-2_1.jpg" alt="Tai nghe chụp tai Sony WH-1000XM6 nổi bật với t&iacute;nh năng t&iacute;ch hợp mic đ&agrave;m thoại tiện lợi" loading="lazy"></p>
<p>Đặc biệt, người d&ugrave;ng c&oacute; thể dễ d&agrave;ng chuyển đổi giữa nghe nhạc v&agrave; nhận cuộc gọi chỉ bằng một n&uacute;t chạm, gi&uacute;p tiết kiệm thời gian v&agrave; n&acirc;ng cao t&iacute;nh linh hoạt. Nhờ v&agrave;o c&ocirc;ng nghệ kết nối Bluetooth ổn định, tai nghe Sony WH-1000XM6 mang đến trải nghiệm li&ecirc;n lạc mượt m&agrave; v&agrave; chất lượng.&nbsp;</p>
<h3 id="thoi-luong-pin-su-dung-len-den-40-gio"><strong>Thời lượng pin sử dụng l&ecirc;n đến 40 giờ</strong></h3>
<p>Tai nghe chụp tai Sony WH-1000XM6 mang đến thời lượng pin ấn tượng l&ecirc;n đến 40 giờ, cho ph&eacute;p bạn thưởng thức &acirc;m nhạc, phim ảnh hay đ&agrave;m thoại xuy&ecirc;n suốt nhiều ng&agrave;y. Đ&acirc;y l&agrave; lựa chọn l&yacute; tưởng cho những ai thường xuy&ecirc;n di chuyển hoặc cần tai nghe hoạt động ổn định cả ng&agrave;y d&agrave;i. Chỉ cần sạc một lần, bạn c&oacute; thể y&ecirc;n t&acirc;m sử dụng trong thời gian d&agrave;i.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Am-thanh/Tai-nghe/Sony/tai-nghe-chup-tai-sony-wh-1000xm6-3_1.jpg" alt="Tai nghe chụp tai Sony WH-1000XM6 mang đến thời lượng pin ấn tượng l&ecirc;n đến 40 giờ" loading="lazy"></p>
<p>B&ecirc;n cạnh thời lượng pin vượt trội, tai nghe Sony WH-1000XM6 c&ograve;n hỗ trợ c&ocirc;ng nghệ sạc nhanh tiện lợi với thời gian sạc đầy chỉ khoảng 3 giờ. Do đ&oacute;, bạn c&oacute; thể dễ d&agrave;ng nạp đầy năng lượng để tiếp tục trải nghiệm &acirc;m nhạc m&agrave; kh&ocirc;ng phải chờ đợi l&acirc;u. Sự kết hợp giữa pin tr&acirc;u v&agrave; tốc độ sạc nhanh gi&uacute;p tai nghe lu&ocirc;n sẵn s&agrave;ng cho mọi h&agrave;nh tr&igrave;nh.</p>
<h3 id="dieu-khien-tien-loi-qua-ung-dung-sound-connect"><strong>Điều khiển tiện lợi qua ứng dụng Sound Connect</strong></h3>
<p>Tai nghe chụp tai Sony WH-1000XM6 được trang bị c&ocirc;ng nghệ Bluetooth 5.3 ti&ecirc;n tiến, cho kết nối ổn định v&agrave; tốc độ truyền tải &acirc;m thanh nhanh ch&oacute;ng trong phạm vi l&ecirc;n đến 10m. B&ecirc;n cạnh kết nối kh&ocirc;ng d&acirc;y, sản phẩm c&ograve;n hỗ trợ jack 3.5mm linh hoạt, ph&ugrave; hợp cho nhiều thiết bị kh&aacute;c nhau. Nhờ đ&oacute;, bạn c&oacute; thể dễ d&agrave;ng chuyển đổi giữa c&aacute;c chế độ kết nối theo nhu cầu.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/Am-thanh/Tai-nghe/Sony/tai-nghe-chup-tai-sony-wh-1000xm6-4.jpg" alt="Điều khiển tiện lợi qua ứng dụng Sound Connect" loading="lazy"></p>
<p>Th&ocirc;ng qua ứng dụng Sound Connect, người d&ugrave;ng c&oacute; thể điều chỉnh &acirc;m thanh, chế độ chống ồn v&agrave; nhiều t&iacute;nh năng th&ocirc;ng minh chỉ với v&agrave;i thao t&aacute;c chạm. Giao diện th&acirc;n thiện, dễ sử dụng gi&uacute;p trải nghiệm trở n&ecirc;n tiện lợi v&agrave; trực quan hơn bao giờ hết. Tai nghe Sony WH-1000XM6 kh&ocirc;ng chỉ hiện đại về c&ocirc;ng nghệ m&agrave; c&ograve;n linh hoạt trong c&aacute;ch điều khiển.</p>
</div>', '1000000', '100000', '9000000', '3000000', '2026-01-16T23:25:00.000Z', 1, 20, '2026-01-04T23:26:19.802Z', true, true, '''1'':94 ''10'':279 ''1000xm5'':120,358,381,626,691,801 ''1000xm6'':9,17,105,115,131,214,231,235,353,372,608,718,735,750,838,886,1004,1069,1187,1217,1337,1367,1460,1551,1699 ''10m'':1584 ''2'':106 ''20'':387 ''21.67'':400 ''25.69'':393 ''250'':408 ''254g'':407 ''27.62'':397 ''3'':123,1479 ''3.1'':141 ''3.2'':152 ''3.3'':161 ''3.4'':176 ''3.5'':186,330,489,491,1601 ''3.6'':197 ''30'':319,506,522 ''30mm'':48 ''360'':285,436,479 ''4'':207 ''40'':71,195,501,514,1358,1378 ''5.3'':1559 ''6'':295 ''7.59'':403 ''7.83'':390 ''a'':971 ''aac'':478 ''active'':466 ''adaptiv'':482 ''adaptive'':26,173,418,1059,1076,1156 ''ai'':704,1409 ''alexa'':589 ''ambient'':475 ''anc'':511,519 ''audio'':435,438,463,481 ''auido'':287 ''auto'':952 ''b'':301,1447,1585 ''bao'':1691 ''bay'':1102 ''biến'':554,1091 ''biết'':1023,1033 ''biệt'':678,1283 ''bluetooth'':3,366,375,1329,1558 ''bạn'':76,1032,1097,1383,1433,1483,1616 ''bảo'':1115,1269 ''bấm'':530 ''bật'':13,19,248,503,516,1219 ''bắt'':575,1044 ''bằng'':581,1302 ''bền'':314 ''bỉ'':315 ''bị'':1015,1038,1072,1141,1554,1610 ''bọc'':763 ''bỏ'':32 ''bộ'':442 ''bớt'':977 ''c'':21,43,170,281,321,334,410,415,484,485,542,648,677,724,791,839,849,851,921,937,946,958,1005,1016,1019,1056,1073,1105,1129,1159,1168,1244,1245,1287,1324,1434,1461,1465,1484,1555,1596,1612,1617,1625,1626,1644,1668,1706,1710,1715 ''cancelling'':468 ''cao'':294,392,402,712,961,1260,1316 ''cellphones'':220 ''ch'':58,80,92,166,178,327,383,446,559,872,964,1052,1123,1202,1225,1576,1716 ''chat'':913 ''chi'':121,359,1199 ''chiếc'':816 ''cho'':73,874,1029,1233,1380,1407,1529,1563,1607 ''chu'':1041 ''chung'':598 ''chuyển'':1292,1414,1622 ''chuyện'':578,924,934 ''chưa'':693 ''chạm'':537,1306,1669 ''chất'':217,292,630,1258,1348 ''chế'':424,452,543,1627,1650 ''chỉ'':329,1301,1428,1477,1662,1702 ''chỉnh'':148,275,831,888,1162,1647 ''chịu'':779 ''chọn'':268,721,1404 ''chống'':24,469,499,504,509,517,566,632,710,1083,1152,1652 ''chờ'':1504 ''chụp'':4,126,241,367,376,730,796,1064,1212,1362,1546 ''chủ'':1154 ''chức'':908 ''cm'':388,391,394,398,401,404 ''codec'':464,473,477,667 ''connect'':206,552,1543,1640 ''cuộc'':922,932,1246,1299 ''cũng'':663,973 ''cơ'':423,451 ''cường'':426,454 ''cạnh'':1449,1587 ''cả'':1275,1423 ''cải'':612,657 ''cảm'':533,535,553,639 ''cấp'':699,713 ''cất'':862 ''cấu'':1166 ''cần'':1251,1416,1429 ''cầu'':1633 ''cận'':556 ''cổng'':486 ''của'':793,1024,1175 ''d'':88,266,385,395,512,520,603,752,898,1096,1127,1178,1237,1240,1285,1290,1426,1445,1487,1592,1620,1642 ''da'':767 ''di'':1413 ''diện'':1671 ''do'':1481 ''dsee'':421,449 ''dual'':551 ''dung'':91 ''dưới'':808 ''dải'':280 ''dễ'':996,998,1239,1289,1486,1619,1675 ''dụng'':191,204,272,317,344,496,688,1354,1441,1541,1638,1677 ''dừng'':572,918,1147 ''dựa'':891 ''engine'':441 ''eq'':278 ''equalizer'':439 ''extreme'':422,450 ''fast'':549 ''g'':409 ''gi'':29,215,569,618,900,974,1142,1261,1307,1520,1678 ''giai'':1136 ''gian'':636,1312,1444,1474 ''giao'':1270,1670 ''giảm'':962 ''giọng'':582 ''giới'':879 ''giờ'':72,196,320,331,502,507,515,523,1359,1379,1480,1692 ''giữa'':1294,1511,1624 ''google'':588 ''gập'':336 ''gọi'':1247,1300 ''gọn'':337,863 ''h'':590,802,894,1531 ''hay'':1107,1390 ''hd'':471 ''hi'':433,461 ''hi-res'':432,460 ''hiểu'':812 ''hiện'':869,1703 ''hiệu'':35,992 ''hoạt'':1320,1419,1604,1713 ''hoặc'':1415 ''hơn'':61,642,671,727,814,1690 ''hưởng'':163,1049,1132 ''hấp'':999 ''hết'':956,1693 ''hệ'':622 ''hồi'':638 ''hỗ'':665,914,1463,1598 ''hợp'':179,447,873,907,1203,1226,1510,1606 ''hữu'':66,244 ''i'':40,89,146,386,396,584,655,662,829,856,965,1094,1278,1427,1446,1665 ''jack'':1600 ''k'':382 ''kh'':42,541,601,646,676,679,769,773,778,1139,1145,1173,1249,1501,1590,1611,1700 ''khi'':574,857,920,931 ''khiển'':199,527,580,1536,1718 ''khoảng'':1478 ''khả'':305,323,1006,1020,1081,1150 ''khử'':153,938 ''kiệm'':1310 ''kế'':143,251,333,644,786,826,841 ''kết'':136,157,487,740,935,942,1008,1045,1327,1509,1564,1588,1629 ''kỹ'':429,457 ''l'':192,236,258,444,532,561,719,751,764,782,1018,1036,1243,1355,1375,1402,1405,1506,1581 ''ldac'':474 ''li'':1342 ''linh'':1319,1603,1712 ''loa'':47 ''loại'':31 ''lu'':1118,1524 ''lượng'':68,188,218,293,406,494,631,1259,1349,1351,1371,1451,1492 ''lạc'':1344 ''lại'':304,928,1148 ''lấy'':771 ''lần'':1432 ''lọc'':132,297,568,736,949,955,976,991 ''lớn'':682 ''lợi'':185,201,339,861,1209,1232,1471,1538,1686 ''lứa'':876 ''lựa'':720,1403 ''lực'':777 ''m'':34,39,45,51,81,83,145,164,182,276,283,290,299,308,413,427,455,545,661,668,707,765,768,806,828,848,850,855,864,889,905,957,968,987,994,1050,1093,1116,1138,1163,1193,1206,1229,1248,1264,1273,1277,1346,1386,1392,1439,1498,1500,1573,1648,1709 ''mang'':49,303,340,609,1079,1338,1368 ''mic'':180,1204,1227 ''micro'':296,483,565 ''microphone'':1257 ''minh'':140,151,744,834,1087,1661 ''mm'':490,492,1602 ''mua'':99,208,225,269 ''mượt'':847,1272,1345 ''mại'':757 ''mềm'':756,972 ''mọi'':875,878,1530 ''mỗi'':300 ''một'':259,978,1303,1431 ''mới'':670,714,819 ''n'':59,97,98,167,193,223,224,302,311,528,583,597,674,683,684,697,702,725,823,893,1053,1101,1104,1119,1124,1143,1160,1189,1190,1304,1314,1343,1356,1376,1395,1412,1437,1448,1462,1525,1561,1582,1586,1597,1673,1683,1684,1711 ''nc'':27,174,419,953,1060,1077,1157 ''ng'':22,46,86,139,150,171,263,267,282,322,328,362,411,416,513,521,586,591,602,617,647,680,698,723,743,753,760,774,792,833,899,947,1017,1042,1057,1074,1086,1110,1128,1140,1146,1179,1238,1241,1250,1267,1286,1291,1315,1325,1398,1424,1466,1488,1502,1528,1556,1577,1591,1621,1635,1643,1660,1701,1707 ''ngay'':930,1047,1274 ''nghe'':2,64,101,111,125,210,227,240,349,365,374,600,709,729,746,755,795,818,883,997,1026,1063,1112,1183,1211,1256,1295,1333,1361,1418,1456,1523,1545,1695 ''nghiệm'':57,289,1192,1341,1497,1681 ''nghệ'':23,172,412,417,948,1058,1075,1326,1467,1557,1708 ''ngo'':654 ''người'':265,897,1126,1177,1236,1284,1641 ''nh'':93,109,254,347,539,596,759,790,821,881,895,1222,1318,1532,1534,1657 ''nhanh'':326,564,641,1469,1519,1575 ''nhau'':44,1613 ''nhi'':673,701 ''nhiều'':38,245,611,649,1013,1397,1608,1655 ''nhiễu'':981 ''nhu'':1632 ''như'':664 ''nhưng'':615,656 ''nhạc'':84,573,919,929,1194,1296,1387,1499 ''nhất'':694,820 ''nhận'':1022,1298 ''nhắc'':726 ''nhẹ'':758,995 ''nhỏ'':614 ''nhờ'':985,1180,1321,1614 ''những'':1408 ''noise'':467 ''năng'':255,306,324,540,909,1007,1021,1082,1151,1223,1491,1658 ''nạp'':1489 ''nếu'':685 ''nối'':137,158,488,741,943,1009,1046,1328,1565,1589,1630 ''nổi'':12,18,247,1218 ''nội'':90 ''nữa'':62 ''o'':1254,1281,1323 ''optimizer'':28,175,420,954,1061,1078,1158 ''p'':30,75,776,901,975,1031,1171,1235,1262,1308,1382,1521,1679 ''pair'':550 ''ph'':74,902,926,1030,1106,1109,1234,1381,1605 ''phim'':1388 ''phương'':524 ''phạm'':1579 ''phải'':696,1252,1503 ''phản'':637 ''phần'':762,969,979 ''phẩm'':238,261,785,1595 ''pin'':69,189,313,497,1352,1372,1452,1512 ''qn1'':472 ''qu'':681,1103 ''qua'':202,587,1539,1636 ''quan'':1689 ''quanh'':548,984 ''quyển'':1174 ''quả'':36,993 ''quản'':1242 ''r'':310,813,970,1265,1266 ''ra'':904 ''reality'':286,437,480 ''res'':434,462 ''rất'':853,1027 ''rẻ'':216 ''rộng'':389,399 ''s'':108,346,1100,1527 ''sao'':96,222 ''sau'':788 ''sbc'':465 ''sense'':440 ''si'':783 ''so'':107,345,619 ''sony'':6,14,102,112,117,128,211,228,232,350,355,369,378,594,595,605,732,747,798,822,835,1001,1066,1184,1214,1334,1364,1457,1548,1696 ''sound'':205,476,1542,1639 ''speak'':911 ''speak-to-chat'':910 ''suất'':1172 ''suốt'':85,1396 ''sạc'':325,563,1430,1468,1475,1518 ''sản'':237,260,592,1594 ''sắc'':135,156,739,866,941 ''sẵn'':1526 ''số'':363,431,459,960 ''sở'':65,243 ''sức'':78 ''sử'':190,271,316,343,495,687,1353,1440,1676 ''sự'':675,1508 ''t'':177,253,273,312,445,529,538,706,770,880,903,927,1089,1201,1221,1224,1305,1317,1438,1656,1667 ''tai'':1,5,63,100,110,124,127,209,226,239,242,348,364,368,373,377,599,708,728,731,745,754,794,797,882,1025,1062,1065,1111,1169,1182,1210,1213,1255,1332,1360,1363,1417,1455,1522,1544,1547,1694 ''th'':138,149,361,558,585,692,715,742,789,832,871,936,1085,1253,1634,1659,1672 ''thanh'':52,165,277,284,291,414,428,456,546,669,845,890,906,988,990,1051,1117,1164,1574,1649 ''thao'':1666 ''thay'':650 ''theo'':341,1092,1165,1631 ''thiết'':142,250,332,643,695,825,840,1014,1037,1609 ''thiện'':658,1674 ''thoại'':183,309,1207,1230,1393 ''thoải'':144,660,827,854 ''thu'':1263 ''thuật'':430,458 ''thước'':384 ''thường'':1410 ''thưởng'':1384 ''thế'':621 ''thể'':335,1130,1288,1435,1485,1618,1645 ''thỏa'':77 ''thời'':67,187,493,635,1311,1350,1370,1443,1450,1473 ''thụ'':1000 ''thức'':525,1385 ''thực'':60,168,1054,1125 ''ti'':1560 ''tinh'':842,1161 ''tiến'':613,1562 ''tiếng'':950,963,980 ''tiếp'':787,1271,1494 ''tiết'':122,360,1200,1309 ''tiệm'':555 ''tiện'':184,200,338,860,1208,1231,1470,1537,1685 ''to'':912 ''tr'':577,892,923,933,1167,1513,1533 ''trang'':1071,1553 ''treo'':852 ''trong'':37,53,82,1120,1276,1442,1578,1714 ''trung'':628,868 ''truyền'':1571 ''trước'':623 ''trường'':41,1095,1279 ''trượt'':846 ''trải'':56,288,1191,1340,1496,1680 ''trẻ'':867 ''trẻo'':54,1121 ''trọn'':1133 ''trọng'':405 ''trội'':1454 ''trở'':1682 ''trợ'':560,666,915,1464,1599 ''trực'':1688 ''tuy'':672,700 ''tuyệt'':1195 ''tuổi'':877 ''tăng'':425,453 ''tương'':557 ''tưởng'':1406 ''tượng'':1374 ''tại'':219,817 ''tạo'':775,1188 ''tạp'':33,298,967 ''tả'':807 ''tải'':1572 ''tần'':959 ''tận'':162,1048,1131 ''tập'':627 ''tắt'':498,508 ''tế'':843 ''tốc'':1516,1569 ''tốt'':1028 ''tục'':1495 ''từ'':766 ''từng'':1135,1176,1198 ''tự'':570,916 ''u'':784,865,1035,1507,1514 ''v'':55,95,221,270,342,634,859,925,966,1043,1088,1122,1170,1297,1313,1322,1347,1515,1568,1654,1664,1687 ''v1'':448 ''vi'':896,1580 ''văn'':1108 ''vượt'':1453 ''vẫn'':1113 ''vật'':531 ''vậy'':986 ''vẹn'':1134 ''vẻ'':653 ''về'':249,652,815,1705 ''với'':20,116,169,354,620,703,761,844,1012,1055,1220,1472,1663 ''vời'':1196 ''wh'':8,16,104,114,119,130,213,230,234,352,357,371,380,607,625,690,717,734,749,800,837,885,1003,1068,1186,1216,1336,1366,1459,1550,1698 ''wh-1000xm5'':118,356,379,624,689,799 ''wh-1000xm6'':7,15,103,113,129,212,229,233,351,370,606,716,733,748,836,884,1002,1067,1185,1215,1335,1365,1458,1549,1697 ''xem'':804 ''xm6'':645 ''xung'':547,983 ''xuy'':1394,1411 ''xuất'':134,155,593,738,940 ''xử'':443 ''y'':87,257,274,604,781,803,810,824,1090,1399,1401,1425,1436,1593 ''đ'':181,256,262,307,616,722,780,809,1034,1181,1205,1228,1391,1400,1482,1615 ''đa'':159,944,1010 ''đang'':686,705,1039,1098 ''đeo'':858 ''điều'':147,198,526,579,830,887,1535,1646,1717 ''điểm'':11,160,246,945,1011 ''điệu'':1137 ''đoạn'':805,1144 ''được'':989,1070,1552 ''đại'':870,1704 ''đảm'':1114,1268 ''đầu'':576,772 ''đầy'':1476,1490 ''đắm'':79 ''đặc'':10,1282 ''đến'':50,70,194,252,318,610,1080,1197,1339,1357,1369,1377,1583 ''để'':264,811,1493 ''định'':1331,1422,1567 ''đổ'':1040 ''đổi'':651,1293,1623 ''độ'':544,659,1517,1570,1628,1651 ''động'':571,917,1155,1420 ''đợi'':1505 ''ảnh'':1389 ''ảo'':562 ''ấn'':1373 ''ồn'':25,133,154,470,500,505,510,518,567,633,711,737,939,951,982,1084,1153,1280,1653 ''ổn'':1330,1421,1566 ''ở'':629,1099,1149 ''ứng'':203,534,536,640,1540,1637'),
  (167, 'MacBook Pro 14 M5 10CPU 10GPU 16GB 512GB | Chính hãng Apple Việt Nam', 17, 7, '<h2 class="ksp-title">Đặc điểm nổi bật</h2>
<div class="ksp-content">
<p><strong>Macbook Pro 14 inch chip M5 16GB 512GB&nbsp;</strong>trang bị chip M5, RAM 16GB c&ugrave;ng ổ cứng SSD 512GB, mang đến hiệu năng mạnh mẽ v&agrave; đa nhiệm mượt m&agrave; trong mọi t&aacute;c vụ. M&aacute;y trang bị m&agrave;n h&igrave;nh Liquid Retina XDR 14.2 inch sắc n&eacute;t v&agrave; hỗ trợ ProMotion 120Hz. Mẫu Macbook Pro n&agrave;y c&ograve;n sở hữu hệ điều h&agrave;nh macOS Tahoe mới t&iacute;ch hợp Apple Intelligence.</p>
</div>
<div class="table-content" data-v-1bddbad4="">
<div class="table-content__title" data-v-1bddbad4="">
<p data-v-1bddbad4="">Nội dung ch&iacute;nh</p>
</div>
<div class="table-content__wrapper" data-v-1bddbad4="">
<div class="table-content__list" data-v-1bddbad4=""><a class="table-content__item level-2" href="https://cellphones.com.vn/macbook-pro-14-inch-m5-16gb-512gb.html#macbook-pro-14-inch-chip-m5-16gb-512gb--hieu-nang-dot-pha" data-v-1bddbad4="">1. Macbook Pro 14 inch chip M5 16GB 512GB &ndash; Hiệu năng đột ph&aacute;</a><a class="table-content__item level-3" href="https://cellphones.com.vn/macbook-pro-14-inch-m5-16gb-512gb.html#apple-intelligence-toi-uu-hieu-suat" data-v-1bddbad4="">1.1. Apple Intelligence tối ưu hiệu suất</a><a class="table-content__item level-3" href="https://cellphones.com.vn/macbook-pro-14-inch-m5-16gb-512gb.html#bo-nho-ram-16gb-va-luu-tru-hieu-qua" data-v-1bddbad4="">1.2. Bộ nhớ RAM 16GB v&agrave; lưu trữ hiệu quả</a><a class="table-content__item level-3" href="https://cellphones.com.vn/macbook-pro-14-inch-m5-16gb-512gb.html#thiet-ke-khung-nhom-sang-trong-than-thien-moi-truong" data-v-1bddbad4="">1.3. Thiết kế khung nh&ocirc;m sang trọng, th&acirc;n thiện m&ocirc;i trường</a><a class="table-content__item level-3" href="https://cellphones.com.vn/macbook-pro-14-inch-m5-16gb-512gb.html#nhanh-hon-thong-minh-hon-voi-chip-m5" data-v-1bddbad4="">1.4. Nhanh hơn, th&ocirc;ng minh hơn với chip M5</a><a class="table-content__item level-3" href="https://cellphones.com.vn/macbook-pro-14-inch-m5-16gb-512gb.html#lam-viec-suot-ngay-khong-can-lo-sac" data-v-1bddbad4="">1.5. L&agrave;m việc suốt ng&agrave;y, kh&ocirc;ng cần lo sạc</a><a class="table-content__item level-2" href="https://cellphones.com.vn/macbook-pro-14-inch-m5-16gb-512gb.html#so-sanh-macbook-pro-14-inch-chip-m5-voi-chip-m4-chi-tiet" data-v-1bddbad4="">2. So s&aacute;nh Macbook Pro 14 inch chip M5 với chip M4 chi tiết</a><a class="table-content__item level-2" href="https://cellphones.com.vn/macbook-pro-14-inch-m5-16gb-512gb.html#mua-ngay-macbook-pro-14-inch-chip-m5-16gb-512gb-chinh-hang-uy-tin-tai-cellphones" data-v-1bddbad4="">3. Mua ngay Macbook Pro 14 inch chip M5 16GB 512GB ch&iacute;nh h&atilde;ng, uy t&iacute;n tại CellphoneS</a></div>
</div>
</div>
<div id="cpsContentSEO">
<h2 id="macbook-pro-14-inch-chip-m5-16gb-512gb--hieu-nang-dot-pha"><strong>Macbook Pro 14 inch chip M5 16GB 512GB &ndash; Hiệu năng đột ph&aacute;</strong></h2>
<p><strong>Macbook Pro 14 inch&nbsp;</strong>&nbsp;l&agrave; lựa chọn l&yacute; tưởng cho người d&ugrave;ng chuy&ecirc;n nghiệp đang t&igrave;m kiếm hiệu năng mạnh mẽ v&agrave; khả năng tối ưu cao. Với cấu h&igrave;nh chip mới, thiết bị&nbsp;<a title="Macbook Pro chip M5" href="https://cellphones.com.vn/laptop/mac/macbook-pro/macbook-pro-2025.html" target="_blank" rel="noopener"><strong>Macbook Pro chip M5</strong></a>&nbsp;mang lại tốc độ xử l&yacute; nhanh hơn v&agrave; khả năng đồ họa ấn tượng.</p>
<h3 id="apple-intelligence-toi-uu-hieu-suat"><strong>Apple Intelligence tối ưu hiệu suất</strong></h3>
<p>Macbook Pro 14 inch n&agrave;y được x&acirc;y dựng như một nền tảng chuy&ecirc;n biệt cho tr&iacute; tuệ nh&acirc;n tạo, nhờ sự kết hợp giữa phần cứng, phần mềm v&agrave; hệ sinh th&aacute;i Apple. Chip M5 t&iacute;ch hợp Neural Engine 16 l&otilde;i c&ugrave;ng Neural Accelerators tr&ecirc;n GPU. Qua đ&oacute; mang đến khả năng xử l&yacute; c&aacute;c t&aacute;c vụ AI phức tạp v&agrave; gi&uacute;p tiết kiệm năng lượng.</p>
<p><strong>Macbook Pro 14 inch chip M5 16GB 512GB&nbsp;</strong>cho ph&eacute;p tạo nội dung nhanh, chỉnh sửa h&igrave;nh ảnh hoặc tự động h&oacute;a quy tr&igrave;nh c&ocirc;ng việc. B&ecirc;n cạnh đ&oacute;, hệ điều h&agrave;nh macOS Tahoe tối ưu h&oacute;a khả năng phối hợp giữa AI tr&ecirc;n thiết bị. Private Cloud Compute gi&uacute;p c&aacute;c m&ocirc; h&igrave;nh ng&ocirc;n ngữ lớn hoạt động linh hoạt v&agrave; bảo đảm ri&ecirc;ng tư.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/laptop/macbook/macbook-pro/M5/macbook-pro-chip-m5-16gb-512gb-5.jpg" alt="AI tr&ecirc;n Macbook Pro chip M5 16GB 512GB" loading="lazy"></p>
<p>Trải nghiệm mượt m&agrave; với Apple Intelligence</p>
<p>Nhờ nền tảng Apple Silicon v&agrave; khả năng tối ưu đa tầng, m&aacute;y&nbsp;<a title="Macbook M5" href="https://cellphones.com.vn/bo-loc/macbook-chip-m5" target="_blank" rel="noopener"><strong>Macbook M5</strong></a>&nbsp;c&oacute; thể vận h&agrave;nh c&aacute;c ứng dụng AI chuy&ecirc;n dụng. Hệ thống được thiết kế hướng đến học tập, s&aacute;ng tạo v&agrave; sản xuất nội dung. Qua đ&oacute;, mang lại hiệu quả cao cho những t&aacute;c vụ đ&ograve;i hỏi khả năng t&iacute;nh to&aacute;n v&agrave; xử l&yacute; dữ liệu lớn.</p>
<h3 id="bo-nho-ram-16gb-va-luu-tru-hieu-qua"><strong>Bộ nhớ RAM 16GB v&agrave; lưu trữ hiệu quả</strong></h3>
<p>Macbook Pro 14 inch chip M5 trang bị bộ nhớ 16GB, cho ph&eacute;p CPU, GPU v&agrave; Neural Engine truy cập c&ugrave;ng một kh&ocirc;ng gian dữ liệu m&agrave; kh&ocirc;ng cần sao ch&eacute;p qua lại. Cấu tr&uacute;c n&agrave;y gi&uacute;p giảm độ trễ, tăng tốc xử l&yacute; đồng thời, đặc biệt trong c&aacute;c t&aacute;c vụ đồ họa. Người d&ugrave;ng c&oacute; thể mở h&agrave;ng chục ứng dụng nặng c&ugrave;ng l&uacute;c m&agrave; hệ thống vẫn duy tr&igrave; độ ổn định.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/laptop/macbook/macbook-pro/M5/macbook-pro-chip-m5-16gb-512gb-1.jpg" alt="RAM tr&ecirc;n Macbook Pro chip M5 16GB 512GB" loading="lazy"></p>
<p>Mượt m&agrave; với 16GB RAM v&agrave; 512GB SSD</p>
<p>Ổ cứng SSD 512GB tr&ecirc;n&nbsp;<strong><a title="MacBook Pro 14 inch" href="https://cellphones.com.vn/bo-loc/macbook-pro-14-inch" target="_blank" rel="noopener">MacBook Pro 14 inch</a>&nbsp;chip M5 16GB 512GB&nbsp;</strong>c&oacute; tốc độ truy xuất cao, hỗ trợ qu&aacute; tr&igrave;nh khởi động, mở file v&agrave; xử l&yacute; dữ liệu diễn ra nhanh ch&oacute;ng. Dung lượng n&agrave;y đ&aacute;p ứng tốt nhu cầu lưu trữ của người d&ugrave;ng. Điều n&agrave;y cũng đồng thời đảm bảo sự c&acirc;n bằng giữa tốc độ, độ bền v&agrave; hiệu quả năng lượng.</p>
<h3 id="thiet-ke-khung-nhom-sang-trong-than-thien-moi-truong"><strong>Thiết kế khung nh&ocirc;m sang trọng, th&acirc;n thiện m&ocirc;i trường</strong></h3>
<p>Macbook Pro 14 inch M5 sở hữu thiết kế đặc trưng của Apple với khung nh&ocirc;m nguy&ecirc;n khối được chế t&aacute;c từ 100% vật liệu t&aacute;i chế. Vỏ m&aacute;y mang đến cảm gi&aacute;c cứng c&aacute;p, hiện đại v&agrave; th&acirc;n thiện m&ocirc;i trường. M&agrave;u sắc trang nh&atilde; to&aacute;t l&ecirc;n vẻ sang trọng, hiện đại v&agrave; chuy&ecirc;n nghiệp, xứng tầm với hiệu năng m&agrave; sản phẩm n&agrave;y mang lại.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/laptop/macbook/macbook-pro/M5/macbook-pro-chip-m5-16gb-512gb-2.jpg" alt="THiết kế Macbook Pro chip M5 16GB 512GB" loading="lazy"></p>
<p>Sản phẩm nổi bật với m&agrave;u Đen Kh&ocirc;ng Gian</p>
<p>M&agrave;n h&igrave;nh viền mỏng kết hợp c&ugrave;ng thiết kế Liquid Glass mang đến cảm gi&aacute;c rộng r&atilde;i v&agrave; tinh tế. B&agrave;n ph&iacute;m Magic Keyboard, trackpad lớn v&agrave; hệ thống tản nhiệt tối ưu gi&uacute;p qu&aacute; tr&igrave;nh sử dụng trở n&ecirc;n thoải m&aacute;i trong thời gian d&agrave;i. Macbook Pro 14 inch M5 kh&ocirc;ng chỉ l&agrave; c&ocirc;ng cụ l&agrave;m việc m&agrave; c&ograve;n l&agrave; thiết bị thể hiện đẳng cấp chuy&ecirc;n nghiệp.</p>
<h3 id="nhanh-hon-thong-minh-hon-voi-chip-m5"><strong>Nhanh hơn, th&ocirc;ng minh hơn với chip M5</strong></h3>
<p><strong><a title="Macbook Pro" href="https://cellphones.com.vn/laptop/mac/macbook-pro.html" target="_blank" rel="noopener">Macbook Pro</a>&nbsp;2025&nbsp;</strong>với Apple M5 đ&aacute;nh dấu bước tiến lớn với CPU v&agrave; GPU được thiết kế lại nhằm tăng hiệu quả xử l&yacute; đơn luồng v&agrave; đa luồng. GPU thế hệ mới t&iacute;ch hợp c&ocirc;ng cụ d&ograve; tia v&agrave; cơ chế Dynamic Caching. Qua đ&oacute;, gi&uacute;p cải thiện đ&aacute;ng kể tốc độ hiển thị h&igrave;nh ảnh v&agrave; hiệu suất đồ họa.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/laptop/macbook/macbook-pro/M5/macbook-pro-chip-m5-16gb-512gb-3.jpg" alt="Cấu h&igrave;nh Macbook Pro chip M5 16GB 512GB" loading="lazy"></p>
<p>N&acirc;ng tầm hiệu năng với chip Apple M5</p>
<p>Neural Engine 16 l&otilde;i mang đến khả năng xử l&yacute; AI gấp 6 lần so với thế hệ M1, hỗ trợ Apple Intelligence v&agrave; c&aacute;c ứng dụng s&aacute;ng tạo dựa tr&ecirc;n tr&iacute; tuệ nh&acirc;n tạo. Nhờ vậy, m&aacute;y phản hồi nhanh, đa nhiệm mượt m&agrave;, đồng thời duy tr&igrave; mức ti&ecirc;u thụ điện thấp. Đ&acirc;y l&agrave; một yếu tố cốt l&otilde;i trong hiệu năng bền vững m&agrave; Apple hướng tới.</p>
<h3 id="lam-viec-suot-ngay-khong-can-lo-sac"><strong>L&agrave;m việc suốt ng&agrave;y, kh&ocirc;ng cần lo sạc</strong></h3>
<p>Macbook Pro 14 inch M5 sở hữu thời lượng pin l&ecirc;n đến 24 giờ (Theo Apple c&ocirc;ng bố), tuy nhi&ecirc;n thực tế sẽ c&oacute; sự kh&aacute;c biệt t&ugrave;y v&agrave;o cường độ sử dụng của từng người d&ugrave;ng.</p>
<p>Đ&acirc;y l&agrave; mức sử dụng l&acirc;u d&agrave;i v&agrave; bền bỉ tr&ecirc;n Mac t&iacute;nh đến hiện tại. Nhờ khả năng quản l&yacute; năng lượng tối ưu của chip M5 v&agrave; macOS Tahoe, m&aacute;y duy tr&igrave; hiệu năng ổn định d&ugrave; đang sạc hay kh&ocirc;ng.</p>
<p><img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:100/plain/https://cellphones.com.vn/media/wysiwyg/laptop/macbook/macbook-pro/M5/macbook-pro-chip-m5-16gb-512gb-4.jpg" alt="Cổng kết nối Macbook Pro chip M5 16GB 512GB" loading="lazy"></p>
<p>M&aacute;y được trang bị cổng sạc&nbsp;USB-C</p>
<p>C&ocirc;ng nghệ sạc nhanh cho ph&eacute;p m&aacute;y đạt 50% dung lượng chỉ trong 30 ph&uacute;t, gi&uacute;p tiết kiệm thời gian đ&aacute;ng kể. Đ&acirc;y l&agrave; lựa chọn ph&ugrave; hợp cho người d&ugrave;ng chuy&ecirc;n nghiệp, thường xuy&ecirc;n di chuyển hoặc l&agrave;m việc ở m&ocirc;i trường ngo&agrave;i văn ph&ograve;ng.</p>
<h2 id="so-sanh-macbook-pro-14-inch-chip-m5-voi-chip-m4-chi-tiet"><strong>So s&aacute;nh Macbook Pro 14 inch chip M5 với chip M4 chi tiết</strong></h2>
<p><strong>Macbook Pro 14 inch chip M5 16GB 512GB&nbsp;</strong>ra mắt mang đến nhiều cải tiến so với thế hệ M4 trước đ&oacute;. Bảng dưới đ&acirc;y gi&uacute;p người d&ugrave;ng nh&igrave;n r&otilde; sự kh&aacute;c biệt giữa hai sản phẩm n&agrave;y:</p>
<table>
<tbody>
<tr>
<td>
<p><strong>Ti&ecirc;u ch&iacute;</strong></p>
</td>
<td>
<p><strong>MacBook Pro 14 inch chip M5 (14 inch)</strong></p>
</td>
<td>
<p><strong>MacBook Pro 14 inch&nbsp; chip M4 (14 inch)</strong></p>
</td>
</tr>
<tr>
<td>
<p><strong>CPU</strong></p>
</td>
<td>
<p>Apple M5 10 l&otilde;i (4 hiệu năng + 6 tiết kiệm điện), cải thiện tốc độ xử l&yacute; v&agrave; hiệu quả năng lượng</p>
</td>
<td>
<p>Apple M4 10 l&otilde;i (4 hiệu năng + 6 tiết kiệm điện)</p>
</td>
</tr>
<tr>
<td>
<p><strong>GPU</strong></p>
</td>
<td>
<p>CPU 10 l&otilde;i với 4 l&otilde;i hiệu năng v&agrave; 6 l&otilde;i tiết kiệm điện</p>
<p>Neural Accelerators</p>
<p>C&ocirc;ng nghệ d&ograve; tia tốc độ cao bằng phần cứng</p>
<p>Băng th&ocirc;ng bộ nhớ 153GB/s</p>
</td>
<td>
<p>CPU 10 l&otilde;i với 4 l&otilde;i hiệu năng v&agrave; 6 l&otilde;i tiết kiệm điện</p>
<p>C&ocirc;ng nghệ d&ograve; tia tốc độ cao bằng phần cứng</p>
<p>Băng th&ocirc;ng bộ nhớ 120GB/s</p>
</td>
</tr>
<tr>
<td>
<p><strong>Neural Engine</strong></p>
</td>
<td>
<p>16 l&otilde;i, tăng tốc độ xử l&yacute; AI, hỗ trợ Apple Intelligence</p>
</td>
<td>
<p>16 l&otilde;i, hỗ trợ Apple Intelligence</p>
</td>
</tr>
<tr>
<td>
<p><strong>RAM</strong></p>
</td>
<td>
<p>16GB Unified Memory&nbsp;</p>
</td>
<td>
<p>16GB Unified Memory</p>
</td>
</tr>
<tr>
<td>
<p><strong>Ổ cứng SSD</strong></p>
</td>
<td>
<p>512GB&nbsp;</p>
</td>
<td>
<p>512GB</p>
</td>
</tr>
<tr>
<td>
<p><strong>M&agrave;n h&igrave;nh</strong></p>
</td>
<td>
<p>Liquid Retina XDR 14.2 inch, HDR 1600 nit, hỗ trợ Liquid Glass giảm phản chiếu</p>
</td>
<td>
<p>Liquid Retina XDR 14.2 inch, 3024&times;1964 pixels, 120Hz, HDR 1600 nit</p>
</td>
</tr>
<tr>
<td>
<p><strong>&Acirc;m thanh</strong></p>
</td>
<td>
<p>6 loa, Dolby Atmos, micro chuẩn studio độ nhiễu thấp</p>
</td>
<td>
<p>6 loa, &Acirc;m thanh Kh&ocirc;ng Gian, Dolby Atmos</p>
</td>
</tr>
<tr>
<td>
<p><strong>Kết nối</strong></p>
</td>
<td>
<p>Wi-Fi 6E, Bluetooth 5.3, 3 cổng Thunderbolt 4, HDMI, SDXC, MagSafe 3</p>
</td>
<td>
<p>Wi-Fi 6E, Bluetooth 5.3, 3 cổng Thunderbolt 4, HDMI, SDXC, MagSafe 3</p>
</td>
</tr>
<tr>
<td>
<p><strong>Pin</strong></p>
</td>
<td>
<p>72.4Wh, thời lượng tương đương, chip M5 quản l&yacute; điện năng hiệu quả hơn</p>
</td>
<td>
<p>72.4Wh, xem video đến 24 giờ, sạc nhanh 50% trong 30 ph&uacute;t</p>
</td>
</tr>
</tbody>
</table>
<p>Nh&igrave;n tổng thể, MacBook Pro14 inch chip M5 kế thừa to&agrave;n bộ nền tảng vững chắc từ M4 nhưng được tinh chỉnh mạnh về AI, đồ họa v&agrave; khả năng quản l&yacute; năng lượng. Với c&aacute;c cải tiến n&agrave;y, Macbook Pro n&agrave;y đang trở th&agrave;nh lựa chọn đ&aacute;ng ch&uacute; &yacute;.</p>
</div>', '5000000', '100000', '5000000', '5100000', '2026-01-17T01:24:00.000Z', 1, 19, '2026-01-05T01:25:14.364Z', true, true, '''1'':100 ''1.1'':113 ''1.2'':120 ''1.3'':130 ''1.4'':144 ''1.5'':154 ''10'':1308,1331,1343,1379 ''100'':734 ''10cpu'':5 ''10gpu'':6 ''120gb/s'':1411 ''120hz'':74,1473 ''14'':3,20,103,172,186,203,215,278,356,524,627,711,861,1066,1233,1244,1291,1295,1299,1303 ''14.2'':65,1453,1468 ''153gb/s'':1377 ''16'':321,976,1414,1427 ''1600'':1456,1475 ''16gb'':7,24,31,107,124,190,207,360,516,532,614,631,1248,1435,1438 ''1964'':1471 ''2'':166 ''2025'':898 ''24'':1077,1549 ''3'':181,1506,1513,1520,1527 ''30'':1184,1555 ''3024'':1470 ''4'':1311,1334,1347,1383,1509,1523 ''5.3'':1505,1519 ''50'':1179,1553 ''512gb'':8,25,37,108,191,208,361,617,622,632,1249,1444,1445 ''6'':987,1314,1337,1353,1389,1479,1489 ''6e'':1503,1517 ''72.4'':1529,1544 ''a'':378,398 ''accelerators'':327,1360 ''ai'':344,404,465,985,1422,1584 ''apple'':11,94,114,270,313,438,443,721,900,972,996,1050,1080,1306,1329,1425,1432 ''atmos'':1482,1497 ''b'':385,826 ''biệt'':292,577,1094,1279 ''bluetooth'':1504,1518 ''băng'':1372,1406 ''bước'':905 ''bảng'':1264 ''bảo'':428,681 ''bật'':17,793 ''bằng'':685,1369,1403 ''bền'':690,1047,1119 ''bỉ'':1120 ''bị'':27,57,250,408,529,879,1162 ''bố'':1083 ''bộ'':121,513,530,1375,1409,1571 ''c'':32,52,80,324,339,340,342,382,414,415,456,461,462,496,543,562,579,580,582,589,598,601,633,683,732,747,749,809,819,868,875,934,999,1000,1081,1090,1093,1167,1168,1278,1361,1395,1595,1596 ''caching'':943 ''cao'':242,492,638,1368,1402 ''cellphones'':200 ''ch'':92,98,192,317,556,656,932,1288,1613 ''chi'':179,1240 ''chip'':22,28,105,152,174,177,188,205,247,253,314,358,526,629,894,971,1139,1235,1238,1246,1293,1301,1535,1565 ''chiếu'':1464 ''cho'':222,293,362,493,533,1173,1203 ''chuy'':226,290,466,775,884,1207 ''chuyển'':1214 ''chuẩn'':1484 ''chính'':9 ''chắc'':1575 ''chế'':730,739,941 ''chỉ'':866,1182 ''chỉnh'':369,1581 ''chọn'':219,1200,1610 ''chục'':594 ''cloud'':410 ''compute'':411 ''cpu'':536,909,1305,1342,1378 ''cũng'':677 ''cơ'':940 ''cường'':1099 ''cạnh'':387 ''cải'':948,1255,1318,1597 ''cảm'':745,817 ''cấp'':883 ''cấu'':244,560 ''cần'':163,554,1061 ''cầu'':667 ''cập'':542 ''cốt'':1041 ''cổng'':1163,1507,1521 ''cụ'':870,936 ''của'':670,720,1103,1138 ''cứng'':35,305,620,748,1371,1405,1442 ''d'':224,587,672,857,937,1106,1116,1152,1205,1271,1364,1398 ''di'':1213 ''diễn'':653 ''dolby'':1481,1496 ''dung'':97,367,485,658,1180 ''duy'':606,1027,1146 ''dynamic'':942 ''dưới'':1265 ''dấu'':904 ''dụng'':464,468,596,847,1002,1102,1113 ''dữ'':510,549,651 ''dựa'':1006 ''dựng'':285 ''engine'':320,540,975,1413 ''fi'':1502,1516 ''file'':647 ''gi'':348,412,565,746,818,841,946,1187,1268 ''gian'':548,800,856,1192,1495 ''giảm'':567,1462 ''giờ'':1078,1550 ''giữa'':303,403,686,1280 ''glass'':814,1461 ''gpu'':330,537,911,927,1341 ''gấp'':986 ''h'':60,86,194,245,371,377,391,397,417,459,592,803,957,1448 ''hai'':1281 ''hay'':1155 ''hdmi'':1510,1524 ''hdr'':1455,1474 ''hiển'':955 ''hiện'':751,772,881,1127 ''hiệu'':40,109,118,128,209,233,274,490,520,692,781,918,961,968,1045,1148,1312,1325,1335,1350,1386,1541 ''hoạt'':423,426 ''hoặc'':374,1215 ''hãng'':10 ''hơn'':146,150,262,888,892,1543 ''hướng'':474,1051 ''hệ'':84,309,389,469,603,835,929,992,1260 ''họa'':267,585,964,1586 ''học'':476 ''hỏi'':500 ''hồi'':1019 ''hỗ'':71,639,994,1423,1430,1458 ''hợp'':93,302,318,402,808,933,1202 ''hữu'':83,715,1070 ''i'':142,312,323,499,707,738,758,822,853,858,978,1043,1117,1221,1224,1310,1333,1345,1349,1355,1381,1385,1391,1416,1429 ''inch'':21,66,104,173,187,204,216,279,357,525,628,712,862,1067,1234,1245,1292,1296,1300,1304,1454,1469,1564 ''intelligence'':95,115,271,439,997,1426,1433 ''keyboard'':831 ''kh'':161,546,552,798,864,1059,1092,1156,1277,1493 ''khung'':133,698,723 ''khả'':238,264,335,399,446,501,981,1130,1588 ''khối'':728 ''khởi'':644 ''kiếm'':232 ''kiệm'':351,1190,1316,1339,1357,1393 ''kế'':132,473,697,717,812,914,1567 ''kết'':301,807,1498 ''kể'':952,1195 ''l'':155,217,220,260,322,338,509,573,600,650,767,867,871,877,921,977,984,1037,1042,1053,1074,1110,1114,1133,1198,1216,1309,1323,1332,1344,1348,1354,1380,1384,1390,1415,1421,1428,1538,1591 ''linh'':425 ''liquid'':62,813,1450,1460,1465 ''liệu'':511,550,652,736 ''lo'':164,1062 ''loa'':1480,1490 ''luồng'':923,926 ''lưu'':126,518,668 ''lượng'':353,659,695,1072,1135,1181,1328,1532,1593 ''lại'':256,489,559,789,915 ''lần'':988 ''lớn'':422,512,833,907 ''lựa'':218,1199,1609 ''m'':48,54,58,135,141,156,231,416,436,452,551,602,612,700,706,725,741,757,760,783,795,801,829,852,872,874,1016,1024,1049,1054,1144,1158,1176,1217,1220,1446,1477,1491 ''m1'':993 ''m4'':178,1239,1261,1302,1330,1577 ''m5'':4,23,29,106,153,175,189,206,254,315,359,455,527,630,713,863,895,901,973,1068,1140,1236,1247,1294,1307,1536,1566 ''mac'':1123 ''macbook'':1,18,76,101,170,184,201,213,251,276,354,454,522,625,709,859,896,1064,1231,1242,1289,1297,1562,1601 ''macos'':88,393,1142 ''magic'':830 ''magsafe'':1512,1526 ''mang'':38,255,333,488,743,788,815,979,1252 ''memory'':1437,1440 ''micro'':1483 ''minh'':149,891 ''mua'':182 ''mượt'':47,435,611,1023 ''mạnh'':42,235,1582 ''mẫu'':75 ''mắt'':1251 ''mẽ'':43,236 ''mềm'':307 ''mọi'':50 ''mỏng'':806 ''một'':287,545,1038 ''mới'':90,248,930 ''mở'':591,646 ''mức'':1029,1111 ''n'':59,68,78,81,139,198,227,280,291,297,329,386,406,420,467,506,563,624,660,675,684,704,727,755,768,776,786,802,827,849,850,876,885,965,1008,1012,1075,1086,1122,1208,1212,1274,1284,1447,1559,1570,1599,1603 ''nam'':13 ''neural'':319,326,539,974,1359,1412 ''ng'':33,148,159,162,195,225,325,383,419,431,479,544,547,553,588,593,599,657,673,799,810,865,869,890,935,951,966,1004,1057,1060,1082,1107,1157,1169,1194,1206,1227,1272,1362,1374,1396,1408,1494,1612 ''ngay'':183 ''nghiệm'':434 ''nghiệp'':228,777,886,1209 ''nghệ'':1170,1363,1397 ''ngo'':1223 ''nguy'':726 ''người'':223,586,671,1105,1204,1270 ''ngữ'':421 ''nh'':61,87,99,134,169,193,246,296,372,381,392,418,460,504,643,699,724,764,804,845,903,958,1011,1125,1230,1273,1449,1558,1608 ''nhanh'':145,261,368,655,887,1020,1172,1552 ''nhi'':1085 ''nhiều'':1254 ''nhiễu'':1487 ''nhiệm'':46,1022 ''nhiệt'':838 ''nhu'':666 ''như'':286 ''nhưng'':1578 ''nhằm'':916 ''nhớ'':122,514,531,1376,1410 ''nhờ'':299,440,1014,1129 ''những'':494 ''nit'':1457,1476 ''năng'':41,110,210,234,239,265,336,352,400,447,502,694,782,969,982,1046,1131,1134,1149,1313,1327,1336,1351,1387,1540,1589,1592 ''nặng'':597 ''nền'':288,441,1572 ''nối'':1499 ''nổi'':16,792 ''nội'':96,366,484 ''o'':1098 ''p'':349,364,413,535,557,566,663,750,842,947,1175,1188,1269 ''ph'':112,212,363,534,828,1174,1185,1201,1226,1556 ''phản'':1018,1463 ''phần'':304,306,1370,1404 ''phẩm'':785,791,1283 ''phối'':401 ''phức'':345 ''pin'':1073,1528 ''pixels'':1472 ''private'':409 ''pro'':2,19,77,102,171,185,202,214,252,277,355,523,626,710,860,897,1065,1232,1243,1290,1298,1602 ''pro14'':1563 ''promotion'':73 ''qu'':641,843 ''qua'':331,486,558,944 ''quy'':379 ''quả'':129,491,521,693,919,1326,1542 ''quản'':1132,1537,1590 ''r'':821,1275 ''ra'':654,1250 ''ram'':30,123,515,615,1434 ''retina'':63,1451,1466 ''ri'':430 ''rộng'':820 ''s'':168,478,1003,1229 ''sang'':136,701,770 ''sao'':555 ''sdxc'':1511,1525 ''silicon'':444 ''sinh'':310 ''so'':167,989,1228,1257 ''ssd'':36,618,621,1443 ''studio'':1485 ''suất'':119,275,962 ''suốt'':158,1056 ''sạc'':165,1063,1154,1164,1171,1551 ''sản'':482,784,790,1282 ''sắc'':67,762 ''sẽ'':1089 ''sở'':82,714,1069 ''sử'':846,1101,1112 ''sửa'':370 ''sự'':300,682,1091,1276 ''t'':51,69,91,197,230,316,341,495,503,581,731,737,766,931,1095,1124,1186,1557 ''tahoe'':89,394,1143 ''th'':138,147,311,703,754,889,1373,1407,1607 ''thanh'':1478,1492 ''theo'':1079 ''thiết'':131,249,407,472,696,716,811,878,913 ''thiện'':140,705,756,949,1319 ''thoải'':851 ''thunderbolt'':1508,1522 ''thường'':1210 ''thấp'':1034,1488 ''thế'':928,991,1259 ''thể'':457,590,880,1561 ''thị'':956 ''thống'':470,604,836 ''thời'':575,679,855,1026,1071,1191,1531 ''thụ'':1032 ''thừa'':1568 ''thực'':1087 ''ti'':1030,1286 ''tia'':938,1365,1399 ''tinh'':824,1580 ''tiến'':906,1256,1598 ''tiết'':180,350,1189,1241,1315,1338,1356,1392 ''to'':505,765,1569 ''tr'':294,328,380,405,561,607,623,642,844,1007,1009,1028,1121,1147 ''trackpad'':832 ''trang'':26,56,528,763,1161 ''trong'':49,578,854,1044,1183,1554 ''truy'':541,636 ''trưng'':719 ''trước'':1262 ''trường'':143,708,759,1222 ''trải'':433 ''trễ'':569 ''trọng'':137,702,771 ''trở'':848,1606 ''trợ'':72,640,995,1424,1431,1459 ''trữ'':127,519,669 ''tuy'':1084 ''tuệ'':295,1010 ''tăng'':570,917,1417 ''tư'':432 ''tương'':1533 ''tưởng'':221 ''tượng'':269 ''tại'':199,1128 ''tạo'':298,365,480,1005,1013 ''tạp'':346 ''tản'':837 ''tảng'':289,442,1573 ''tầm'':779,967 ''tầng'':451 ''tập'':477 ''tế'':825,1088 ''tố'':1040 ''tốc'':257,571,634,687,953,1320,1366,1400,1418 ''tối'':116,240,272,395,448,839,1136 ''tốt'':665 ''tổng'':1560 ''tới'':1052 ''từ'':733,1576 ''từng'':1104 ''tự'':375 ''u'':761,796,1031,1115,1287 ''unified'':1436,1439 ''usb'':1166 ''usb-c'':1165 ''uy'':196 ''v'':44,70,125,237,263,308,347,427,445,481,507,517,538,616,648,691,753,774,823,834,910,924,939,960,998,1097,1118,1141,1324,1352,1388,1587 ''video'':1547 ''viền'':805 ''việc'':157,384,873,1055,1218 ''việt'':12 ''văn'':1225 ''vẫn'':605 ''vận'':458 ''vật'':735 ''vậy'':1015 ''vẻ'':769 ''về'':1583 ''vỏ'':740 ''với'':151,176,243,437,613,722,780,794,893,899,908,970,990,1237,1258,1346,1382,1594 ''vụ'':53,343,497,583 ''vững'':1048,1574 ''wh'':1530,1545 ''wi'':1501,1515 ''wi-fi'':1500,1514 ''x'':283 ''xdr'':64,1452,1467 ''xem'':1546 ''xuy'':1211 ''xuất'':483,637 ''xứng'':778 ''xử'':259,337,508,572,649,920,983,1322,1420 ''y'':55,79,160,281,284,453,564,661,676,742,787,1017,1036,1058,1096,1109,1145,1159,1177,1197,1267,1285,1600,1604 ''yếu'':1039 ''đ'':332,388,487,498,662,902,945,950,1035,1108,1193,1196,1263,1266,1611 ''đa'':45,450,925,1021 ''đang'':229,1153,1605 ''đen'':797 ''điều'':85,390,674 ''điểm'':15 ''điện'':1033,1317,1340,1358,1394,1539 ''đơn'':922 ''đương'':1534 ''được'':282,471,729,912,1160,1579 ''đại'':752,773 ''đạt'':1178 ''đảm'':429,680 ''đẳng'':882 ''đặc'':14,576,718 ''đến'':39,334,475,744,816,980,1076,1126,1253,1548 ''định'':610,1151 ''đồ'':266,584,963,1585 ''đồng'':574,678,1025 ''độ'':258,568,608,635,688,689,954,1100,1321,1367,1401,1419,1486 ''động'':376,424,645 ''đột'':111,211 ''ưu'':117,241,273,396,449,840,1137 ''ảnh'':373,959 ''ấn'':268 ''ổ'':34,619,1441 ''ổn'':609,1150 ''ở'':1219 ''ứng'':463,595,664,1001');

-- upgrade_requests: 3 rows
INSERT INTO upgrade_requests (id, user_id, created_at, status) VALUES
  (2, 17, '2025-12-19T14:47:48.678Z', 1),
  (3, 15, '2025-12-26T19:41:13.319Z', 1),
  (5, 14, '2026-01-05T01:33:55.238Z', 1);

