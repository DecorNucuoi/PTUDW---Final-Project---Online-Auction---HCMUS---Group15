# 🚀 HƯỚNG DẪN TẠO DATABASE TRÊN SUPABASE - CHI TIẾT TỪNG BƯỚC

> **Mục đích:** Tạo lại hoàn toàn database Online Auction System trên Supabase với đầy đủ cấu trúc và dữ liệu  
> **Thời gian ước tính:** 15-20 phút  
> **Yêu cầu:** Tài khoản Supabase (miễn phí hoặc trả phí)

---

## 📋 Tổng quan Database hiện tại

### 🗂️ Tables (14 bảng)
1. **users** - 8 users (admin, seller, bidder)
2. **categories** - 20 categories (Electronics, Fashion, Home...)
3. **products** - 120 sản phẩm đấu giá
4. **bids** - 637 lượt đấu giá
5. **product_images** - 476 hình ảnh sản phẩm
6. **product_desc_updates** - 10 cập nhật mô tả
7. **ratings** - 27 đánh giá
8. **transactions** - 8 giao dịch
9. **messages** - 18 tin nhắn
10. **questions** - 9 câu hỏi
11. **watchlists** - 2 watchlist
12. **product_bans** - 1 ban
13. **upgrade_requests** - 3 yêu cầu upgrade
14. **system_config** - 4 cấu hình

### 🔑 Constraints
- **14 PRIMARY KEYS**
- **2 UNIQUE constraints** (email, product per transaction)
- **24 FOREIGN KEYS** với ON DELETE CASCADE/SET NULL

### 📊 Indexes (35 indexes)
- **B-tree indexes**: Tăng tốc queries
- **GIN index**: Full-text search
- **Partial indexes**: WHERE conditions

### ⚙️ Functions & Triggers
- **3 functions**: search_vector, rating_cache, timestamp
- **5 triggers**: Auto-update

### 📦 Sequences (11)
- Auto-increment cho id columns

### 📈 Data
- **Tổng: 1,343 rows**

---

## 🎯 CÁC BƯỚC THỰC HIỆN (Step-by-Step)

### 📌 Chuẩn bị

1. **Đăng nhập Supabase**
   - Truy cập: https://supabase.com/dashboard
   - Đăng nhập hoặc tạo tài khoản mới (miễn phí)

2. **Tạo Project mới**
   - Click **"New Project"**
   - Điền thông tin:
     - **Name:** `online-auction-db` (hoặc tên khác)
     - **Database Password:** Đặt password mạnh và LUU LẠI
     - **Region:** Chọn `Southeast Asia (Singapore)` cho VN
   - Click **"Create new project"**
   - **Đợi 2-3 phút** để Supabase setup database

3. **Mở SQL Editor**
   - Sidebar bên trái → Click **"SQL Editor"**
   - Hoặc truy cập: `https://supabase.com/dashboard/project/YOUR_PROJECT_ID/sql`
   - Click **"New query"** để tạo query mới

---

### ✅ BƯỚC 1: Drop Tables & Tạo Sequences

**📁 File:** `01-drop-and-sequences.sql`

**Mục đích:**
- Xóa sạch database cũ (nếu đã có)
- Tạo 11 sequences cho auto-increment ID

**Chi tiết thực hiện:**

1. Mở file `01-drop-and-sequences.sql` bằng text editor
2. Copy **TOÀN BỘ** nội dung (Ctrl+A → Ctrl+C)
3. Quay lại Supabase SQL Editor
4. Paste vào query editor (Ctrl+V)
5. Click nút **"Run"** (hoặc Ctrl+Enter)
6. Đợi thông báo **"Success. No rows returned"**

**✅ Verify:**
```sql
-- Chạy query này để check sequences
SELECT sequence_name FROM information_schema.sequences 
WHERE sequence_schema = 'public'
ORDER BY sequence_name;
```
**Expected:** 11 sequences (bids_id_seq, categories_id_seq, messages_id_seq, ...)

**⚠️ Lỗi thường gặp:**
- `ERROR: cannot drop table ... because other objects depend on it`
  - **Giải pháp:** File đã có `CASCADE`, nhưng nếu vẫn lỗi thì chạy lại 1 lần nữa
- `ERROR: sequence ... does not exist`
  - **Giải pháp:** Bỏ qua, lần đầu chưa có sequence nào

---

### ✅ BƯỚC 2: Tạo Tables (14 bảng)

**📁 File:** `02-create-tables.sql`

**Mục đích:**
- Tạo 14 tables với đầy đủ columns, data types
- Chưa có constraints để tránh lỗi circular dependency

**Chi tiết thực hiện:**

1. Mở file `02-create-tables.sql`
2. Copy toàn bộ nội dung
3. Paste vào SQL Editor (Clear query cũ trước)
4. Click **"Run"**
5. Đợi **"Success. No rows returned"**

**✅ Verify:**
```sql
-- Check số lượng tables
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
  AND table_type = 'BASE TABLE'
ORDER BY table_name;
```
**Expected:** 14 tables

**Kiểm tra cấu trúc 1 table:**
```sql
SELECT column_name, data_type, column_default, is_nullable
FROM information_schema.columns
WHERE table_name = 'products'
ORDER BY ordinal_position;
```
**Expected:** 16 columns cho products (id, name, description, starting_price, ...)

**⚠️ Lỗi thường gặp:**
- `ERROR: relation "..." already exists`
  - **Giải pháp:** Table đã tồn tại, chạy lại BƯỚC 1 để drop
- `ERROR: syntax error at or near "..."`
  - **Giải pháp:** Copy lại file, đảm bảo không bị mất ký tự

---

### ✅ BƯỚC 3: Thêm Constraints

**📁 File:** `03-constraints.sql`

**Mục đích:**
- Thêm 14 PRIMARY KEYS
- Thêm 2 UNIQUE constraints
- Thêm 24 FOREIGN KEYS

**Chi tiết thực hiện:**

1. Mở file `03-constraints.sql`
2. Copy toàn bộ
3. Paste vào SQL Editor
4. Click **"Run"**
5. Đợi **"Success. No rows returned"**

**✅ Verify:**
```sql
-- Check PRIMARY KEYS
SELECT tc.table_name, tc.constraint_name, tc.constraint_type
FROM information_schema.table_constraints tc
WHERE tc.constraint_type = 'PRIMARY KEY' 
  AND tc.table_schema = 'public'
ORDER BY tc.table_name;
```
**Expected:** 14 PKs

```sql
-- Check FOREIGN KEYS
SELECT 
    tc.table_name,
    kcu.column_name,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
  ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage AS ccu
  ON ccu.constraint_name = tc.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY' 
  AND tc.table_schema = 'public'
ORDER BY tc.table_name, kcu.column_name;
```
**Expected:** 24 FKs

**⚠️ Lỗi thường gặp:**
- `ERROR: relation "..." does not exist`
  - **Giải pháp:** BƯỚC 2 chưa chạy, quay lại chạy BƯỚC 2
- `ERROR: constraint "..." already exists`
  - **Giải pháp:** Constraints đã có, bỏ qua hoặc chạy lại từ BƯỚC 1

---

### ✅ BƯỚC 4: Tạo Indexes (Performance)

**📁 File:** `04-indexes.sql`

**Mục đích:**
- Tạo 35 indexes để tăng tốc queries
- Bao gồm: B-tree indexes, GIN index (full-text), Partial indexes

**Chi tiết thực hiện:**

1. Mở file `04-indexes.sql`
2. Copy toàn bộ
3. Paste vào SQL Editor
4. Click **"Run"**
5. Đợi **"Success. No rows returned"** (có thể mất 10-20 giây)

**✅ Verify:**
```sql
-- Check tất cả indexes (trừ PK và UNIQUE)
SELECT 
    schemaname,
    tablename,
    indexname,
    indexdef
FROM pg_indexes
WHERE schemaname = 'public'
  AND indexname NOT LIKE '%_pkey'
  AND indexname NOT LIKE '%_key'
ORDER BY tablename, indexname;
```
**Expected:** Khoảng 33 indexes

```sql
-- Check GIN index cho full-text search
SELECT indexname, indexdef 
FROM pg_indexes 
WHERE indexname = 'idx_products_search_vector';
```
**Expected:** 1 GIN index

**💡 TIP:** Bước này có thể **SKIP** nếu:
- Chỉ muốn test database nhanh
- Chưa cần performance cao
- Có thể thêm indexes sau bất cứ lúc nào

**⚠️ Lỗi thường gặp:**
- `ERROR: relation "..." does not exist`
  - **Giải pháp:** Tables chưa có, chạy lại BƯỚC 2
- `ERROR: index "..." already exists`
  - **Giải pháp:** Indexes đã có, bỏ qua

---

### ✅ BƯỚC 5: Functions & Triggers

**📁 File:** `05-functions-triggers.sql`

**Mục đích:**
- Tạo 3 functions: search_vector, rating_cache, timestamp updates
- Tạo 5 triggers: Auto-update khi INSERT/UPDATE

**Chi tiết thực hiện:**

1. Mở file `05-functions-triggers.sql`
2. Copy toàn bộ
3. Paste vào SQL Editor
4. Click **"Run"**
5. Đợi **"Success. No rows returned"**

**✅ Verify:**
```sql
-- Check functions
SELECT routine_name, routine_type
FROM information_schema.routines
WHERE routine_schema = 'public'
  AND routine_type = 'FUNCTION'
ORDER BY routine_name;
```
**Expected:** 3 functions
- `update_product_search_vector`
- `update_transaction_timestamp`
- `update_user_rating_cache`

```sql
-- Check triggers
SELECT trigger_name, event_object_table, action_timing, event_manipulation
FROM information_schema.triggers
WHERE trigger_schema = 'public'
ORDER BY event_object_table, trigger_name;
```
**Expected:** 5 triggers

**⚠️ Lỗi thường gặp:**
- `ERROR: syntax error at or near "$function$"`
  - **Giải pháp:** File đã fix, có dấu `;` sau `$function$`
- `ERROR: function ... already exists`
  - **Giải pháp:** Functions đã có, bỏ qua hoặc chạy lại từ BƯỚC 1

---

### ✅ BƯỚC 6: Insert Data Core (32 rows)

**📁 File:** `06-data-core.sql`

**Mục đích:**
- Insert 8 users (admin, sellers, bidders)
- Insert 20 categories
- Insert 4 system_config

**⚠️ QUAN TRỌNG:** 
- Đây là **BASE DATA** không phụ thuộc table khác
- **PHẢI CHẠY TRƯỚC** BƯỚC 7 và 8
- Nếu bỏ qua sẽ gặp Foreign Key errors

**Chi tiết thực hiện:**

1. Mở file `06-data-core.sql`
2. Copy toàn bộ
3. Paste vào SQL Editor
4. Click **"Run"**
5. Đợi **"Success. No rows returned"**

**✅ Verify:**
```sql
SELECT 'users' as table_name, COUNT(*) as row_count FROM users
UNION ALL
SELECT 'categories', COUNT(*) FROM categories
UNION ALL
SELECT 'system_config', COUNT(*) FROM system_config;
```
**Expected:**
- users: 8 rows
- categories: 20 rows
- system_config: 4 rows

**Kiểm tra users:**
```sql
SELECT id, username, email, role, rating_cache 
FROM users 
ORDER BY id;
```
**Expected:** Thấy admin, seller1-4, bidder1-3

**⚠️ Lỗi thường gặp:**
- `ERROR: duplicate key value violates unique constraint`
  - **Giải pháp:** Data đã insert rồi, bỏ qua HOẶC:
    ```sql
    DELETE FROM users;
    DELETE FROM categories;
    DELETE FROM system_config;
    -- Rồi chạy lại BƯỚC 6
    ```
- `ERROR: relation "..." does not exist`
  - **Giải pháp:** Chạy lại BƯỚC 2, 3

---

### ✅ BƯỚC 7: Insert Products Data (123 rows)

**📁 File:** `07-data-products.sql`

**Mục đích:**
- Insert 120 products
- Insert 3 upgrade_requests

**⚠️ PHỤ THUỘC:**
- **users** (seller_id, winner_id)
- **categories** (category_id)

**Chi tiết thực hiện:**

1. Mở file `07-data-products.sql`
2. Copy toàn bộ
3. Paste vào SQL Editor
4. Click **"Run"**
5. Đợi **"Success. No rows returned"**

**✅ Verify:**
```sql
SELECT 'products' as table_name, COUNT(*) as row_count FROM products
UNION ALL
SELECT 'upgrade_requests', COUNT(*) FROM upgrade_requests;
```
**Expected:**
- products: 120 rows
- upgrade_requests: 3 rows

**Kiểm tra products:**
```sql
SELECT id, name, starting_price, current_price, status, seller_id, category_id
FROM products
ORDER BY id
LIMIT 10;
```
**Expected:** Thấy 10 sản phẩm đầu tiên với đầy đủ thông tin

**⚠️ Lỗi thường gặp:**
- `ERROR: insert or update on table "products" violates foreign key constraint`
  - **Lỗi:** Chưa có users hoặc categories
  - **Giải pháp:** Chạy lại BƯỚC 6 trước
- `ERROR: duplicate key value`
  - **Giải pháp:** Products đã insert rồi, bỏ qua HOẶC:
    ```sql
    DELETE FROM products;
    DELETE FROM upgrade_requests;
    -- Rồi chạy lại BƯỚC 7
    ```

---

### ✅ BƯỚC 8: Insert Related Data (1,188 rows)

**📁 File:** `08-data-related.sql`

**Mục đích:**
- Insert 637 bids
- Insert 476 product_images
- Insert 10 product_desc_updates
- Insert 1 product_bans
- Insert 9 questions
- Insert 27 ratings
- Insert 8 transactions
- Insert 18 messages
- Insert 2 watchlists

**⚠️ PHỤ THUỘC:**
- **users** và **products** từ BƯỚC 6, 7

**Chi tiết thực hiện:**

1. Mở file `08-data-related.sql`
2. Copy toàn bộ (file lớn ~1.5MB)
3. Paste vào SQL Editor
4. Click **"Run"**
5. **Đợi 30-60 giây** (file lớn, nhiều data)
6. Thấy **"Success. No rows returned"**

**✅ Verify:**
```sql
SELECT 
    'bids' as table_name, COUNT(*) as rows FROM bids
UNION ALL
SELECT 'product_images', COUNT(*) FROM product_images
UNION ALL
SELECT 'product_desc_updates', COUNT(*) FROM product_desc_updates
UNION ALL
SELECT 'product_bans', COUNT(*) FROM product_bans
UNION ALL
SELECT 'questions', COUNT(*) FROM questions
UNION ALL
SELECT 'ratings', COUNT(*) FROM ratings
UNION ALL
SELECT 'transactions', COUNT(*) FROM transactions
UNION ALL
SELECT 'messages', COUNT(*) FROM messages
UNION ALL
SELECT 'watchlists', COUNT(*) FROM watchlists;
```
**Expected:**
- bids: 637
- product_images: 476
- product_desc_updates: 10
- product_bans: 1
- questions: 9
- ratings: 27
- transactions: 8
- messages: 18
- watchlists: 2

**Tổng check:**
```sql
SELECT 
    (SELECT COUNT(*) FROM bids) +
    (SELECT COUNT(*) FROM product_images) +
    (SELECT COUNT(*) FROM product_desc_updates) +
    (SELECT COUNT(*) FROM product_bans) +
    (SELECT COUNT(*) FROM questions) +
    (SELECT COUNT(*) FROM ratings) +
    (SELECT COUNT(*) FROM transactions) +
    (SELECT COUNT(*) FROM messages) +
    (SELECT COUNT(*) FROM watchlists) as total_rows;
```
**Expected:** 1,188 rows

**⚠️ Lỗi thường gặp:**
- `ERROR: insert or update on table "bids" violates foreign key constraint`
  - **Lỗi:** Chưa có users hoặc products
  - **Giải pháp:** Chạy lại BƯỚC 6, 7 trước
- `ERROR: could not serialize access due to concurrent update`
  - **Lỗi:** Supabase timeout vì file quá lớn
  - **Giải pháp:** Chia nhỏ file này ra 2-3 phần và chạy riêng
- `ERROR: duplicate key value`
  - **Giải pháp:** Data đã insert, bỏ qua

---

### ✅ BƯỚC 9: Update Sequences (Final Step)

**📁 File:** `09-update-sequences.sql`

**Mục đích:**
- Set sequences về giá trị đúng
- Đảm bảo INSERT mới không bị duplicate ID

**Chi tiết thực hiện:**

1. Mở file `09-update-sequences.sql`
2. Copy toàn bộ
3. Paste vào SQL Editor
4. Click **"Run"**
5. Đợi **"Success. No rows returned"**

**✅ Verify:**
```sql
-- Check giá trị sequences
SELECT 
    sequence_name, 
    last_value 
FROM information_schema.sequences s
JOIN pg_sequences ps ON s.sequence_name = ps.sequencename
WHERE s.sequence_schema = 'public'
ORDER BY sequence_name;
```
**Expected:** 11 sequences với last_value > 0

**Test INSERT để verify auto-increment:**
```sql
-- Test insert user mới
INSERT INTO users (username, email, password, full_name, role)
VALUES ('test_user', 'test@example.com', 'password123', 'Test User', 'bidder')
RETURNING id;
-- Expected: id = 9 (vì đã có 8 users)

-- Xóa test user
DELETE FROM users WHERE username = 'test_user';
```

**⚠️ Lỗi thường gặp:**
- `ERROR: relation "bids_id_seq" does not exist`
  - **Giải pháp:** Chạy lại BƯỚC 1 để tạo sequences

---

## 🎉 HOÀN THÀNH!

Sau khi chạy xong 9 bước, database đã sẵn sàng:

### ✅ Checklist cuối cùng

```sql
-- 1. Kiểm tra tổng số tables
SELECT COUNT(*) as table_count 
FROM information_schema.tables 
WHERE table_schema = 'public' AND table_type = 'BASE TABLE';
-- Expected: 14

-- 2. Kiểm tra tổng số rows
SELECT 
    (SELECT COUNT(*) FROM users) +
    (SELECT COUNT(*) FROM categories) +
    (SELECT COUNT(*) FROM products) +
    (SELECT COUNT(*) FROM bids) +
    (SELECT COUNT(*) FROM product_images) +
    (SELECT COUNT(*) FROM product_desc_updates) +
    (SELECT COUNT(*) FROM product_bans) +
    (SELECT COUNT(*) FROM questions) +
    (SELECT COUNT(*) FROM ratings) +
    (SELECT COUNT(*) FROM transactions) +
    (SELECT COUNT(*) FROM messages) +
    (SELECT COUNT(*) FROM watchlists) +
    (SELECT COUNT(*) FROM upgrade_requests) +
    (SELECT COUNT(*) FROM system_config) as total_rows;
-- Expected: 1,343

-- 3. Kiểm tra indexes
SELECT COUNT(*) as index_count 
FROM pg_indexes 
WHERE schemaname = 'public';
-- Expected: 48 (bao gồm cả PKs, UNIQUEs)

-- 4. Kiểm tra functions
SELECT COUNT(*) as function_count 
FROM information_schema.routines 
WHERE routine_schema = 'public';
-- Expected: 3

-- 5. Kiểm tra triggers
SELECT COUNT(*) as trigger_count 
FROM information_schema.triggers 
WHERE trigger_schema = 'public';
-- Expected: 5 (hoặc 10 vì Supabase đếm BEFORE và AFTER riêng)

-- 6. Test full-text search
SELECT id, name, ts_rank(search_vector, query) AS rank
FROM products, plainto_tsquery('english', 'laptop') query
WHERE search_vector @@ query
ORDER BY rank DESC
LIMIT 5;
-- Expected: Danh sách products có chứa "laptop"
```

---

## 📊 Thông tin Database hoàn chỉnh

### Cấu trúc
- ✅ **14 tables** với đầy đủ structure
- ✅ **14 Primary Keys**
- ✅ **24 Foreign Keys** (CASCADE delete)
- ✅ **2 UNIQUE constraints**
- ✅ **35 Indexes** (B-tree + GIN + Partial)
- ✅ **3 Functions** (auto-update search, rating, timestamp)
- ✅ **5 Triggers** (INSERT/UPDATE events)
- ✅ **11 Sequences** (auto-increment)

### Dữ liệu
- ✅ **1,343 rows total**
- ✅ **8 users** (1 admin, 4 sellers, 3 bidders)
- ✅ **20 categories**
- ✅ **120 products** (đấu giá)
- ✅ **637 bids**
- ✅ **476 product images**
- ✅ **27 ratings**
- ✅ **8 transactions**

---

## 🔗 Kết nối từ Node.js App

Sau khi setup xong, lấy connection string từ Supabase:

1. **Lấy Connection String:**
   - Supabase Dashboard → Project Settings → Database
   - Copy **Connection String** (URI mode)
   - Format: `postgresql://postgres:[YOUR-PASSWORD]@db.xxx.supabase.co:5432/postgres`

2. **Cập nhật .env file:**
```env
DB_HOST=db.xxx.supabase.co
DB_PORT=5432
DB_USER=postgres
DB_PASS=your_password_here
DB_NAME=postgres
```

3. **Test connection:**
```javascript
// test-connection.js
import knex from 'knex';

const db = knex({
  client: 'pg',
  connection: {
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
    ssl: { rejectUnauthorized: false }
  }
});

const result = await db('users').count('* as count');
console.log('Total users:', result[0].count); // Expected: 8

await db.destroy();
```

---

## 🔧 Troubleshooting Chi Tiết

### ❌ Lỗi: Foreign Key Violation

**Triệu chứng:**
```
ERROR: insert or update on table "products" violates foreign key constraint "products_seller_id_fkey"
DETAIL: Key (seller_id)=(12) is not present in table "users".
```

**Nguyên nhân:** Chưa insert users hoặc categories

**Giải pháp:**
```sql
-- 1. Check xem users đã có chưa
SELECT id, username FROM users ORDER BY id;
-- Nếu empty → Chạy lại BƯỚC 6

-- 2. Check xem categories đã có chưa
SELECT id, name FROM categories ORDER BY id;
-- Nếu empty → Chạy lại BƯỚC 6

-- 3. Nếu đã có nhưng vẫn lỗi, check ID cụ thể
SELECT * FROM users WHERE id = 12;
-- Nếu không có → Data file bị sai, check lại file 06
```

---

### ❌ Lỗi: Duplicate Key Value

**Triệu chứng:**
```
ERROR: duplicate key value violates unique constraint "users_pkey"
DETAIL: Key (id)=(1) already exists.
```

**Nguyên nhân:** Data đã insert rồi, chạy lại

**Giải pháp:**
```sql
-- Option 1: Xóa data và chạy lại
DELETE FROM bids;              -- Xóa trước vì có FK
DELETE FROM product_images;
DELETE FROM products;
DELETE FROM users;
-- Rồi chạy lại BƯỚC 6, 7, 8

-- Option 2: Drop toàn bộ và làm lại từ đầu
-- Chạy lại từ BƯỚC 1

-- Option 3: Skip nếu data đã đúng
-- Verify bằng COUNT queries ở trên
```

---

### ❌ Lỗi: Permission Denied

**Triệu chứng:**
```
ERROR: permission denied to disable triggers
```

**Nguyên nhân:** Supabase user không có quyền superuser

**Giải pháp:**
- ✅ Các file đã bỏ `DISABLE TRIGGER ALL`
- ✅ Không cần làm gì, chỉ cần chạy file như bình thường
- ⚠️ Nếu vẫn gặp lỗi này → File bạn dùng chưa update

---

### ❌ Lỗi: Syntax Error

**Triệu chứng:**
```
ERROR: syntax error at or near "$function$"
```

**Nguyên nhân:** Thiếu dấu `;` sau function definition

**Giải pháp:**
- ✅ Các file đã fix syntax cho Supabase
- ✅ Mỗi function có dấu `;` sau `$function$`
- ⚠️ Nếu vẫn lỗi → Re-download files từ database-exports/step-by-step/

---

### ❌ Lỗi: Timeout / Query Too Large

**Triệu chứng:**
```
ERROR: canceling statement due to statement timeout
```

**Nguyên nhân:** File 08 quá lớn (1,188 rows)

**Giải pháp:**

**Option 1: Tăng timeout (Supabase Dashboard)**
- Settings → Database → Configuration
- Tìm `statement_timeout`
- Tăng lên `60000` (60 seconds)

**Option 2: Chia nhỏ file 08**
```sql
-- Chạy từng nhóm table riêng:

-- Nhóm 1: Bids (637 rows)
INSERT INTO bids (...) VALUES (...);

-- Nhóm 2: Images (476 rows)
INSERT INTO product_images (...) VALUES (...);

-- Nhóm 3: Các bảng nhỏ
INSERT INTO product_desc_updates (...) VALUES (...);
INSERT INTO ratings (...) VALUES (...);
-- ... etc
```

---

### ❌ Lỗi: Relation Does Not Exist

**Triệu chứng:**
```
ERROR: relation "products" does not exist
```

**Nguyên nhân:** Bỏ qua một bước trước đó

**Giải pháp:**
```sql
-- Check xem table có tồn tại không
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
  AND table_name = 'products';

-- Nếu empty → Chạy lại BƯỚC 2 (create tables)
```

---

### ❌ Lỗi: Sequence Does Not Exist

**Triệu chứng:**
```
ERROR: relation "bids_id_seq" does not exist
```

**Nguyên nhân:** Chưa tạo sequences

**Giải pháp:**
- Chạy lại **BƯỚC 1** để tạo sequences

---

### ❌ Lỗi: Cannot Drop Table (Dependency)

**Triệu chứng:**
```
ERROR: cannot drop table users because other objects depend on it
```

**Nguyên nhân:** Có FKs trỏ đến table này

**Giải pháp:**
- ✅ File 01 đã có `DROP TABLE ... CASCADE`
- ✅ Chạy lại file 01 là xong
- ⚠️ Nếu vẫn lỗi → Chạy manual:
```sql
DROP TABLE IF EXISTS bids CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS users CASCADE;
-- ... etc
```

---

### 🔍 Các Query Hữu Ích Để Debug

**1. Kiểm tra tất cả tables và row counts:**
```sql
SELECT 
    schemaname,
    tablename,
    n_live_tup as row_count
FROM pg_stat_user_tables
WHERE schemaname = 'public'
ORDER BY tablename;
```

**2. Kiểm tra Foreign Keys:**
```sql
SELECT
    tc.table_name, 
    kcu.column_name,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name,
    rc.delete_rule
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
  ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage AS ccu
  ON ccu.constraint_name = tc.constraint_name
JOIN information_schema.referential_constraints AS rc
  ON rc.constraint_name = tc.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY' 
  AND tc.table_schema = 'public'
ORDER BY tc.table_name, kcu.column_name;
```

**3. Kiểm tra Triggers:**
```sql
SELECT 
    trigger_name,
    event_object_table AS table_name,
    action_timing,
    event_manipulation AS event
FROM information_schema.triggers
WHERE trigger_schema = 'public'
ORDER BY event_object_table, trigger_name;
```

**4. Kiểm tra Indexes:**
```sql
SELECT
    t.tablename,
    i.indexname,
    i.indexdef
FROM pg_indexes i
JOIN pg_tables t ON i.tablename = t.tablename
WHERE t.schemaname = 'public'
ORDER BY t.tablename, i.indexname;
```

**5. Kiểm tra Sequences:**
```sql
SELECT 
    sequence_name,
    last_value,
    increment_by
FROM information_schema.sequences s
JOIN pg_sequences ps ON s.sequence_name = ps.sequencename
WHERE s.sequence_schema = 'public'
ORDER BY sequence_name;
```

**6. Test Full-Text Search:**
```sql
-- Test search vector
SELECT id, name, 
       ts_rank(search_vector, query) AS rank
FROM products, 
     plainto_tsquery('english', 'vintage laptop') query
WHERE search_vector @@ query
ORDER BY rank DESC
LIMIT 10;
```

**7. Kiểm tra User Ratings:**
```sql
-- Test rating cache
SELECT 
    u.id,
    u.username,
    u.rating_cache,
    COUNT(r.id) as rating_count,
    AVG(r.rating)::numeric(10,2) as avg_rating
FROM users u
LEFT JOIN ratings r ON r.seller_id = u.id
WHERE u.role = 'seller'
GROUP BY u.id, u.username, u.rating_cache
ORDER BY u.id;
-- rating_cache should match AVG(r.rating)
```

---

## 💡 Tips & Best Practices

### ✅ Trước khi bắt đầu

1. **Backup database cũ** (nếu có):
   - Supabase Dashboard → Database → Backups
   - Hoặc export bằng pg_dump

2. **Đọc hết README này** trước khi chạy

3. **Chuẩn bị đầy đủ 9 files** trong thư mục

4. **Có kết nối internet ổn định** (tránh timeout)

---

### ✅ Trong quá trình chạy

1. **Chạy ĐÚNG THỨ TỰ** 1 → 2 → 3 → ... → 9

2. **Đợi mỗi query thành công** trước khi chạy tiếp

3. **Verify sau mỗi bước quan trọng**:
   - Sau BƯỚC 2: Check 14 tables
   - Sau BƯỚC 6: Check 32 rows
   - Sau BƯỚC 8: Check 1,188 rows

4. **Copy TOÀN BỘ nội dung file** (không copy một phần)

5. **Dùng "New Query"** cho mỗi file (Clear editor trước)

---

### ✅ Sau khi hoàn thành

1. **Run full checklist** (phần "HOÀN THÀNH" ở trên)

2. **Test INSERT mới**:
```sql
INSERT INTO users (username, email, password, full_name, role)
VALUES ('new_user', 'new@test.com', 'pass123', 'New User', 'bidder')
RETURNING *;
-- Verify: id should be 9 (auto-increment works)

DELETE FROM users WHERE username = 'new_user';
```

3. **Test triggers**:
```sql
-- Test rating cache trigger
INSERT INTO ratings (product_id, bidder_id, seller_id, rating, comment)
VALUES (1, 6, 2, 5, 'Test rating');

-- Check if seller's rating_cache updated
SELECT rating_cache FROM users WHERE id = 2;
-- Should recalculate average

DELETE FROM ratings WHERE comment = 'Test rating';
```

4. **Test full-text search**:
```sql
SELECT name, ts_rank(search_vector, query) as rank
FROM products, plainto_tsquery('english', 'camera') query
WHERE search_vector @@ query
ORDER BY rank DESC;
-- Should return products with "camera" in name/description
```

---

### ⚡ Performance Tips

1. **Indexes**: Nếu skip BƯỚC 4, thêm sau:
```sql
-- Add most important indexes first
CREATE INDEX idx_products_seller_id ON products(seller_id);
CREATE INDEX idx_bids_product_id ON bids(product_id);
CREATE INDEX idx_bids_bidder_id ON bids(bidder_id);
```

2. **Connection Pooling**: Khi connect từ app:
```javascript
const db = knex({
  client: 'pg',
  connection: { /* ... */ },
  pool: { 
    min: 2, 
    max: 10,
    acquireTimeoutMillis: 60000
  }
});
```

3. **SSL**: Bắt buộc với Supabase:
```javascript
ssl: { rejectUnauthorized: false }
```

---

## 📚 Tài liệu tham khảo

- **Supabase Docs**: https://supabase.com/docs/guides/database
- **PostgreSQL Docs**: https://www.postgresql.org/docs/
- **Knex.js**: https://knexjs.org/guide/

---

## 📞 Support

Nếu gặp vấn đề:

1. **Check lại từng bước** trong README này
2. **Chạy verify queries** để tìm bước bị lỗi
3. **Xem phần Troubleshooting** phía trên
4. **Check Supabase logs**: Dashboard → Logs → Database

---

## 📝 Changelog

- **v1.0** (2026-01-05): Initial release
  - 9 SQL files cho step-by-step import
  - 1,343 rows data
  - Full structure: tables, constraints, indexes, functions, triggers
  - Supabase compatible (tested on Supabase Free Tier)

---
