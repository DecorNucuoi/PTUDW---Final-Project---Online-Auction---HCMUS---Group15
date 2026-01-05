# Online Auction Platform - Sàn Đấu Giá Trực Tuyến

> **Đồ án cuối kỳ - Phát triển Ứng dụng Web (PTUDW)**  
> **Nhóm: 15 - **`23127472/23127362`**  - HCMUS**  
> **Năm học:** 2025-2026

[![Node.js](https://img.shields.io/badge/Node.js-18.x%2B-green?logo=node.js)](https://nodejs.org/)
[![Express](https://img.shields.io/badge/Express-5.1.0-blue?logo=express)](https://expressjs.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-12%2B-336791?logo=postgresql)](https://www.postgresql.org/)
[![Supabase](https://img.shields.io/badge/Supabase-Cloud%20DB-3ECF8E?logo=supabase)](https://supabase.com/)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-5-purple?logo=bootstrap)](https://getbootstrap.com/)

---

## 📖 Mục Lục

1. [Tổng Quan Dự Án](#-tổng-quan-dự-án)
2. [Kiến Trúc Hệ Thống](#-kiến-trúc-hệ-thống)
3. [Yêu Cầu Hệ Thống](#-yêu-cầu-hệ-thống)
4. [Hướng Dẫn Cài Đặt](#-hướng-dẫn-cài-đặt)
5. [Cấu Hình Database](#-cấu-hình-database)
6. [Khởi Chạy Ứng Dụng](#-khởi-chạy-ứng-dụng)
7. [Cấu Trúc Thư Mục](#-cấu-trúc-thư-mục-chi-tiết)
8. [Tính Năng Chính](#-tính-năng-chính)
9. [API Endpoints](#-api-endpoints-quan-trọng)
10. [Troubleshooting](#-troubleshooting)
11. [Scripts Hỗ Trợ](#-scripts-hỗ-trợ)

---

## 🎯 Tổng Quan Dự Án

### Giới Thiệu

**Online Auction Platform** là một hệ thống đấu giá trực tuyến đầy đủ tính năng, cho phép người dùng:
- 🛍️ Tham gia đấu giá sản phẩm theo thời gian thực
- 👥 Quản lý tài khoản với 3 vai trò: Bidder (Người mua), Seller (Người bán), Admin (Quản trị)
- 📊 Hệ thống đánh giá uy tín người bán
- 💰 Giao dịch an toàn với quy trình 4 bước
- 📧 Thông báo email tự động
- 💬 Chat real-time giữa buyer và seller
- 🔍 Tìm kiếm nâng cao với full-text search

### Tech Stack

**Backend:**
- **Node.js** v18+ (ES6 Modules)
- **Express.js** v5.1.0 (Web Framework)
- **Knex.js** v3.1.0 (SQL Query Builder)
- **PostgreSQL** v12+ (Database)
- **Supabase** (Cloud Database Hosting)

**Frontend:**
- **Express Handlebars** v8.0.3 (Template Engine)
- **Bootstrap 5** (UI Framework)
- **Vanilla JavaScript** (Client-side logic)

**Security & Performance:**
- **bcryptjs** v3.0.3 (Password Hashing)
- **express-session** v1.18.2 (Session Management)
- **node-cache** v5.1.2 (In-memory Caching)
- **compression** v1.8.1 (Gzip Compression)
- **sharp** v0.34.5 (Image Processing)

**Email & External Services:**
- **Nodemailer** v7.0.11 (Email Service)
- **Google ReCAPTCHA** v2 (Anti-bot)

---

## 🏗️ Kiến Trúc Hệ Thống

### Mô Hình MVC

```
┌─────────────────────────────────────────────────────────────┐
│                         CLIENT BROWSER                      │
│              (Views: Handlebars Templates)                  │
└────────────────────────┬────────────────────────────────────┘
                         │ HTTP Request
                         ↓
┌─────────────────────────────────────────────────────────────┐
│                      EXPRESS.JS SERVER                      │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐       │
│  │ Middlewares  │→ │   Routes     │→ │  Controllers │       │
│  │ - Auth       │  │ - /account   │  │ (in routes)  │       │
│  │ - Role Check │  │ - /product   │  └──────┬───────┘       │
│  │ - Performance│  │ - /admin     │         │               │
│  └──────────────┘  └──────────────┘         ↓               │
│                                    ┌──────────────────┐     │
│                                    │    Services      │     │
│                                    │ - user.service   │     │
│                                    │ - product.service│     │
│                                    │ - email.service  │     │
│                                    └────────┬─────────┘     │
└─────────────────────────────────────────────┼───────────────┘
                                              │ Knex.js
                                              ↓
                         ┌─────────────────────────────┐
                         │   PostgreSQL Database       │
                         │   (Supabase Cloud)          │
                         │                             │
                         │ - 14 Tables                 │
                         │ - 1,343 Rows                │
                         │ - 35 Indexes                │
                         │ - 5 Triggers                │
                         │ - Full-text Search          │
                         └─────────────────────────────┘
```

### Background Services

- **Cron Job:** Tự động kết thúc đấu giá mỗi 60 giây
- **Email Queue:** Gửi email thông báo winner/seller
- **Session Store:** In-memory session (có thể nâng cấp Redis)
- **Cache Layer:** node-cache cho categories menu (5 phút TTL)

---

## ⚙️ Yêu Cầu Hệ Thống

### Phần Mềm Bắt Buộc

| Software | Version | Purpose | Download |
|----------|---------|---------|----------|
| **Node.js** | ≥ 18.0.0 | JavaScript Runtime | [nodejs.org](https://nodejs.org/) |
| **npm** | ≥ 8.0.0 | Package Manager | (Đi kèm Node.js) |
| **PostgreSQL** | ≥ 12.0 | Database (local dev) | [postgresql.org](https://www.postgresql.org/download/) |
| **Git** | Latest | Version Control | [git-scm.com](https://git-scm.com/) |

### Phần Mềm Khuyến Nghị

- **VS Code** - Code Editor
- **Postman** - API Testing
- **DBeaver** / **pgAdmin** - Database Management
- **Nodemon** - Auto-reload (đã có trong devDependencies)

### Tài Khoản Cần Thiết

1. **Supabase Account** (Free tier) - Hosting database
2. **Gmail Account** - Gửi email (App Password required)
3. **Google ReCAPTCHA** - Anti-bot (v2 Checkbox)

---

## 🚀 Hướng Dẫn Cài Đặt

### Bước 1: Clone Repository

```bash
# Clone project từ Git
git clone <repository-url>
cd PTUDW---Final-Project---Online-Auction---HCMUS---Group15

# Hoặc nếu đã có source code
cd path/to/project
```

### Bước 2: Cài Đặt Dependencies

```bash
# Cài đặt tất cả packages
npm install

# Verify installation
npm list --depth=0
```

**Expected output:**
```
├── axios@1.13.2
├── bcryptjs@3.0.3
├── compression@1.8.1
├── dotenv@17.2.3
├── express@5.1.0
├── express-handlebars@8.0.3
├── express-handlebars-sections@1.0.1
├── express-session@1.18.2
├── knex@3.1.0
├── multer@2.0.2
├── node-cache@5.1.2
├── nodemailer@7.0.11
├── pg@8.16.3
├── randomstring@1.3.1
└── sharp@0.34.5
```

### Bước 3: Cấu Hình Environment Variables

```bash
# Copy file mẫu
cp .env.example .env

# Mở file .env và điền thông tin
nano .env
# Hoặc dùng editor: code .env
```

**Nội dung file `.env`:**

```dotenv
# ============================================
# SERVER CONFIGURATION
# ============================================
PORT=3000
SESSION_SECRET=your_super_secret_session_key_here_change_in_production
NODE_ENV=development

# ============================================
# DATABASE CONFIGURATION (Supabase)
# ============================================
DB_HOST=db.xxxxxxxxxxxxx.supabase.co
DB_PORT=5432
DB_USER=postgres
DB_PASS=your_supabase_database_password
DB_NAME=postgres

# ============================================
# EMAIL CONFIGURATION (Gmail)
# ============================================
# Cần tạo App Password từ Google Account
# Xem: https://support.google.com/accounts/answer/185833
EMAIL_USER=your_email@gmail.com
EMAIL_PASS=your_16_character_app_password

# ============================================
# GOOGLE RECAPTCHA (v2 Checkbox)
# ============================================
# Lấy từ: https://www.google.com/recaptcha/admin
RECAPTCHA_SECRET=your_recaptcha_secret_key
```

### Bước 4: Lấy Credentials

#### 4.1. Supabase Database

1. Đăng ký tại [supabase.com](https://supabase.com)
2. Tạo project mới
3. Vào **Settings** → **Database** → **Connection String**
4. Copy thông tin:
   - `DB_HOST`: `db.xxxxxxxxxxxxx.supabase.co`
   - `DB_PASS`: Password bạn đặt khi tạo project
   - `DB_USER`: `postgres` (mặc định)
   - `DB_NAME`: `postgres` (mặc định)

#### 4.2. Gmail App Password

1. Vào [Google Account Security](https://myaccount.google.com/security)
2. Bật **2-Step Verification** (nếu chưa có)
3. Tìm **App Passwords** (mục Security)
4. Tạo App Password cho **Mail**
5. Copy 16 ký tự (không có khoảng trắng) vào `EMAIL_PASS`

#### 4.3. Google ReCAPTCHA

1. Vào [ReCAPTCHA Admin Console](https://www.google.com/recaptcha/admin)
2. Đăng ký site mới:
   - **Label:** Online Auction
   - **reCAPTCHA type:** v2 "I'm not a robot" Checkbox
   - **Domains:** `localhost` (cho dev)
3. Copy **Secret key** vào `RECAPTCHA_SECRET`

---

## 💾 Cấu Hình Database

### Option 1: Import Database từ SQL Files (KHUYẾN NGHỊ)

**Chi tiết đầy đủ trong:** [database-exports/step-by-step/README.md](database-exports/step-by-step/README.md)

**Quick Guide:**

1. **Chuẩn bị:**
   - Mở Supabase Dashboard → SQL Editor

2. **Chạy 9 files SQL theo thứ tự:**

```bash
# Thứ tự bắt buộc:
01-drop-and-sequences.sql      # Drop old + Create sequences
02-create-tables.sql           # Create 14 tables
03-constraints.sql             # Add PKs, FKs, UNIQUEs
04-indexes.sql                 # Add 35 indexes (optional)
05-functions-triggers.sql      # Add functions + triggers
06-data-core.sql               # Insert 32 rows (users, categories, config)
07-data-products.sql           # Insert 123 rows (products)
08-data-related.sql            # Insert 1,188 rows (bids, images, etc.)
09-update-sequences.sql        # Fix auto-increment IDs
```

3. **Verify:**

```sql
-- Check tables
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';
-- Expected: 14 tables

-- Check row counts
SELECT 
    (SELECT COUNT(*) FROM users) as users,
    (SELECT COUNT(*) FROM products) as products,
    (SELECT COUNT(*) FROM bids) as bids;
-- Expected: 8 users, 120 products, 637 bids
```

### Option 2: Sử Dụng Migration Scripts (Nếu chưa có data)

```bash
# Chạy migration chính (tạo schema)
node scripts/run-migration.js

# Verify database structure
node scripts/query-products.js
```

### Database Schema Overview

```
14 Tables:
├── users (8 rows)              # Tài khoản (admin, seller, bidder)
├── categories (20 rows)        # Danh mục sản phẩm
├── products (120 rows)         # Sản phẩm đấu giá
├── bids (637 rows)             # Lịch sử đấu giá
├── product_images (476 rows)   # Hình ảnh sản phẩm
├── product_desc_updates (10)   # Lịch sử cập nhật mô tả
├── product_bans (1 row)        # Sản phẩm bị ban
├── ratings (27 rows)           # Đánh giá seller
├── transactions (8 rows)       # Giao dịch hoàn tất
├── messages (18 rows)          # Tin nhắn chat
├── questions (9 rows)          # Câu hỏi về sản phẩm
├── watchlists (2 rows)         # Danh sách theo dõi
├── upgrade_requests (3 rows)   # Yêu cầu nâng cấp seller
└── system_config (4 rows)      # Cấu hình hệ thống
```

---

## 🎬 Khởi Chạy Ứng Dụng

### Development Mode (Auto-reload)

```bash
# Start với nodemon (tự động reload khi có thay đổi)
npm run dev

# Output:
# [nodemon] 3.1.10
# [nodemon] to restart at any time, enter `rs`
# [nodemon] watching path(s): *.*
# [nodemon] watching extensions: js,mjs,cjs,json
# [nodemon] starting `node app.js`
#
# 🚀 Server is running on http://localhost:3000
# ⏰ Auction ending cron job is active (runs every 60 seconds)
# 📧 Email notifications enabled
```

### Production Mode

```bash
# Start bình thường
npm start

# Hoặc
node app.js
```

### Verify Server Running

```bash
# Test server health
curl http://localhost:3000

# Hoặc mở browser:
# http://localhost:3000
```

### Truy Cập Ứng Dụng

| URL | Mô Tả |
|-----|-------|
| `http://localhost:3000` | Trang chủ |
| `http://localhost:3000/account/login` | Đăng nhập |
| `http://localhost:3000/account/register` | Đăng ký |
| `http://localhost:3000/admin` | Admin Dashboard |

### Test Accounts (Sau khi import database)

| Username | Password | Role | Email |
|----------|----------|------|-------|
| `admin` | `123456` | Admin | admin@auction.com |
| `seller1` | `123456` | Seller | seller1@auction.com |
| `bidder1` | `123456` | Bidder | bidder1@auction.com |

**Tất cả test accounts:** Xem [USER_CREDENTIALS.md](USER_CREDENTIALS.md)

---

## 📁 Cấu Trúc Thư Mục Chi Tiết

```
PTUDW---Final-Project---Online-Auction---HCMUS---Group15/
│
├── 📂 middlewares/              # Middleware functions
│   ├── auth.mdw.js             # Authentication (isAuth, isSeller, isAdmin)
│   ├── role.mdw.js             # Attach role info to views
│   └── performance.mdw.js      # Performance monitoring
│
├── 📂 routes/                   # Route handlers (Controllers)
│   ├── account.route.js        # /account/* - Login, Register, Profile
│   ├── product.route.js        # /product/* - List, Detail, Upload, Edit
│   ├── category.route.js       # /category/* - Browse by category
│   ├── home.route.js           # / - Homepage
│   ├── watchlist.route.js      # /watchlist/* - Saved products
│   ├── chat.route.js           # /chat/* - Messages
│   ├── transaction.route.js    # /transaction/* - Payment flow
│   ├── admin.route.js          # /admin - Dashboard
│   ├── admin-category.route.js # /admin/categories/* - Category CRUD
│   ├── admin-product.route.js  # /admin/products/* - Product management
│   ├── admin-user.route.js     # /admin/users/* - User management
│   └── admin-config.route.js   # /admin/config/* - System settings
│
├── 📂 services/                 # Business logic & Database queries
│   ├── user.service.js         # User CRUD operations
│   ├── product.service.js      # Product queries (with optimizations)
│   ├── category.service.js     # Category tree operations
│   ├── bid.service.js          # Bidding logic
│   ├── transaction.service.js  # Transaction flow
│   └── email.service.js        # Email templates & sending
│
├── 📂 utils/                    # Utility functions & configs
│   ├── db.js                   # Knex database connection
│   ├── mailer.js               # Nodemailer transporter
│   ├── cache.js                # node-cache wrapper
│   └── image-config.js         # Image path helpers
│
├── 📂 views/                    # Handlebars templates
│   ├── layouts/                # Main layout
│   │   └── main.hbs           # Base HTML structure
│   ├── partials/               # Reusable components
│   │   ├── sidebar.hbs        # Category sidebar
│   │   ├── header.hbs         # Navigation bar
│   │   └── footer.hbs         # Footer
│   ├── home.handlebars        # Homepage
│   ├── vwAccount/             # Account pages
│   ├── vwProduct/             # Product pages
│   ├── vwAdmin/               # Admin dashboard
│   ├── vwChat/                # Chat interface
│   └── vwTransaction/         # Transaction flow
│
├── 📂 static/                   # Static assets
│   ├── css/                   # Stylesheets
│   │   └── style.css          # Main CSS
│   └── imgs/                  # Public images
│       ├── products/          # Product images (uploaded)
│       │   ├── 1/            # Product ID 1
│       │   │   ├── 1.jpg     # Main image
│       │   │   ├── 2.jpg     # Additional images
│       │   │   └── ...
│       │   └── ...
│       └── avatars/           # User avatars (optional)
│
├── 📂 migrations/               # Database migrations
│   ├── 001_add_missing_tables.sql     # Main schema
│   ├── 002_add_allow_newbie.sql       # Allow newbie bidders
│   ├── 003_add_system_config.sql      # System config table
│   └── 004_add_performance_indexes.sql # Performance indexes
│
├── 📂 scripts/                  # Utility scripts
│   ├── run-migration.js        # Run migration files
│   ├── test-cron.js            # Test auction ending manually
│   ├── test-email.js           # Test email sending
│   ├── cleanup-images.js       # Clean orphaned images
│   ├── scan-images.js          # Scan image directories
│   └── query-products.js       # Query database tool
│
├── 📂 database-exports/         # Database backup & setup
│   └── step-by-step/           # 9 SQL files for import
│       ├── README.md           # ⭐ CHI TIẾT HƯỚNG DẪN IMPORT
│       ├── 01-drop-and-sequences.sql
│       ├── 02-create-tables.sql
│       ├── 03-constraints.sql
│       ├── 04-indexes.sql
│       ├── 05-functions-triggers.sql
│       ├── 06-data-core.sql
│       ├── 07-data-products.sql
│       ├── 08-data-related.sql
│       └── 09-update-sequences.sql
│
├── 📄 app.js                    # ⭐ MAIN ENTRY POINT
├── 📄 package.json              # Dependencies & scripts
├── 📄 .env                      # Environment variables (KHÔNG COMMIT)
├── 📄 .env.example              # Environment template
├── 📄 .gitignore                # Git ignore rules
├── 📄 README.md                 # ⭐ BẠN ĐANG ĐỌC FILE NÀY
├── 📄 USER_CREDENTIALS.md       # Test accounts
└── 📄 database-information.md   # Database ERD diagram
```

---

## ✨ Tính Năng Chính

### 1. Authentication & Authorization

- ✅ Đăng ký tài khoản với email verification (OTP)
- ✅ Google ReCAPTCHA anti-bot
- ✅ Đăng nhập/đăng xuất
- ✅ 3 vai trò: Bidder, Seller, Admin
- ✅ Upgrade từ Bidder → Seller (Admin approval)
- ✅ Password hashing với bcrypt (10 rounds)

### 2. Product Management

**Seller:**
- ✅ Upload sản phẩm với nhiều hình ảnh
- ✅ Set giá khởi điểm, step price, buy now price
- ✅ Auto-upload sản phẩm sau 1 phút
- ✅ Cập nhật mô tả sản phẩm (lưu lịch sử)
- ✅ Gia hạn thời gian đấu giá (1 lần duy nhất)

**Bidder:**
- ✅ Duyệt sản phẩm theo category
- ✅ Tìm kiếm full-text (PostgreSQL GIN index)
- ✅ Filter theo giá, thời gian, category
- ✅ Autocomplete suggestions
- ✅ Watchlist (theo dõi sản phẩm yêu thích)

### 3. Bidding System

- ✅ Real-time bidding (mô phỏng, không dùng WebSocket)
- ✅ Kiểm tra giá hợp lệ: `current_price + step_price`
- ✅ Auto-update winner_id
- ✅ Cấm người bán bid sản phẩm của chính mình
- ✅ Cấm người bị ban
- ✅ Lịch sử đấu giá với masked names (`****Khoa`)
- ✅ Buy now instant win

### 4. Auction Ending (Cron Job)

- ✅ Tự động check mỗi 60 giây
- ✅ Cập nhật status = 2 (Ended)
- ✅ Tạo transaction record
- ✅ Gửi email thông báo winner + seller
- ✅ Email template HTML đẹp

### 5. Transaction Flow (4 Steps)

**Step 1:** Winner upload payment proof + shipping address  
**Step 2:** Seller nhập tracking number  
**Step 3:** Winner confirm nhận hàng  
**Step 4:** Winner đánh giá seller  

### 6. Admin Dashboard

- ✅ Quản lý users (edit, delete, ban)
- ✅ Quản lý categories (CRUD, parent-child tree)
- ✅ Quản lý products (approve, reject, ban)
- ✅ Xử lý upgrade requests
- ✅ System config (allow_newbie bidding)
- ✅ Statistics (users, products, revenue)
- ✅ Cache stats monitoring

### 7. Performance Optimizations

- ✅ **Database:** Connection pooling (5-30 connections)
- ✅ **Database:** 35 indexes cho queries thường dùng
- ✅ **Cache:** node-cache cho categories menu (5 min TTL)
- ✅ **Compression:** Gzip responses > 1KB
- ✅ **Images:** Sharp resize & optimize
- ✅ **Queries:** Eliminated N+1 queries
- ✅ **Queries:** Parallelized homepage queries

---

## 🔌 API Endpoints Quan Trọng

### Public Endpoints

| Method | Endpoint | Mô Tả |
|--------|----------|-------|
| `GET` | `/` | Homepage |
| `GET` | `/product/byCat?catId=1` | Browse by category |
| `GET` | `/product/search?q=laptop` | Search products |
| `GET` | `/product/detail/:id` | Product detail page |
| `GET` | `/product/api/suggestions?q=lap` | Autocomplete API |

### Authentication Required

| Method | Endpoint | Middleware | Mô Tả |
|--------|----------|-----------|-------|
| `POST` | `/product/bid/:id` | `isAuth` | Place bid |
| `GET` | `/watchlist` | `isAuth` | View watchlist |
| `POST` | `/watchlist/add` | `isAuth` | Add to watchlist |
| `GET` | `/chat/with/:id` | `isAuth` | Chat with user |
| `GET` | `/transaction/:id/complete` | `isAuth` | Transaction page |

### Seller Only

| Method | Endpoint | Middleware | Mô Tả |
|--------|----------|-----------|-------|
| `GET` | `/product/upload` | `isSeller` | Upload product page |
| `POST` | `/product/upload` | `isSeller` | Create product |
| `GET` | `/product/edit/:id` | `isSeller` | Edit product page |
| `POST` | `/product/edit/:id` | `isSeller` | Update product |

### Admin Only

| Method | Endpoint | Middleware | Mô Tả |
|--------|----------|-----------|-------|
| `GET` | `/admin` | `isAdmin` | Dashboard |
| `GET` | `/admin/users` | `isAdmin` | User management |
| `GET` | `/admin/products` | `isAdmin` | Product management |
| `GET` | `/admin/categories` | `isAdmin` | Category management |
| `POST` | `/admin/users/ban/:id` | `isAdmin` | Ban user |

---

## 🐛 Troubleshooting

### 1. Server không khởi động

**Triệu chứng:**
```
Error: Cannot find module 'express'
```

**Giải pháp:**
```bash
# Xóa node_modules và reinstall
rm -rf node_modules package-lock.json
npm install
```

---

### 2. Database connection error

**Triệu chứng:**
```
Error: connect ECONNREFUSED
```

**Giải pháp:**
```bash
# Check .env file
cat .env | grep DB_

# Verify database credentials
# Test connection bằng psql hoặc DBeaver

# Check Supabase project status
# https://supabase.com/dashboard
```

---

### 3. Email không gửi được

**Triệu chứng:**
```
Error: Invalid login: 534-5.7.9 Please log in via your web browser
```

**Giải pháp:**
```bash
# Phải dùng App Password, KHÔNG dùng password thường
# Xem: https://support.google.com/accounts/answer/185833

# Test email:
node scripts/test-email.js
```

---

### 4. Images không hiển thị

**Triệu chứng:**
```
404 Not Found: /static/imgs/products/1/1.jpg
```

**Giải pháp:**
```bash
# Check folder structure
ls -la static/imgs/products/

# Tạo folder nếu chưa có
mkdir -p static/imgs/products

# Check permissions (Linux/Mac)
chmod -R 755 static/imgs/

# Scan images
node scripts/scan-images.js
```

---

### 5. Port 3000 already in use

**Triệu chứng:**
```
Error: listen EADDRINUSE: address already in use :::3000
```

**Giải pháp:**
```bash
# Windows
netstat -ano | findstr :3000
taskkill /PID <PID> /F

# Linux/Mac
lsof -ti:3000 | xargs kill -9

# Hoặc đổi port trong .env
PORT=3001
```

---

## 🛠️ Scripts Hỗ Trợ

### Database Scripts

```bash
# Run migration (tạo schema)
node scripts/run-migration.js

# Query database
node scripts/query-products.js

# Export database structure
node scripts/export-all-data.js
```

### Testing Scripts

```bash
# Test cron job (auction ending)
node scripts/test-cron.js

# Test email sending
node scripts/test-email.js
```

### Maintenance Scripts

```bash
# Scan image directories
node scripts/scan-images.js

# Cleanup orphaned images (dry-run)
node scripts/cleanup-images.js

# Cleanup orphaned images (delete)
node scripts/cleanup-images.js --delete

# Find products missing images
node scripts/cleanup-images.js --missing
```

---

## 📚 Tài Liệu Bổ Sung

| Document | Purpose |
|----------|---------|
| [database-exports/step-by-step/README.md](database-exports/step-by-step/README.md) | 🔥 **CHI TIẾT IMPORT DATABASE** |
| [USER_CREDENTIALS.md](USER_CREDENTIALS.md) | Test accounts (8 users) |
| [database-information.md](database-information.md) | ERD diagram (Mermaid) |
| [CLEANUP_RECOMMENDATION.md](CLEANUP_RECOMMENDATION.md) | Files có thể xóa |

---

## 🎓 Giảng Viên & Nhóm

**Môn học:** Phát triển Ứng dụng Web (PTUDW)  
**Trường:** Đại học Khoa học Tự nhiên TP.HCM (HCMUS)  
**Năm học:** 2025-2026

**Nhóm:** 15 - **`23127472/23127362`** 

---

## 📝 License & Usage

- ✅ Sử dụng cho mục đích học tập
- ✅ Tham khảo code cho đồ án tương tự
- ❌ Không sao chép toàn bộ để nộp bài
- ❌ Không sử dụng thương mại

---

## 🙏 Acknowledgments

- Express.js Documentation
- Knex.js Query Builder
- Supabase Cloud Database
- Bootstrap 5 UI Framework
- Node.js Community

---

**🎉 CHÚC BẠN TRIỂN KHAI THÀNH CÔNG!**

*Nếu gặp vấn đề, hãy check lại từng bước trong README này.*  
*Database setup chi tiết: [database-exports/step-by-step/README.md](database-exports/step-by-step/README.md)*
