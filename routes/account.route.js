import express from 'express';
import bcrypt from 'bcryptjs';
import axios from 'axios';
import nodemailer from 'nodemailer';
import randomstring from 'randomstring';
import { isAuth, isSeller } from '../middlewares/auth.mdw.js';
import { transporter } from '../utils/mailer.js'; 
import * as userService from '../services/user.service.js';
import * as productService from '../services/product.service.js';

const router = express.Router();

const RECAPTCHA_SECRET_KEY = process.env.RECAPTCHA_SECRET;


router.get('/signup', function(req, res) {
    // Redirect if already logged in
    if (req.session.isAuthenticated) {
        return res.redirect('/');
    }
    
    // Save return URL if provided
    const retUrl = req.query.retUrl || req.headers.referer || '/';
    req.session.retUrl = retUrl;
    
    res.render('vwAccount/signup', { retUrl });
});

router.post('/signup',async function(req, res) {
    const captchaResponse = req.body['g-recaptcha-response'];
    if (!captchaResponse) {
        return res.render('vwAccount/signup', { err_message: 'Please complete the captcha.' });
    }

     try {
        const verifyUrl = `https://www.google.com/recaptcha/api/siteverify?secret=${RECAPTCHA_SECRET_KEY}&response=${captchaResponse}`;
        const response = await axios.post(verifyUrl);
        if (!response.data.success) {
            return res.render('vwAccount/signup', { err_message: 'Captcha verification failed.' });
        }
    } catch (error) {
        return res.render('vwAccount/signup', { err_message: 'Captcha error.' });
    }

    const user = await userService.findByEmail(req.body.email);
    if (user) {
        return res.render('vwAccount/signup', { err_message: 'Email already exists.' });
    }

    const hash = bcrypt.hashSync(req.body.password, 10);
    const otp = randomstring.generate({ length: 6, charset: 'numeric' });
    const otpExpired = new Date(Date.now() + 15 * 60 * 1000);


    const newUser = {
        password: hash,
        full_name: req.body.fullname,
        address: req.body.address,
        email: req.body.email,
        role: 0,
        is_verified: false,
        otp: otp,
        otp_expired: otpExpired
    };

    const mailOptions = {
        from: `"HỆ THỐNG ĐẤU GIÁ" <${process.env.EMAIL_USER}>`,
        to: req.body.email,
        subject: '🔐 [Xác thực] Mã OTP kích hoạt tài khoản của bạn',
        html: `
            <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #0d6efd; border-radius: 8px; max-width: 600px;">
                <div style="background: linear-gradient(135deg, #0d6efd 0%, #0dcaf0 100%); color: white; padding: 30px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                    <h1 style="margin: 0; font-size: 28px;">🎉 Chào mừng bạn!</h1>
                    <p style="margin: 10px 0 0 0; font-size: 16px;">Chào mừng đến với Hệ thống Đấu giá</p>
                </div>
                
                <p>Xin chào <strong>${req.body.fullname}</strong>,</p>
                <p>Cảm ơn bạn đã đăng ký tài khoản! Để hoàn tất quá trình đăng ký, vui lòng nhập mã OTP bên dưới:</p>
                
                <div style="background: linear-gradient(135deg, #6f42c1 0%, #d63384 100%); color: white; padding: 25px; text-align: center; border-radius: 8px; margin: 25px 0; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
                    <p style="margin: 0 0 10px 0; font-size: 14px; opacity: 0.9;">Mã OTP của bạn:</p>
                    <h2 style="margin: 0; font-size: 42px; letter-spacing: 8px; font-family: 'Courier New', monospace;">${otp}</h2>
                </div>

                <div style="background-color: #fff3cd; padding: 15px; border-left: 4px solid #ffc107; margin: 20px 0; border-radius: 4px;">
                    <p style="margin: 5px 0; color: #856404;">
                        <strong>⏰ Quan trọng:</strong> Mã này có hiệu lực trong <strong>15 phút</strong> kể từ khi nhận được email.
                    </p>
                </div>

                <div style="background-color: #f8f9fa; padding: 15px; border-radius: 6px; margin: 20px 0;">
                    <p style="margin: 5px 0; font-size: 14px;"><strong>📧 Email:</strong> ${req.body.email}</p>
                    <p style="margin: 5px 0; font-size: 14px;"><strong>👤 Họ tên:</strong> ${req.body.fullname}</p>
                    <p style="margin: 5px 0; font-size: 14px;"><strong>📍 Địa chỉ:</strong> ${req.body.address}</p>
                </div>

                <div style="background-color: #d1ecf1; padding: 12px; border-left: 4px solid #0dcaf0; margin: 20px 0; border-radius: 4px;">
                    <p style="margin: 0; color: #055160; font-size: 13px;">
                        <strong>🔒 Bảo mật:</strong> Không chia sẻ mã OTP này với bất kỳ ai. Chúng tôi sẽ không bao giờ yêu cầu mã OTP qua điện thoại hoặc email.
                    </p>
                </div>

                <hr style="margin: 30px 0; border: 1px solid #ddd;">
                
                <p style="font-size: 12px; color: #6c757d; line-height: 1.6;">
                    <strong>Câu hỏi thường gặp:</strong><br>
                    • Nếu bạn không yêu cầu đăng ký, vui lòng bỏ qua email này.<br>
                    • Mã OTP hết hạn sau 15 phút, bạn cần đăng ký lại nếu quá thời gian.<br>
                    • Liên hệ hỗ trợ: <a href="mailto:auctionproject01@gmail.com" style="color: #0d6efd;">auctionproject01@gmail.com</a>
                </p>

                <hr style="margin: 20px 0; border: 1px solid #ddd;">
                
                <p style="font-size: 11px; color: #6c757d; text-align: center; margin: 10px 0;">
                    Email này được gửi tự động từ Hệ thống Đấu giá. Vui lòng không trả lời email này.<br>
                    © 2025 Hệ thống Đấu giá - Tất cả quyền được bảo lưu
                </p>
            </div>
        `
    };

    // Send email first, only save user if email is sent successfully
    try {
        await transporter.sendMail(mailOptions);
        console.log('Email sent successfully to: ' + req.body.email);
        
        // Only save to database after email is sent
        await userService.add(newUser);
        
        return res.render('vwAccount/otp', { email: req.body.email });
    } catch (error) {
        console.log('Email send error:', error);
        return res.render('vwAccount/signup', { err_message: 'Could not send OTP email. Please try again.' });
    }
});

router.post('/otp', async function(req, res) {
    const { email, otp } = req.body;
    const result = await userService.verifyOTP(email, otp);
    
    if (result) {
        // AUTO LOGIN sau khi verify OTP thành công
        const user = await userService.findByEmail(email);
        req.session.isAuthenticated = true;
        req.session.authUser = user;
        req.session.successMessage = 'Đăng ký thành công! Chào mừng bạn đến với sàn đấu giá.';
        
        // Redirect to return URL if exists
        const retUrl = req.session.retUrl || '/';
        delete req.session.retUrl;
        res.redirect(retUrl);
    } else {
        res.render('vwAccount/otp', { email, err_message: 'Invalid OTP.' });
    }
});

router.get('/signin', function (req, res) {
    // Redirect if already logged in
    if (req.session.isAuthenticated) {
        return res.redirect('/');
    }
    
    // Save return URL if provided
    const retUrl = req.query.retUrl || req.headers.referer || '/';
    req.session.retUrl = retUrl;
    
    res.render('vwAccount/signin', { retUrl });
});

router.post('/signin', async function (req, res) {
    const email = req.body.email;
    const user = await userService.findByEmail(email);
    if (!user) {
        return res.render('vwAccount/signin', { errorMessage: 'Invalid email or password' });
    }
    const password = req.body.password;
    const ret = bcrypt.compareSync(password, user.password);
    if (ret === false) {
        return  res.render('vwAccount/signin', { errorMessage: 'Invalid email or password' });
    } 

    if (user.is_verified === 0 || user.is_verified === false) {
        return res.render('vwAccount/otp', { email: email, err_message: 'Please verify your email address.' });
    }

    req.session.isAuthenticated = true;
    req.session.authUser = user;
    const retUrl = req.session.retUrl || '/';
    delete req.session.retUrl;
    res.redirect(retUrl);
});

router.post('/signout', function (req, res) {
    req.session.isAuthenticated = false;
    delete req.session.authUser;
    const returnUrl = req.headers.referer || '/';
    res.redirect(returnUrl);
});

router.get('/profile',isAuth, async function (req, res) {
    const userId = req.session.authUser.id;
    const isPending = await userService.isPendingUpgrade(userId);

    res.render('vwAccount/profile', { 
        user: req.session.authUser,
        currentSection: 'profile',
        
        isPending: isPending,
        isBidder: req.session.authUser.role === 0
    });

});

router.post('/profile',isAuth, async function (req, res) {
    const id = req.session.authUser.id; 
    const newFullName = req.body.full_name;
    const newEmail = req.body.email;
    const currentEmail = req.session.authUser.email;

    if (newEmail === currentEmail) {
        const user = {
            full_name: newFullName,
        };
        
        await userService.update(id, user);
        
        req.session.authUser.full_name = newFullName;

        const isPending = await userService.isPendingUpgrade(id);

        
        return res.render('vwAccount/profile', { 
            user: req.session.authUser,
            currentSection: 'profile',
            success_message: 'Profile updated successfully!',
            isPending: isPending,       
            isBidder: req.session.authUser.role === 0
        });
    }

    const existingUser = await userService.findByEmail(newEmail);
    if (existingUser) {
        const isPending = await userService.isPendingUpgrade(id);
        return res.render('vwAccount/profile', { 
            user: req.session.authUser,
            currentSection: 'profile',
            err_message: 'Email already exists. Please choose another one.',
            isPending: isPending,
            isBidder: req.session.authUser.role === 0
        });
    }

    const otp = randomstring.generate({ length: 6, charset: 'numeric' });

    req.session.tempUpdate = {
        full_name: newFullName,
        email: newEmail,
        otp: otp
    };

    const mailOptions = {
        from: 'Auction System',
        to: newEmail, 
        subject: 'Verify Email Change',
        html: `
            <h3>You requested to change your email.</h3>
            <p>Your OTP code is: <b>${otp}</b></p>
            <p>If you did not request this, please ignore this email.</p>
        `
    };
    
    transporter.sendMail(mailOptions, function(error, info){
        if (error) {
            console.log(error);
            return res.render('vwAccount/profile', { 
                user: req.session.authUser,
                err_message: 'Could not send OTP. Please try again later.' 
            });
        } else {
            console.log('Email sent: ' + info.response);
            return res.redirect('/account/verify-email-change');
        }
    });
});

router.get('/verify-email-change', isAuth, function(req, res) {
    if (!req.session.tempUpdate) {
        return res.redirect('/account/profile');
    }
    
    res.render('vwAccount/otp-update', { 
        email: req.session.tempUpdate.email 
    });
});

router.post('/verify-email-change', isAuth, async function(req, res) {
    const { otp } = req.body;
    const tempData = req.session.tempUpdate;

    if (!tempData) {
        return res.redirect('/account/profile');
    }

    if (otp === tempData.otp) {
        const id = req.session.authUser.id;

        await userService.update(id, {
            full_name: tempData.full_name,
            email: tempData.email
        });

        req.session.authUser.full_name = tempData.full_name;
        req.session.authUser.email = tempData.email;

        delete req.session.tempUpdate;

        return res.render('vwAccount/profile', { 
            user: req.session.authUser,
            success_message: 'Email updated successfully!' 
        });
    } else {
        return res.render('vwAccount/otp-update', { 
            email: tempData.email, 
            err_message: 'Invalid OTP.' 
        });
    }
});

router.get('/change-password',isAuth , function (req, res) {
    res.render('VwAccount/change-password',{
        currentSection: 'password'
    });
});

router.post('/change-password', isAuth, async function (req, res) {
    const { current_password, new_password, confirm_password } = req.body;
    const userId = req.session.authUser.id;

    const user = await userService.findById(userId);

    const isMatch = bcrypt.compareSync(current_password, user.password);

    if (!isMatch) {
        return res.render('vwAccount/change-password', {
            err_message: 'Current password is incorrect.'
        });
    }

    if (new_password !== confirm_password) {
        return res.render('vwAccount/change-password', {
            err_message: 'New passwords do not match.'
        });
    }

    const newPasswordHash = bcrypt.hashSync(new_password, 10);

    await userService.update(userId, {
        password: newPasswordHash
    });

    res.render('vwAccount/change-password', {
        success_message: 'Password changed successfully!'
    });
});

router.get('/forgot-password', function (req, res) {
    res.render('vwAccount/forgot');
});

router.post('/forgot-password', async function (req, res) {
    const email = req.body.email;
    const user = await userService.findByEmail(email);

    if (!user) {
        return res.render('vwAccount/forgot', { err_message: 'Email does not exist.' });
    }

    const otp = randomstring.generate({ length: 6, charset: 'numeric' });
    await userService.update(user.id, { otp: otp });

    req.session.forgotEmail = email;

    const mailOptions = {
        from: `"HỆ THỐNG ĐẤU GIÁ" <${process.env.EMAIL_USER}>`,
        to: email,
        subject: 'Reset Password OTP',
        html: `<h3>Your OTP for password reset is: <b>${otp}</b></h3>`
    };

    transporter.sendMail(mailOptions, function(error, info){
        if (error) {
            console.log(error);
            return res.render('vwAccount/forgot', { err_message: 'Error sending email.' });
        } else {
            res.redirect('/account/forgot-password/otp');
        }
    });
});

router.get('/forgot-password/otp', function (req, res) {
    if (!req.session.forgotEmail) return res.redirect('/account/forgot-password');
    res.render('vwAccount/forgot-otp', { email: req.session.forgotEmail });
});

router.post('/forgot-password/otp', async function (req, res) {
    const email = req.session.forgotEmail;
    const inputOtp = req.body.otp;

    const user = await userService.findByEmail(email);
    
    if (user.otp === inputOtp) {
        req.session.otpVerified = true;
        res.redirect('/account/forgot-password/reset');
    } else {
        res.render('vwAccount/forgot-otp', { 
            email: email, 
            err_message: 'Invalid OTP code.' 
        });
    }
});

router.get('/forgot-password/reset', function (req, res) {
    if (!req.session.forgotEmail || !req.session.otpVerified) {
        return res.redirect('/account/forgot-password');
    }
    res.render('vwAccount/forgot-reset');
});

router.post('/forgot-password/reset', async function (req, res) {
    if (!req.session.forgotEmail || !req.session.otpVerified) {
        return res.redirect('/account/forgot-password');
    }

    const email = req.session.forgotEmail;
    const newPassword = req.body.password;
    
    const hash = bcrypt.hashSync(newPassword, 10);
    
    const user = await userService.findByEmail(email);
    
    await userService.update(user.id, { 
        password: hash,
        otp: null 
    });

    // AUTO LOGIN sau khi reset password thành công
    req.session.isAuthenticated = true;
    req.session.authUser = user;
    req.session.authUser.password = hash; // Update password in session

    delete req.session.forgotEmail;
    delete req.session.otpVerified;

    req.session.successMessage = 'Đặt lại mật khẩu thành công! Chào mừng bạn quay lại.';
    
    // Redirect về trang chủ, KHÔNG redirect về login
    res.redirect('/');
});

router.get('/watchlist', isAuth, async function (req, res) {
    const list = await userService.getWatchlist(req.session.authUser.id);
    res.render('vwAccount/watchlist', { 
        products: list, 
        empty: list.length === 0 ,
        currentSection: 'watchlist'
    });
});

router.get('/bidding', isAuth, async function (req, res) {
    const list = await userService.getBiddingList(req.session.authUser.id);
    res.render('vwAccount/bidding', { 
        products: list, 
        empty: list.length === 0,
        currentSection: 'bidding'
    });
});

router.get('/won', isAuth, async function (req, res) {
    const userId = req.session.authUser.id;
    const list = await userService.getWonList(userId);

    // ✅ OPTIMIZED: Parallel execution instead of sequential loop
    await Promise.all(list.map(async (item) => {
        item.is_rated = await userService.hasRated(item.id, userId);
    }));

    res.render('vwAccount/won', { 
        products: list, 
        empty: list.length === 0,
        currentSection: 'won'
    });
});

router.get('/ratings', isAuth, async function (req, res) {
    const list = await userService.getMyRatings(req.session.authUser.id);
    
    const total = list.length;
    const likes = list.filter(r => r.score === 1).length;
    const dislikes = total - likes;
    const ratio = total > 0 ? Math.round((likes / total) * 100) : 100;

    res.render('vwAccount/ratings', { 
        reviews: list,
        stats: { total, likes, dislikes, ratio },
        empty: list.length === 0,
        currentSection: 'ratings'
    });
});

router.post('/rate-seller', isAuth, async function (req, res) {
    const { product_id, seller_id, score, comment } = req.body;
    const rater_id = req.session.authUser.id;

    
    await userService.addRating({
        product_id,
        rater_id,
        rated_user_id: seller_id,
        score: parseInt(score),
        comment,
        created_at: new Date()
    });

    res.redirect('/account/profile');
});

router.post('/request-upgrade', isAuth, async function (req, res) {
    const userId = req.session.authUser.id;
    
    await userService.requestUpgrade(userId);
    
    res.redirect('/account/profile');
});

// Main route with filter support
router.get('/posted', isSeller, async function (req, res) {
    const sellerId = req.session.authUser.id;
    const filter = req.query.filter; // 'active', 'ended', or undefined (all)
    
    let list;
    let pageTitle = 'Sản phẩm của tôi';
    let filterType = 'all';
    let currentSection = 'posted';
    
    if (filter === 'active') {
        list = await productService.findBySellerWithStatus(sellerId, 1);
        pageTitle = 'Sản phẩm đang đấu giá';
        filterType = 'active';
        currentSection = 'posted-active';
    } else if (filter === 'ended') {
        list = await productService.findBySellerWithStatus(sellerId, 2);
        pageTitle = 'Sản phẩm đã kết thúc đấu giá';
        filterType = 'ended';
        currentSection = 'posted-ended';
    } else {
        list = await productService.findBySeller(sellerId);
    }

    res.render('vwAccount/posted', {
        products: list,
        empty: list.length === 0,
        currentSection,
        pageTitle,
        filterType,
        currentFilter: filter || 'all'
    });
});

router.get('/posted/active', isSeller, async function (req, res) {
    res.redirect('/account/posted?filter=active');
});

router.get('/posted/ended', isSeller, async function (req, res) {
    res.redirect('/account/posted?filter=ended');
});

export default router;

// routes/account.route.js

// 1. Route Đánh giá Người thắng (Giống hệt đánh giá Seller)
router.post('/rate-winner', isAuth, async function (req, res) {
    const { product_id, winner_id, score, comment } = req.body;
    const rater_id = req.session.authUser.id; // Seller

    await userService.addRating({
        product_id,
        rater_id,
        rated_user_id: winner_id, // Đánh giá người thắng
        score: parseInt(score),
        comment,
        created_at: new Date()
    });

    res.redirect('/account/posted');
});

router.post('/cancel-transaction', isAuth, async function (req, res) {
    const { product_id, winner_id } = req.body;
    const rater_id = req.session.authUser.id;

    await userService.addRating({
        product_id,
        rater_id,
        rated_user_id: winner_id,
        score: -1,
        comment: 'Người thắng không thanh toán',
        created_at: new Date()
    });


    res.redirect('/account/posted');
});