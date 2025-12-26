// services/email.service.js
import { transporter } from '../utils/mailer.js';

const BASE_URL = process.env.BASE_URL || 'http://localhost:3000';
const FROM_EMAIL = `"HỆ THỐNG ĐẤU GIÁ" <${process.env.EMAIL_USER || 'auctionproject01@gmail.com'}>`;

/**
 * Send email when auction ends - to winner
 */
export async function sendAuctionWonEmail(product, winner) {
    if (!winner || !winner.email) {
        console.log(`[EMAIL] No winner email for product #${product.id}`);
        return false;
    }

    const mailOptions = {
        from: FROM_EMAIL,
        to: winner.email,
        subject: `🎉 [Chúc mừng] Bạn đã thắng đấu giá sản phẩm "${product.name}"`,
        html: `
            <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #28a745; border-radius: 8px; max-width: 600px;">
                <h2 style="color: #28a745; margin-top: 0;">🎉 Chúc mừng bạn đã thắng đấu giá!</h2>
                <p>Xin chào <strong>${winner.full_name || winner.email}</strong>,</p>
                <hr style="border: 1px solid #ddd;">
                <p>Bạn đã <strong style="color: #28a745;">thắng đấu giá</strong> cho sản phẩm:</p>
                <div style="background-color: #d4edda; padding: 15px; border-left: 4px solid #28a745; margin: 15px 0;">
                    <h3 style="margin: 0 0 10px 0; color: #155724;">${product.name}</h3>
                    <p style="margin: 5px 0;"><strong>Giá thắng:</strong> 
                        <span style="font-size: 1.3em; color: #28a745; font-weight: bold;">
                            ${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(product.current_price)}
                        </span>
                    </p>
                    <p style="margin: 5px 0; font-size: 0.9em; color: #6c757d;">ID sản phẩm: #${product.id}</p>
                </div>
                <hr style="border: 1px solid #ddd;">
                <p><strong>📋 Bước tiếp theo:</strong></p>
                <ol style="line-height: 1.8;">
                    <li>Người bán sẽ liên hệ với bạn để hoàn tất giao dịch</li>
                    <li>Vui lòng kiểm tra email và điện thoại trong vài ngày tới</li>
                    <li>Chuẩn bị thanh toán theo thỏa thuận với người bán</li>
                    <li>Sau khi nhận hàng, đánh giá người bán để tích lũy uy tín</li>
                </ol>
                <p style="color: #6c757d; font-size: 0.9em; margin-top: 20px;">
                    💡 Xem chi tiết sản phẩm và liên hệ người bán tại trang "Sản phẩm đã thắng" của bạn.
                </p>
                <div style="text-align: center; margin-top: 25px;">
                    <a href="${BASE_URL}/account/won" 
                       style="display: inline-block; background-color: #28a745; color: white; padding: 12px 30px; text-decoration: none; border-radius: 5px; font-weight: bold;">
                        Xem sản phẩm đã thắng →
                    </a>
                </div>
                <hr style="border: 1px solid #ddd; margin-top: 30px;">
                <p style="color: #6c757d; font-size: 0.85em; margin: 10px 0 0 0;">
                    Email này được gửi tự động từ hệ thống đấu giá. Vui lòng không trả lời email này.
                </p>
            </div>
        `
    };

    try {
        await transporter.sendMail(mailOptions);
        console.log(`[EMAIL] ✓ Auction won email sent to ${winner.email} for product #${product.id}`);
        return true;
    } catch (error) {
        console.error(`[EMAIL] ✗ Failed to send winner email for product #${product.id}:`, error.message);
        return false;
    }
}

/**
 * Send email when auction ends - to seller (with winner)
 */
export async function sendAuctionEndedWithWinnerEmail(product, seller, winner) {
    if (!seller || !seller.email) {
        console.log(`[EMAIL] No seller email for product #${product.id}`);
        return false;
    }

    const mailOptions = {
        from: FROM_EMAIL,
        to: seller.email,
        subject: `📊 [Kết thúc] Đấu giá sản phẩm "${product.name}" đã có người thắng`,
        html: `
            <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #0d6efd; border-radius: 8px; max-width: 600px;">
                <h2 style="color: #0d6efd; margin-top: 0;">📊 Đấu giá của bạn đã kết thúc</h2>
                <p>Xin chào <strong>${seller.full_name || seller.email}</strong>,</p>
                <hr style="border: 1px solid #ddd;">
                <p>Phiên đấu giá cho sản phẩm của bạn đã kết thúc với kết quả <strong style="color: #28a745;">CÓ NGƯỜI THẮNG</strong>:</p>
                <div style="background-color: #cfe2ff; padding: 15px; border-left: 4px solid #0d6efd; margin: 15px 0;">
                    <h3 style="margin: 0 0 10px 0; color: #084298;">${product.name}</h3>
                    <p style="margin: 5px 0;"><strong>✓ Người thắng:</strong> ${winner.full_name || 'N/A'}</p>
                    <p style="margin: 5px 0;"><strong>Email:</strong> ${winner.email}</p>
                    <p style="margin: 5px 0;"><strong>Giá cuối:</strong> 
                        <span style="font-size: 1.3em; color: #0d6efd; font-weight: bold;">
                            ${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(product.current_price)}
                        </span>
                    </p>
                    <p style="margin: 5px 0; font-size: 0.9em; color: #6c757d;">ID sản phẩm: #${product.id}</p>
                </div>
                <hr style="border: 1px solid #ddd;">
                <p><strong>📋 Bước tiếp theo:</strong></p>
                <ol style="line-height: 1.8;">
                    <li><strong>Liên hệ với người mua</strong> qua email <code>${winner.email}</code></li>
                    <li>Thỏa thuận phương thức thanh toán và giao hàng</li>
                    <li>Xác nhận thanh toán và gửi hàng cho người mua</li>
                    <li>Hoàn tất giao dịch và <strong>đánh giá người mua</strong></li>
                </ol>
                <div style="background-color: #fff3cd; padding: 12px; border-left: 4px solid #ffc107; margin: 15px 0;">
                    <p style="margin: 0; color: #856404;">
                        <strong>⚠️ Lưu ý:</strong> Vui lòng liên hệ người mua trong vòng 24-48 giờ để đảm bảo giao dịch diễn ra suôn sẻ.
                    </p>
                </div>
                <div style="text-align: center; margin-top: 25px;">
                    <a href="${BASE_URL}/account/posted" 
                       style="display: inline-block; background-color: #0d6efd; color: white; padding: 12px 30px; text-decoration: none; border-radius: 5px; font-weight: bold;">
                        Xem sản phẩm của tôi →
                    </a>
                </div>
                <hr style="border: 1px solid #ddd; margin-top: 30px;">
                <p style="color: #6c757d; font-size: 0.85em; margin: 10px 0 0 0;">
                    Email này được gửi tự động từ hệ thống đấu giá. Vui lòng không trả lời email này.
                </p>
            </div>
        `
    };

    try {
        await transporter.sendMail(mailOptions);
        console.log(`[EMAIL] ✓ Auction ended (with winner) email sent to seller ${seller.email} for product #${product.id}`);
        return true;
    } catch (error) {
        console.error(`[EMAIL] ✗ Failed to send seller email for product #${product.id}:`, error.message);
        return false;
    }
}

/**
 * Send email when auction ends - to seller (no winner)
 */
export async function sendAuctionEndedNoWinnerEmail(product, seller) {
    if (!seller || !seller.email) {
        console.log(`[EMAIL] No seller email for product #${product.id}`);
        return false;
    }

    const mailOptions = {
        from: FROM_EMAIL,
        to: seller.email,
        subject: `📊 [Kết thúc] Đấu giá sản phẩm "${product.name}" không có người thắng`,
        html: `
            <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #dc3545; border-radius: 8px; max-width: 600px;">
                <h2 style="color: #dc3545; margin-top: 0;">📊 Đấu giá của bạn đã kết thúc</h2>
                <p>Xin chào <strong>${seller.full_name || seller.email}</strong>,</p>
                <hr style="border: 1px solid #ddd;">
                <p>Phiên đấu giá cho sản phẩm của bạn đã kết thúc <strong style="color: #dc3545;">KHÔNG CÓ NGƯỜI ĐẶT GIÁ</strong>:</p>
                <div style="background-color: #f8d7da; padding: 15px; border-left: 4px solid #dc3545; margin: 15px 0;">
                    <h3 style="margin: 0 0 10px 0; color: #721c24;">${product.name}</h3>
                    <p style="margin: 5px 0; color: #721c24;"><strong>✗ Không có người đặt giá</strong></p>
                    <p style="margin: 5px 0;"><strong>Giá khởi điểm:</strong> 
                        <span style="font-size: 1.1em;">
                            ${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(product.start_price)}
                        </span>
                    </p>
                    <p style="margin: 5px 0; font-size: 0.9em; color: #6c757d;">ID sản phẩm: #${product.id}</p>
                </div>
                <hr style="border: 1px solid #ddd;">
                <p><strong>💡 Gợi ý:</strong></p>
                <ul style="line-height: 1.8;">
                    <li>Xem xét <strong>giảm giá khởi điểm</strong> để thu hút người mua</li>
                    <li>Cải thiện <strong>mô tả và hình ảnh</strong> sản phẩm</li>
                    <li>Chọn <strong>thời gian đấu giá</strong> phù hợp hơn</li>
                    <li>Đăng lại sản phẩm với chiến lược mới</li>
                </ul>
                <div style="text-align: center; margin-top: 25px;">
                    <a href="${BASE_URL}/account/posted" 
                       style="display: inline-block; background-color: #dc3545; color: white; padding: 12px 30px; text-decoration: none; border-radius: 5px; font-weight: bold;">
                        Xem sản phẩm của tôi →
                    </a>
                </div>
                <hr style="border: 1px solid #ddd; margin-top: 30px;">
                <p style="color: #6c757d; font-size: 0.85em; margin: 10px 0 0 0;">
                    Email này được gửi tự động từ hệ thống đấu giá. Vui lòng không trả lời email này.
                </p>
            </div>
        `
    };

    try {
        await transporter.sendMail(mailOptions);
        console.log(`[EMAIL] ✓ Auction ended (no winner) email sent to seller ${seller.email} for product #${product.id}`);
        return true;
    } catch (error) {
        console.error(`[EMAIL] ✗ Failed to send seller email for product #${product.id}:`, error.message);
        return false;
    }
}

/**
 * Process auction ending - update status and send emails
 */
export async function processAuctionEnd(product, winner, seller) {
    const results = {
        statusUpdated: true,
        winnerEmailSent: false,
        sellerEmailSent: false
    };

    // Send emails based on whether there's a winner
    if (winner && winner.email) {
        results.winnerEmailSent = await sendAuctionWonEmail(product, winner);
        results.sellerEmailSent = await sendAuctionEndedWithWinnerEmail(product, seller, winner);
    } else {
        results.sellerEmailSent = await sendAuctionEndedNoWinnerEmail(product, seller);
    }

    return results;
}

// ============================================
// TRANSACTION EMAIL TEMPLATES (Phase 2)
// ============================================

/**
 * Send email when buyer submits payment (Step 1)
 */
export async function sendPaymentReceivedEmail(transaction, seller, product) {
    if (!seller || !seller.email) {
        console.log(`[EMAIL] No seller email for transaction #${transaction.id}`);
        return false;
    }

    const mailOptions = {
        from: FROM_EMAIL,
        to: seller.email,
        subject: `💰 [Thanh toán] Người mua đã thanh toán cho "${product.name}"`,
        html: `
            <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #28a745; border-radius: 8px; max-width: 600px;">
                <div style="background: linear-gradient(135deg, #28a745 0%, #20c997 100%); color: white; padding: 30px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                    <h2 style="margin: 0;">💰 Đã nhận thanh toán!</h2>
                </div>
                
                <p>Xin chào <strong>${seller.full_name || seller.email}</strong>,</p>
                <p>Người mua đã upload hoá đơn thanh toán cho sản phẩm của bạn.</p>
                
                <div style="background-color: #d4edda; padding: 20px; border-radius: 6px; margin: 20px 0; border-left: 4px solid #28a745;">
                    <h3 style="margin: 0 0 10px 0; color: #155724;">${product.name}</h3>
                    <p style="margin: 5px 0;"><strong>Giá cuối:</strong> 
                        <span style="font-size: 1.3em; color: #28a745; font-weight: bold;">
                            ${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(transaction.final_price)}
                        </span>
                    </p>
                    <p style="margin: 5px 0;"><strong>Địa chỉ giao hàng:</strong></p>
                    <p style="margin: 5px 0; padding: 10px; background: white; border-radius: 4px;">${transaction.shipping_address}</p>
                </div>

                <p><strong>📋 Bước tiếp theo:</strong></p>
                <ol style="line-height: 1.8;">
                    <li>Kiểm tra hoá đơn thanh toán</li>
                    <li>Đóng gói và gửi hàng đến địa chỉ trên</li>
                    <li>Cập nhật mã vận đơn trên hệ thống</li>
                </ol>

                <p style="text-align: center; margin-top: 30px;">
                    <a href="${BASE_URL}/transaction/${product.id}" 
                       style="display: inline-block; background-color: #28a745; color: white; padding: 12px 24px; text-decoration: none; border-radius: 6px; font-weight: bold;">
                        Xem chi tiết giao dịch →
                    </a>
                </p>

                <hr style="margin: 30px 0; border: 1px solid #ddd;">
                <p style="font-size: 12px; color: #6c757d; margin: 0;">
                    Email này được gửi tự động từ hệ thống đấu giá. Vui lòng không trả lời email này.
                </p>
            </div>
        `
    };

    try {
        await transporter.sendMail(mailOptions);
        console.log(`[EMAIL] ✓ Payment received email sent to ${seller.email} for transaction #${transaction.id}`);
        return true;
    } catch (error) {
        console.error(`[EMAIL] ✗ Failed to send payment email for transaction #${transaction.id}:`, error.message);
        return false;
    }
}

/**
 * Send email when seller confirms shipping (Step 2)
 */
export async function sendShippingConfirmedEmail(transaction, buyer, product) {
    if (!buyer || !buyer.email) {
        console.log(`[EMAIL] No buyer email for transaction #${transaction.id}`);
        return false;
    }

    const mailOptions = {
        from: FROM_EMAIL,
        to: buyer.email,
        subject: `📦 [Gửi hàng] Người bán đã gửi hàng cho "${product.name}"`,
        html: `
            <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #0d6efd; border-radius: 8px; max-width: 600px;">
                <div style="background: linear-gradient(135deg, #0d6efd 0%, #0dcaf0 100%); color: white; padding: 30px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                    <h2 style="margin: 0;">📦 Hàng đã được gửi!</h2>
                </div>
                
                <p>Xin chào <strong>${buyer.full_name || buyer.email}</strong>,</p>
                <p>Người bán đã xác nhận gửi hàng cho sản phẩm bạn đã thắng đấu giá.</p>
                
                <div style="background-color: #cfe2ff; padding: 20px; border-radius: 6px; margin: 20px 0; border-left: 4px solid #0d6efd;">
                    <h3 style="margin: 0 0 10px 0; color: #084298;">${product.name}</h3>
                    <p style="margin: 5px 0;"><strong>Mã vận đơn:</strong> 
                        <code style="background: white; padding: 5px 10px; border-radius: 4px; font-size: 1.1em; color: #0d6efd;">
                            ${transaction.shipping_tracking}
                        </code>
                    </p>
                    <p style="margin: 5px 0;"><strong>Giá trị:</strong> 
                        ${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(transaction.final_price)}
                    </p>
                </div>

                <p><strong>📋 Bước tiếp theo:</strong></p>
                <ol style="line-height: 1.8;">
                    <li>Theo dõi đơn hàng bằng mã vận đơn trên</li>
                    <li>Kiểm tra sản phẩm khi nhận hàng</li>
                    <li>Xác nhận đã nhận hàng trên hệ thống</li>
                    <li>Đánh giá người bán để hoàn tất giao dịch</li>
                </ol>

                <p style="text-align: center; margin-top: 30px;">
                    <a href="${BASE_URL}/transaction/${product.id}" 
                       style="display: inline-block; background-color: #0d6efd; color: white; padding: 12px 24px; text-decoration: none; border-radius: 6px; font-weight: bold;">
                        Xem chi tiết giao dịch →
                    </a>
                </p>

                <hr style="margin: 30px 0; border: 1px solid #ddd;">
                <p style="font-size: 12px; color: #6c757d; margin: 0;">
                    Email này được gửi tự động từ hệ thống đấu giá. Vui lòng không trả lời email này.
                </p>
            </div>
        `
    };

    try {
        await transporter.sendMail(mailOptions);
        console.log(`[EMAIL] ✓ Shipping confirmed email sent to ${buyer.email} for transaction #${transaction.id}`);
        return true;
    } catch (error) {
        console.error(`[EMAIL] ✗ Failed to send shipping email for transaction #${transaction.id}:`, error.message);
        return false;
    }
}

/**
 * Send email when buyer confirms received (Step 3)
 */
export async function sendReceivedConfirmedEmail(transaction, buyer, seller, product) {
    const emails = [];
    
    // Email to buyer
    if (buyer && buyer.email) {
        emails.push({
            from: FROM_EMAIL,
            to: buyer.email,
            subject: `✅ [Xác nhận] Bạn đã xác nhận nhận hàng cho "${product.name}"`,
            html: `
                <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #198754; border-radius: 8px; max-width: 600px;">
                    <div style="background: linear-gradient(135deg, #198754 0%, #20c997 100%); color: white; padding: 30px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                        <h2 style="margin: 0;">✅ Đã nhận hàng!</h2>
                    </div>
                    
                    <p>Xin chào <strong>${buyer.full_name || buyer.email}</strong>,</p>
                    <p>Bạn đã xác nhận nhận hàng cho sản phẩm <strong>${product.name}</strong>.</p>
                    
                    <div style="background-color: #d1e7dd; padding: 20px; border-radius: 6px; margin: 20px 0; border-left: 4px solid #198754;">
                        <p style="margin: 0;"><strong>Bước cuối cùng:</strong> Vui lòng đánh giá người bán để hoàn tất giao dịch.</p>
                    </div>

                    <p style="text-align: center; margin-top: 30px;">
                        <a href="${BASE_URL}/transaction/${product.id}" 
                           style="display: inline-block; background-color: #ffc107; color: #000; padding: 12px 24px; text-decoration: none; border-radius: 6px; font-weight: bold;">
                            Đánh giá người bán →
                        </a>
                    </p>

                    <hr style="margin: 30px 0; border: 1px solid #ddd;">
                    <p style="font-size: 12px; color: #6c757d; margin: 0;">
                        Email này được gửi tự động từ hệ thống đấu giá.
                    </p>
                </div>
            `
        });
    }

    // Email to seller
    if (seller && seller.email) {
        emails.push({
            from: FROM_EMAIL,
            to: seller.email,
            subject: `✅ [Xác nhận] Người mua đã nhận hàng cho "${product.name}"`,
            html: `
                <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #198754; border-radius: 8px; max-width: 600px;">
                    <div style="background: linear-gradient(135deg, #198754 0%, #20c997 100%); color: white; padding: 30px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                        <h2 style="margin: 0;">✅ Người mua đã nhận hàng!</h2>
                    </div>
                    
                    <p>Xin chào <strong>${seller.full_name || seller.email}</strong>,</p>
                    <p>Người mua đã xác nhận nhận hàng cho sản phẩm <strong>${product.name}</strong>.</p>
                    
                    <div style="background-color: #d1e7dd; padding: 20px; border-radius: 6px; margin: 20px 0; border-left: 4px solid #198754;">
                        <p style="margin: 0;"><strong>Bước cuối cùng:</strong> Vui lòng đánh giá người mua để hoàn tất giao dịch.</p>
                    </div>

                    <p style="text-align: center; margin-top: 30px;">
                        <a href="${BASE_URL}/transaction/${product.id}" 
                           style="display: inline-block; background-color: #ffc107; color: #000; padding: 12px 24px; text-decoration: none; border-radius: 6px; font-weight: bold;">
                            Đánh giá người mua →
                        </a>
                    </p>

                    <hr style="margin: 30px 0; border: 1px solid #ddd;">
                    <p style="font-size: 12px; color: #6c757d; margin: 0;">
                        Email này được gửi tự động từ hệ thống đấu giá.
                    </p>
                </div>
            `
        });
    }

    // Send all emails
    try {
        await Promise.all(emails.map(mail => transporter.sendMail(mail)));
        console.log(`[EMAIL] ✓ Received confirmed emails sent for transaction #${transaction.id}`);
        return true;
    } catch (error) {
        console.error(`[EMAIL] ✗ Failed to send received emails for transaction #${transaction.id}:`, error.message);
        return false;
    }
}

/**
 * Send email when both parties have rated (Step 4 complete)
 */
export async function sendTransactionCompleteEmail(transaction, buyer, seller, product) {
    const emails = [];
    
    // Email to buyer
    if (buyer && buyer.email) {
        emails.push({
            from: FROM_EMAIL,
            to: buyer.email,
            subject: `🎉 [Hoàn tất] Giao dịch cho "${product.name}" đã hoàn tất`,
            html: `
                <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #6f42c1; border-radius: 8px; max-width: 600px;">
                    <div style="background: linear-gradient(135deg, #6f42c1 0%, #d63384 100%); color: white; padding: 30px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                        <h2 style="margin: 0;">🎉 Giao dịch hoàn tất!</h2>
                    </div>
                    
                    <p>Xin chào <strong>${buyer.full_name || buyer.email}</strong>,</p>
                    <p>Giao dịch cho sản phẩm <strong>${product.name}</strong> đã hoàn tất với cả hai bên đã đánh giá nhau.</p>
                    
                    <div style="background-color: #e0cffc; padding: 20px; border-radius: 6px; margin: 20px 0; border-left: 4px solid #6f42c1;">
                        <p style="margin: 5px 0;"><strong>Giá trị giao dịch:</strong> 
                            ${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(transaction.final_price)}
                        </p>
                        <p style="margin: 5px 0;">Cảm ơn bạn đã sử dụng hệ thống đấu giá của chúng tôi!</p>
                    </div>

                    <p style="text-align: center; margin-top: 30px;">
                        <a href="${BASE_URL}" 
                           style="display: inline-block; background-color: #6f42c1; color: white; padding: 12px 24px; text-decoration: none; border-radius: 6px; font-weight: bold;">
                            Khám phá thêm sản phẩm →
                        </a>
                    </p>

                    <hr style="margin: 30px 0; border: 1px solid #ddd;">
                    <p style="font-size: 12px; color: #6c757d; margin: 0;">
                        Email này được gửi tự động từ hệ thống đấu giá.
                    </p>
                </div>
            `
        });
    }

    // Email to seller
    if (seller && seller.email) {
        emails.push({
            from: FROM_EMAIL,
            to: seller.email,
            subject: `🎉 [Hoàn tất] Giao dịch cho "${product.name}" đã hoàn tất`,
            html: `
                <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #6f42c1; border-radius: 8px; max-width: 600px;">
                    <div style="background: linear-gradient(135deg, #6f42c1 0%, #d63384 100%); color: white; padding: 30px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                        <h2 style="margin: 0;">🎉 Giao dịch hoàn tất!</h2>
                    </div>
                    
                    <p>Xin chào <strong>${seller.full_name || seller.email}</strong>,</p>
                    <p>Giao dịch cho sản phẩm <strong>${product.name}</strong> đã hoàn tất với cả hai bên đã đánh giá nhau.</p>
                    
                    <div style="background-color: #e0cffc; padding: 20px; border-radius: 6px; margin: 20px 0; border-left: 4px solid #6f42c1;">
                        <p style="margin: 5px 0;"><strong>Giá bán:</strong> 
                            ${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(transaction.final_price)}
                        </p>
                        <p style="margin: 5px 0;">Cảm ơn bạn đã sử dụng hệ thống đấu giá của chúng tôi!</p>
                    </div>

                    <p style="text-align: center; margin-top: 30px;">
                        <a href="${BASE_URL}/products/upload" 
                           style="display: inline-block; background-color: #6f42c1; color: white; padding: 12px 24px; text-decoration: none; border-radius: 6px; font-weight: bold;">
                            Đăng sản phẩm mới →
                        </a>
                    </p>

                    <hr style="margin: 30px 0; border: 1px solid #ddd;">
                    <p style="font-size: 12px; color: #6c757d; margin: 0;">
                        Email này được gửi tự động từ hệ thống đấu giá.
                    </p>
                </div>
            `
        });
    }

    // Send all emails
    try {
        await Promise.all(emails.map(mail => transporter.sendMail(mail)));
        console.log(`[EMAIL] ✓ Transaction complete emails sent for transaction #${transaction.id}`);
        return true;
    } catch (error) {
        console.error(`[EMAIL] ✗ Failed to send complete emails for transaction #${transaction.id}:`, error.message);
        return false;
    }
}

/**
 * Send email when seller cancels transaction
 */
export async function sendTransactionCanceledEmail(transaction, buyer, product, reason) {
    if (!buyer || !buyer.email) {
        console.log(`[EMAIL] No buyer email for canceled transaction #${transaction.id}`);
        return false;
    }

    const mailOptions = {
        from: FROM_EMAIL,
        to: buyer.email,
        subject: `❌ [Hủy] Giao dịch cho "${product.name}" đã bị hủy`,
        html: `
            <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #dc3545; border-radius: 8px; max-width: 600px;">
                <div style="background: linear-gradient(135deg, #dc3545 0%, #d63384 100%); color: white; padding: 30px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                    <h2 style="margin: 0;">❌ Giao dịch đã bị hủy</h2>
                </div>
                
                <p>Xin chào <strong>${buyer.full_name || buyer.email}</strong>,</p>
                <p>Rất tiếc, người bán đã hủy giao dịch cho sản phẩm <strong>${product.name}</strong>.</p>
                
                <div style="background-color: #f8d7da; padding: 20px; border-radius: 6px; margin: 20px 0; border-left: 4px solid #dc3545;">
                    <p style="margin: 5px 0;"><strong>Lý do:</strong> ${reason || 'Không được cung cấp'}</p>
                    <p style="margin: 5px 0; color: #721c24;">
                        <strong>Lưu ý:</strong> Bạn đã nhận đánh giá -1 từ người bán do giao dịch bị hủy.
                    </p>
                </div>

                <p>Chúng tôi rất tiếc về sự bất tiện này. Vui lòng tiếp tục khám phá các sản phẩm khác trên hệ thống.</p>

                <p style="text-align: center; margin-top: 30px;">
                    <a href="${BASE_URL}" 
                       style="display: inline-block; background-color: #0d6efd; color: white; padding: 12px 24px; text-decoration: none; border-radius: 6px; font-weight: bold;">
                        Xem sản phẩm khác →
                    </a>
                </p>

                <hr style="margin: 30px 0; border: 1px solid #ddd;">
                <p style="font-size: 12px; color: #6c757d; margin: 0;">
                    Email này được gửi tự động từ hệ thống đấu giá.
                </p>
            </div>
        `
    };

    try {
        await transporter.sendMail(mailOptions);
        console.log(`[EMAIL] ✓ Transaction canceled email sent to ${buyer.email} for transaction #${transaction.id}`);
        return true;
    } catch (error) {
        console.error(`[EMAIL] ✗ Failed to send canceled email for transaction #${transaction.id}:`, error.message);
        return false;
    }
}

/**
 * Send email when user receives a new chat message
 */
export async function sendNewMessageEmail(recipient, sender, messagePreview) {
    if (!recipient || !recipient.email) {
        console.log(`[EMAIL] No recipient email`);
        return false;
    }

    const mailOptions = {
        from: FROM_EMAIL,
        to: recipient.email,
        subject: `💬 [Tin nhắn mới] Bạn có tin nhắn mới từ ${sender.full_name}`,
        html: `
            <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #0d6efd; border-radius: 8px; max-width: 600px;">
                <div style="background: linear-gradient(135deg, #0d6efd 0%, #0dcaf0 100%); color: white; padding: 25px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                    <h2 style="margin: 0;">💬 Tin nhắn mới!</h2>
                </div>
                
                <p>Xin chào <strong>${recipient.full_name}</strong>,</p>
                <p>Bạn có tin nhắn mới từ <strong>${sender.full_name}</strong>:</p>
                
                <div style="background-color: #f8f9fa; padding: 15px; border-radius: 6px; margin: 15px 0; border-left: 4px solid #0d6efd;">
                    <p style="margin: 5px 0;"><strong>👤 Từ:</strong> ${sender.full_name}</p>
                    <p style="margin: 5px 0;"><strong>📧 Email:</strong> <a href="mailto:${sender.email}" style="color: #0d6efd;">${sender.email}</a></p>
                    <p style="margin: 10px 0 5px 0;"><strong>💭 Nội dung:</strong></p>
                    <div style="background-color: white; padding: 15px; border-left: 3px solid #0d6efd; font-style: italic; color: #212529;">
                        "${messagePreview}"
                    </div>
                </div>

                <p style="text-align: center; margin-top: 25px;">
                    <a href="${BASE_URL}/chat/with/${sender.id}" style="display: inline-block; background-color: #0d6efd; color: white; padding: 12px 30px; text-decoration: none; border-radius: 6px; font-weight: bold;">
                        💬 Trả lời ngay →
                    </a>
                </p>

                <hr style="margin: 30px 0; border: 1px solid #ddd;">
                <p style="font-size: 12px; color: #6c757d; margin: 0;">
                    Email này được gửi tự động từ Hệ thống Đấu giá. Vui lòng không trả lời email này.<br>
                    Liên hệ trực tiếp: <a href="mailto:${sender.email}">${sender.email}</a>
                </p>
            </div>
        `
    };

    try {
        await transporter.sendMail(mailOptions);
        console.log(`[EMAIL] ✓ New message email sent to ${recipient.email}`);
        return true;
    } catch (error) {
        console.error(`[EMAIL] ✗ Failed to send message email:`, error.message);
        return false;
    }
}

/**
 * Send email when admin approves upgrade request
 */
export async function sendUpgradeApprovedEmail(user) {
    if (!user || !user.email) {
        console.log(`[EMAIL] No user email for upgrade approval`);
        return false;
    }

    const mailOptions = {
        from: FROM_EMAIL,
        to: user.email,
        subject: `🎉 [Phê duyệt] Yêu cầu nâng cấp tài khoản Seller đã được chấp thuận`,
        html: `
            <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #28a745; border-radius: 8px; max-width: 600px;">
                <div style="background: linear-gradient(135deg, #28a745 0%, #20c997 100%); color: white; padding: 30px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                    <h1 style="margin: 0; font-size: 28px;">🎉 Chúc mừng!</h1>
                    <p style="margin: 10px 0 0 0; font-size: 16px;">Tài khoản của bạn đã được nâng cấp</p>
                </div>
                
                <p>Xin chào <strong>${user.full_name}</strong>,</p>
                <p>Yêu cầu nâng cấp tài khoản của bạn đã được <strong style="color: #28a745;">PHÊ DUYỆT</strong>!</p>
                
                <div style="background-color: #d4edda; padding: 20px; border-radius: 6px; margin: 20px 0; border-left: 4px solid #28a745;">
                    <h3 style="margin: 0 0 10px 0; color: #155724;">✨ Quyền lợi mới của bạn:</h3>
                    <ul style="margin: 10px 0; padding-left: 20px; line-height: 1.8;">
                        <li>📦 Đăng sản phẩm đấu giá không giới hạn</li>
                        <li>💰 Nhận thanh toán từ người mua</li>
                        <li>📊 Quản lý sản phẩm và đơn hàng</li>
                        <li>⭐ Nhận đánh giá từ người mua</li>
                        <li>🚫 Quyền từ chối người đấu giá</li>
                    </ul>
                </div>

                <div style="background-color: #d1ecf1; padding: 15px; border-left: 4px solid #0dcaf0; margin: 20px 0; border-radius: 4px;">
                    <p style="margin: 0; color: #055160;">
                        <strong>🎯 Bắt đầu ngay:</strong> Truy cập trang "Đăng sản phẩm" để bắt đầu bán hàng!
                    </p>
                </div>

                <p style="text-align: center; margin-top: 25px;">
                    <a href="${BASE_URL}/products/upload" style="display: inline-block; background-color: #28a745; color: white; padding: 14px 35px; text-decoration: none; border-radius: 6px; font-weight: bold; font-size: 16px;">
                        📦 Đăng sản phẩm ngay →
                    </a>
                </p>

                <hr style="margin: 30px 0; border: 1px solid #ddd;">
                
                <p style="font-size: 12px; color: #6c757d; line-height: 1.6;">
                    <strong>Lưu ý:</strong><br>
                    • Tuân thủ quy định của sàn đấu giá<br>
                    • Mô tả sản phẩm chính xác và trung thực<br>
                    • Giao hàng đúng hạn và đúng mô tả<br>
                    • Hỗ trợ: <a href="mailto:${process.env.EMAIL_USER}" style="color: #0d6efd;">${process.env.EMAIL_USER}</a>
                </p>

                <hr style="margin: 20px 0; border: 1px solid #ddd;">
                
                <p style="font-size: 11px; color: #6c757d; text-align: center; margin: 10px 0;">
                    Email này được gửi tự động từ Hệ thống Đấu giá. Vui lòng không trả lời email này.<br>
                    © 2025 Hệ thống Đấu giá - Tất cả quyền được bảo lưu
                </p>
            </div>
        `
    };

    try {
        await transporter.sendMail(mailOptions);
        console.log(`[EMAIL] ✓ Upgrade approved email sent to ${user.email}`);
        return true;
    } catch (error) {
        console.error(`[EMAIL] ✗ Failed to send upgrade email:`, error.message);
        return false;
    }
}

/**
 * Send email when admin rejects upgrade request
 */
export async function sendUpgradeRejectedEmail(user, reason) {
    if (!user || !user.email) {
        console.log(`[EMAIL] No user email for upgrade rejection`);
        return false;
    }

    const mailOptions = {
        from: FROM_EMAIL,
        to: user.email,
        subject: `❌ [Từ chối] Yêu cầu nâng cấp tài khoản Seller chưa được chấp thuận`,
        html: `
            <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #dc3545; border-radius: 8px; max-width: 600px;">
                <div style="background: linear-gradient(135deg, #dc3545 0%, #d63384 100%); color: white; padding: 25px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                    <h2 style="margin: 0;">❌ Thông báo từ hệ thống</h2>
                </div>
                
                <p>Xin chào <strong>${user.full_name}</strong>,</p>
                <p>Rất tiếc, yêu cầu nâng cấp tài khoản Seller của bạn <strong style="color: #dc3545;">chưa được chấp thuận</strong>.</p>
                
                <div style="background-color: #f8d7da; padding: 15px; border-radius: 6px; margin: 15px 0; border-left: 4px solid #dc3545;">
                    <p style="margin: 0;"><strong>Lý do:</strong> ${reason || 'Chưa đáp ứng yêu cầu của hệ thống'}</p>
                </div>

                <div style="background-color: #fff3cd; padding: 15px; border-left: 4px solid #ffc107; margin: 20px 0; border-radius: 4px;">
                    <p style="margin: 5px 0; color: #856404;">
                        <strong>💡 Gợi ý:</strong><br>
                        • Hoàn thiện thông tin cá nhân<br>
                        • Tăng điểm uy tín bằng cách tham gia đấu giá<br>
                        • Liên hệ admin để biết thêm chi tiết<br>
                        • Có thể gửi lại yêu cầu sau khi cải thiện
                    </p>
                </div>

                <p style="text-align: center; margin-top: 25px;">
                    <a href="${BASE_URL}/account/profile" style="display: inline-block; background-color: #0d6efd; color: white; padding: 12px 30px; text-decoration: none; border-radius: 6px; font-weight: bold;">
                        📝 Cập nhật hồ sơ →
                    </a>
                </p>

                <hr style="margin: 30px 0; border: 1px solid #ddd;">
                <p style="font-size: 12px; color: #6c757d; margin: 0;">
                    Liên hệ hỗ trợ: <a href="mailto:${process.env.EMAIL_USER}" style="color: #0d6efd;">${process.env.EMAIL_USER}</a><br>
                    Email này được gửi tự động từ Hệ thống Đấu giá.
                </p>
            </div>
        `
    };

    try {
        await transporter.sendMail(mailOptions);
        console.log(`[EMAIL] ✓ Upgrade rejected email sent to ${user.email}`);
        return true;
    } catch (error) {
        console.error(`[EMAIL] ✗ Failed to send rejection email:`, error.message);
        return false;
    }
}

export default {
    sendAuctionWonEmail,
    sendAuctionEndedWithWinnerEmail,
    sendAuctionEndedNoWinnerEmail,
    processAuctionEnd,
    // Transaction emails
    sendPaymentReceivedEmail,
    sendShippingConfirmedEmail,
    sendReceivedConfirmedEmail,
    sendTransactionCompleteEmail,
    sendTransactionCanceledEmail,
    // Chat & Admin emails
    sendNewMessageEmail,
    sendUpgradeApprovedEmail,
    sendUpgradeRejectedEmail
};

