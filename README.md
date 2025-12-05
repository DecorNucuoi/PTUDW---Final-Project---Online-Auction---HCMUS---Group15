### Cài đặt Node.js
- Tải Node.js tại: https://nodejs.org/en/download/

### Cài node_modules
Cài đặt các thư viện cần thiết (Express, Knex, Nodemailer...):
```bash
npm install
```

### Cách compile & Run (Dev mode)
Chạy server với nodemon (tự động reload khi sửa file):
```bash 
npm run dev
```
*Lưu ý: Server chạy tại `http://localhost:3000`*

### Cấu hình hệ thống
Dự án không dùng `.env` mà cấu hình trực tiếp trong thư mục `utils`. Hãy chỉnh sửa các file sau:

1.  **Database (PostgreSQL):**
    - File: `utils/db.js`

2.  **Email (Gửi OTP):**
    - File: `utils/mailer.js`


### Scripts trong package.json
```json
"scripts": {
    "start": "node app.js",
    "dev": "nodemon app.js"
}
```
