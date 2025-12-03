import express from 'express';
import * as productService from '../services/product.service.js';
import * as userService from '../services/user.service.js';
import nodemailer from 'nodemailer';
import db from '../utils/db.js';
import { transporter } from '../utils/mailer.js';


const router = express.Router();


router.post('/question', async function(req, res) {
    if (!req.session.isAuthenticated) {
        return res.redirect(`/account/signin?retUrl=/products/detail/${req.body.proId}`);
    }

    const proId = req.body.proId;
    const questionText = req.body.question;
    const userId = req.session.authUser.id;

    const newQuestion = {
        product_id: proId,
        user_id: userId,
        question: questionText,
        created_at: new Date()
    };
    await productService.addQuestion(newQuestion);

    const product = await productService.findDetailById(proId);
    
    const seller = await db('users').where('id', product.seller_id).first();
    const sellerEmail = seller.email;

    const productLink = `http://localhost:3000/products/detail/${proId}`;

    const mailOptions = {
        from: '"Hệ thống Đấu giá" <anhhao.200550@gmail.com>',
        to: sellerEmail,
        subject: `[Sản phẩm #${proId}] Có câu hỏi mới từ người dùng`,
        html: `
            <div style="font-family: Arial, sans-serif; padding: 20px; border: 1px solid #ddd;">
                <h3 style="color: #0d6efd;">Bạn có câu hỏi mới!</h3>
                <p>Sản phẩm: <strong>${product.name}</strong></p>
                <hr>
                <p><strong>Người hỏi:</strong> ${req.session.authUser.full_name}</p>
                <p><strong>Nội dung câu hỏi:</strong></p>
                <p style="background-color: #f8f9fa; padding: 10px; font-style: italic;">
                    "${questionText}"
                </p>
                <hr>
                <p>Vui lòng bấm vào nút dưới đây để xem chi tiết và trả lời:</p>
                <a href="${productLink}" style="background-color: #198754; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; display: inline-block;">
                    Xem chi tiết sản phẩm
                </a>
            </div>
        `
    };

    transporter.sendMail(mailOptions, (err, info) => {
        if (err) {
            console.log('Lỗi gửi mail cho seller:', err);
        } else {
            console.log('Đã gửi mail cho seller:', sellerEmail);
        }
    });

    res.redirect(`/products/detail/${proId}`);
});


router.get('/byCat',  async function(req, res) {
    const catId = req.query.id || 0;
    
    res.render('vwProduct/byCat', {
        catId: catId
    });
});

router.get('/api/byCat', async function(req, res) {
    const catId = req.query.id || 0;
    const page = parseInt(req.query.page) || 1;
    const limit = 6;
    const offset = (page - 1) * limit;

    const total = await productService.countByCat(catId);
    const products = await productService.findPageByCat(catId, limit, offset); 

    const totalPages = Math.ceil(total / limit);

    res.json({
        products: products,
        total: total,
        currentPage: page,
        totalPages: totalPages
    });
});


router.get('/search', function(req, res) {
    const keyword = req.query.q || '';
    res.render('vwProduct/search', { keyword });
});

router.get('/api/search', async function(req, res) {
    try {
        const keyword = req.query.q || '';
        const catId = req.query.catId || 0;
        const sort = req.query.sort || 'time_desc';
        const page = parseInt(req.query.page) || 1;
        const limit = 6;
        const offset = (page - 1) * limit;

        const result = await productService.search(keyword, catId, sort, limit, offset);

        const totalPages = Math.ceil(result.total / limit);

        res.json({
            products: result.products,
            total: result.total,
            currentPage: page,
            totalPages: totalPages
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Lỗi server' });
    }
});

function maskName(name) {
    if (!name) return 'Chưa có';
    const len = name.length;
    return '***' + name.substring(Math.floor(len / 2));
}

router.get('/detail/:id', async function(req, res) {
    const proId = req.params.id || 0;

    const product = await productService.findDetailById(proId);
    if (!product) {
        return res.redirect('/');
    }

    const relatedProducts = await productService.findRelated(product.category_id, proId);

    const questions = await productService.findQuestions(proId);

    const history = await productService.findBidHistory(proId);

    const historyView = history.map(item => {
        return {
            ...item,
            bidder_masked: maskName(item.full_name), // Che tên
            time_str: new Date(item.created_at).toLocaleString('vi-VN')
        }
    });

    product.seller_masked = maskName(product.seller_name);
    product.winner_masked = maskName(product.winner_name);
    
    const images = [
        { src: `/static/imgs/sp/${proId}/main_thumbs.jpg`, active: true },
        { src: `/static/imgs/sp/${proId}/1.jpg`, active: false },
        { src: `/static/imgs/sp/${proId}/2.jpg`, active: false },
        { src: `/static/imgs/sp/${proId}/3.jpg`, active: false }
    ];

    const nextBidPrice = Number(product.current_price) + Number(product.step_price);


    res.render('vwProduct/detail', {
        product: product,
        nextBidPrice: nextBidPrice,
        relatedProducts: relatedProducts,
        questions: questions,
        bidHistory: historyView,
        images: images
    });
});


router.post('/bid', async function(req, res) {
    if (!req.session.isAuthenticated) {
        return res.redirect('/account/signin');
    }

    const bidderId = req.session.authUser.id;
    const productId = req.body.id;
    const bidPrice = Number(req.body.price);
    const product = await productService.findDetailById(productId);

    const minNextPrice = Number(product.current_price) + Number(product.step_price);
    
    if (bidPrice < minNextPrice) {
        return res.render('vwProduct/detail', {
            product: product,
            err_message: `Giá không hợp lệ! Bạn phải ra giá ít nhất là ${new Intl.NumberFormat('vi-VN').format(minNextPrice)}`
        });
    }

    const eligible = await userService.isEligibleToBid(bidderId, product);
    if (!eligible) {
        return res.render('vwProduct/detail', {
            product: product,
            err_message: 'Bạn không đủ điều kiện tham gia đấu giá sản phẩm này (Điểm tín nhiệm thấp hoặc Người bán từ chối người mới).'
        });
    }

    try {
        await productService.placeBid(productId, bidderId, bidPrice);
        
        res.redirect(`/products/detail/${productId}`);
    } catch (err) {
        console.error(err);
        res.render('vwProduct/detail', {
            product: product,
            err_message: 'Có lỗi xảy ra, vui lòng thử lại.'
        });
    }
});






export default router;