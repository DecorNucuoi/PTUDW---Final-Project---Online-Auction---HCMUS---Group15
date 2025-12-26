import 'dotenv/config';
import { transporter } from '../utils/mailer.js';

async function testEmail() {
    console.log('🔍 Testing email configuration...\n');
    
    console.log('📧 Email settings from .env:');
    console.log(`   EMAIL_USER: ${process.env.EMAIL_USER}`);
    console.log(`   EMAIL_PASS: ${process.env.EMAIL_PASS ? '***' + process.env.EMAIL_PASS.slice(-4) : 'NOT SET'}`);
    console.log('');

    const testMailOptions = {
        from: `"Hệ thống Đấu giá" <${process.env.EMAIL_USER}>`,
        to: process.env.EMAIL_USER, // Gửi cho chính mình để test
        subject: '🧪 [TEST] Email Configuration Test',
        html: `
            <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #28a745; border-radius: 8px; max-width: 600px;">
                <div style="background: linear-gradient(135deg, #28a745 0%, #20c997 100%); color: white; padding: 25px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                    <h2 style="margin: 0;">✅ Email Test Successful!</h2>
                </div>
                
                <p><strong>Chúc mừng!</strong> Email configuration đang hoạt động đúng.</p>
                
                <div style="background-color: #d4edda; padding: 15px; border-left: 4px solid #28a745; margin: 15px 0;">
                    <p style="margin: 0;"><strong>📧 From:</strong> ${process.env.EMAIL_USER}</p>
                    <p style="margin: 5px 0 0 0;"><strong>⏰ Time:</strong> ${new Date().toLocaleString('vi-VN')}</p>
                </div>

                <p>Nếu bạn nhận được email này, nghĩa là:</p>
                <ul>
                    <li>✅ Gmail SMTP đã kết nối thành công</li>
                    <li>✅ Email credentials đúng</li>
                    <li>✅ Hệ thống có thể gửi email</li>
                </ul>

                <hr style="margin: 20px 0; border: 1px solid #ddd;">
                <p style="font-size: 12px; color: #6c757d;">
                    Đây là email test tự động từ hệ thống đấu giá.
                </p>
            </div>
        `
    };

    try {
        console.log('📤 Đang gửi test email...');
        const info = await transporter.sendMail(testMailOptions);
        
        console.log('\n✅ GỬI EMAIL THÀNH CÔNG!');
        console.log('==========================================');
        console.log(`Message ID: ${info.messageId}`);
        console.log(`From: ${process.env.EMAIL_USER}`);
        console.log(`To: ${process.env.EMAIL_USER}`);
        console.log('==========================================');
        console.log('\n📬 Kiểm tra hộp thư của bạn!');
        console.log('   (Có thể ở Inbox hoặc Spam/Junk)\n');
        
        return true;
    } catch (error) {
        console.log('\n❌ GỬI EMAIL THẤT BẠI!');
        console.log('==========================================');
        console.log('Error:', error.message);
        console.log('Error code:', error.code);
        console.log('==========================================\n');
        
        if (error.code === 'EAUTH' || error.responseCode === 535) {
            console.log('🔐 LỖI XÁC THỰC (Authentication Failed)\n');
            console.log('Nguyên nhân: Gmail không chấp nhận password thường để gửi email.');
            console.log('Bạn cần sử dụng "App Password" (Mật khẩu ứng dụng).\n');
            
            console.log('📝 HƯỚNG DẪN TẠO GMAIL APP PASSWORD:\n');
            console.log('Bước 1: Truy cập https://myaccount.google.com/');
            console.log('Bước 2: Vào "Security" (Bảo mật) ở menu bên trái');
            console.log('Bước 3: Bật "2-Step Verification" (Xác minh 2 bước) nếu chưa bật');
            console.log('Bước 4: Tìm và click vào "App passwords" (Mật khẩu ứng dụng)');
            console.log('Bước 5: Chọn:');
            console.log('        - App: "Mail"');
            console.log('        - Device: "Other" → Nhập "Auction System"');
            console.log('Bước 6: Click "Generate" → Gmail sẽ tạo mật khẩu 16 ký tự');
            console.log('Bước 7: Copy mật khẩu đó (dạng: xxxx xxxx xxxx xxxx)');
            console.log('Bước 8: Paste vào .env file:');
            console.log(`        EMAIL_PASS=<app-password-16-ký-tự>\n`);
            console.log('Lưu ý: Không dùng dấu cách trong app password\n');
        } else if (error.code === 'ECONNECTION' || error.code === 'ETIMEDOUT') {
            console.log('🌐 LỖI KẾT NỐI\n');
            console.log('Nguyên nhân: Không thể kết nối đến Gmail SMTP server.');
            console.log('Giải pháp:');
            console.log('  - Kiểm tra kết nối Internet');
            console.log('  - Tắt VPN nếu đang bật');
            console.log('  - Kiểm tra firewall/antivirus có chặn port 587 không\n');
        }
        
        return false;
    }
}

testEmail();
