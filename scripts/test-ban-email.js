// Test ban email notification
import { transporter } from '../utils/mailer.js';
import db from '../utils/db.js';

async function testBanEmailFlow() {
    console.log('🧪 Testing ban email flow...\n');

    // Test 1: Check transporter config
    console.log('📧 Email config:');
    console.log(`   User: ${process.env.EMAIL_USER}`);
    console.log(`   Pass: ${process.env.EMAIL_PASS ? '***' + process.env.EMAIL_PASS.slice(-4) : 'NOT SET'}`);
    console.log();

    // Test 2: Verify transporter
    try {
        await transporter.verify();
        console.log('✅ Transporter verified successfully\n');
    } catch (err) {
        console.error('❌ Transporter verification failed:', err.message);
        return;
    }

    // Test 3: Send test email
    const testEmail = process.env.EMAIL_USER; // Send to yourself for testing
    console.log(`📤 Sending test email to ${testEmail}...`);

    const mailOptions = {
        from: `"HỆ THỐNG ĐẤU GIÁ" <${process.env.EMAIL_USER}>`,
        to: testEmail,
        subject: '🧪 [TEST] Email thông báo dẫn đầu đấu giá',
        html: `
            <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #28a745; border-radius: 8px; max-width: 600px;">
                <div style="background: linear-gradient(135deg, #28a745 0%, #20c997 100%); color: white; padding: 25px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                    <h2 style="margin: 0;">🎉 Bạn đang dẫn đầu!</h2>
                </div>
                
                <p>Đây là <strong>email test</strong> để kiểm tra chức năng thông báo người dẫn đầu mới.</p>
                
                <div style="background-color: #d4edda; padding: 15px; border-radius: 6px; margin: 15px 0; border-left: 4px solid #28a745;">
                    <h3 style="margin: 0 0 10px 0; color: #155724;">Sản phẩm Test</h3>
                    <p style="margin: 5px 0;"><strong>💰 Giá hiện tại của bạn:</strong> 
                        <span style="font-size: 1.4em; color: #28a745; font-weight: bold;">1,000,000 VND</span>
                    </p>
                </div>

                <p style="color: #6c757d; font-size: 0.9em;">
                    Nếu bạn nhận được email này, chức năng gửi email đã hoạt động! ✅
                </p>
            </div>
        `
    };

    try {
        const info = await transporter.sendMail(mailOptions);
        console.log('✅ Email sent successfully!');
        console.log(`   Message ID: ${info.messageId}`);
        console.log(`   Response: ${info.response}`);
        console.log('\n📬 Check your email inbox:', testEmail);
    } catch (err) {
        console.error('❌ Error sending email:', err.message);
        if (err.code) console.error('   Error code:', err.code);
        if (err.command) console.error('   Failed command:', err.command);
    }

    // Test 4: Check if there's a product with multiple bidders
    console.log('\n🔍 Checking database for testable products...');
    const productsWithBids = await db('products')
        .select('products.*')
        .count('bids.id as bid_count')
        .leftJoin('bids', 'products.id', 'bids.product_id')
        .where('bids.status', 1)
        .groupBy('products.id')
        .having(db.raw('count(bids.id)'), '>=', 2)
        .limit(3);

    if (productsWithBids.length > 0) {
        console.log(`\n✅ Found ${productsWithBids.length} products with 2+ bids suitable for testing:`);
        for (const p of productsWithBids) {
            const bids = await db('bids')
                .join('users', 'bids.bidder_id', 'users.id')
                .where('bids.product_id', p.id)
                .where('bids.status', 1)
                .orderBy('bids.price', 'desc')
                .select('users.email', 'users.full_name', 'bids.price')
                .limit(3);
            
            console.log(`\n   📦 Product #${p.id}: ${p.name}`);
            console.log(`      Current winner: ${p.winner_id}`);
            console.log(`      Top 3 bidders:`);
            bids.forEach((bid, i) => {
                console.log(`         ${i + 1}. ${bid.full_name} (${bid.email}) - ${bid.price.toLocaleString('vi-VN')} VND`);
            });
        }
        console.log('\n💡 You can test the ban feature by banning the top bidder on any of these products.');
    } else {
        console.log('⚠️ No products with 2+ bids found. Create some test bids first.');
    }

    await db.destroy();
}

testBanEmailFlow().catch(err => {
    console.error('❌ Test failed:', err);
    process.exit(1);
});
