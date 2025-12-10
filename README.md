# Online Auction - Sàn Đấu Giá Trực Tuyến

> **Đồ án cuối kỳ - Phát triển Ứng dụng Web**
> Nhóm 15 - HCMUS

Website đấu giá trực tuyến cho phép người dùng tham gia đấu giá sản phẩm theo thời gian thực (mô phỏng), quản lý sản phẩm, và đánh giá độ uy tín.

![NodeJS](https://img.shields.io/badge/Node.js-18.x-green) ![Express](https://img.shields.io/badge/Express-4.x-blue) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Supabase-336791) ![Bootstrap](https://img.shields.io/badge/Bootstrap-5-purple)

## Cài Đặt & Cấu Hình

### 1. Yêu cầu hệ thống
- [Node.js](https://nodejs.org/) (v16 trở lên).
- Database PostgreSQL (Khuyên dùng **Supabase**).

### 2. Cài đặt thư viện
```bash
npm install
```
*Các gói chính: `express`, `knex`, `pg`, `bcryptjs`, `nodemailer`, `multer`, `dotenv`, `express-handlebars`.*

## Khởi Chạy Ứng Dụng

Sau khi cấu hình xong, chạy lệnh sau để bật Server:

```bash
# Chạy chế độ Development (Tự động restart khi sửa code)
npm run dev
```

Truy cập: **[http://localhost:3000](http://localhost:3000)**

---

## Cấu Trúc Thư Mục

```
.
├── middlewares/    # Kiểm tra đăng nhập, phân quyền (Auth, Seller, Admin)
├── routes/         # Định tuyến (Account, Product, Admin...)
├── services/       # Xử lý logic Database (Knex Query)
├── static/         # File tĩnh (CSS, JS, Images)
├── utils/          # Cấu hình DB, Mailer
├── views/          # Giao diện (Handlebars)
│   ├── layouts/    # Layout chính (main.hbs)
│   ├── partials/   # Thành phần dùng chung (Sidebar, Header...)
│   └── vwProduct/  # Các trang sản phẩm
├── app.js          # File chạy chính
├── organize-images.js # Script tải ảnh
└── .env            # Biến môi trường (Không up lên Git)
```

---

*Project phục vụ môn học PTUDW - Vui lòng không sao chép cho mục đích thương mại.*
