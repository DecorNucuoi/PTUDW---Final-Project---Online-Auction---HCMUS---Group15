import express from 'express';
import multer from 'multer';
import fs from 'fs';
import path from 'path';
import * as productService from '../services/product.service.js';
import * as categoryService from '../services/category.service.js';
import * as userService from '../services/user.service.js';
import nodemailer from 'nodemailer';
import db from '../utils/db.js';
import { isAuth, isSeller } from '../middlewares/auth.mdw.js';
import { transporter } from '../utils/mailer.js';

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './static/imgs/sp/');
    },
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now());
    }
});

const upload = multer({ storage: storage });


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

    const err_message = req.session.err_message;
    const success_message = req.session.success_message;
    
    delete req.session.err_message;
    delete req.session.success_message;

    res.render('vwProduct/detail', {
        product: product,
        nextBidPrice: nextBidPrice,
        relatedProducts: relatedProducts,
        questions: questions,
        bidHistory: historyView,
        images: images,
        err_message: err_message,
        success_message: success_message
    });
});


router.post('/bid', async function(req, res) {
    if (!req.session.isAuthenticated) {
        return res.redirect('/account/signin');
    }

    const bidderId = req.session.authUser.id;
    const productId = req.body.id;
    const bidPrice = Number(req.body.price);

    const isBanned = await productService.isBanned(productId, bidderId);
    if (isBanned) {
        req.session.err_message = 'Người bán đã từ chối quyền đấu giá của bạn đối với sản phẩm này.';
        
        return res.redirect(`/products/detail/${productId}`);
        
    }
    const product = await productService.findDetailById(productId);

    const minNextPrice = Number(product.current_price) + Number(product.step_price);
    
    if (bidPrice < minNextPrice) {
        req.session.err_message = `Giá không hợp lệ! Thấp nhất phải là ${new Intl.NumberFormat('vi-VN').format(minNextPrice)}`;
        return res.redirect(`/products/detail/${productId}`);
    }

    const eligible = await userService.isEligibleToBid(bidderId, product);
    if (!eligible) {
        req.session.err_message = 'Điểm tín nhiệm thấp hoặc Seller chặn người mới.';
        return res.redirect(`/products/detail/${productId}`);
    }

    try {
        await productService.placeBid(productId, bidderId, bidPrice);
        
        req.session.success_message = 'Ra giá thành công!';
        res.redirect(`/products/detail/${productId}`);
    } catch (err) {
       console.error(err);
        req.session.err_message = 'Lỗi hệ thống.';
        res.redirect(`/products/detail/${productId}`);
    }
});

router.get('/upload', isSeller, async function (req, res) {
    const categories = await categoryService.findAll(); 
    
    res.render('vwProduct/upload', {
        categories: categories
    });
});

router.post('/upload', isSeller, upload.array('imgs', 10), async function (req, res) {
    const files = req.files;
    
    if (!files || files.length < 3) {
        return res.render('vwProduct/upload', {
            err_message: 'Vui lòng chọn ít nhất 3 ảnh sản phẩm.'
        });
    }

    const entity = {
        name: req.body.name,
        start_price: req.body.start_price,
        step_price: req.body.step_price,
        buy_now_price: req.body.buy_now_price || null,
        current_price: req.body.start_price,
        category_id: req.body.category_id,
        seller_id: req.session.authUser.id,
        description: req.body.description,
        end_time: req.body.end_time,
        auto_extend: req.body.auto_extend === 'on',
        status: 1,
        created_at: new Date()
    };

    const ret = await productService.add(entity); 
    const productId = ret.id;

    const targetDir = `./static/imgs/sp/${productId}`;
    
    if (!fs.existsSync(targetDir)){
        fs.mkdirSync(targetDir, { recursive: true });
    }

    for (let i = 0; i < files.length; i++) {
        const oldPath = files[i].path;
        let newFileName = '';

        
        if (i === 0) {
            newFileName = 'main_thumbs.jpg';
        } else {
            newFileName = `${i}.jpg`;
        }

        const newPath = path.join(targetDir, newFileName);
        
        fs.renameSync(oldPath, newPath);
    }

    res.redirect(`/products/detail/${productId}`);
});

router.get('/edit/:id', isSeller, async function (req, res) {
    const proId = req.params.id;
    const product = await productService.findDetailById(proId);

    if (product.seller_id !== req.session.authUser.id) {
        return res.redirect('/account/posted');
    }

    res.render('vwProduct/edit_description', {
        product: product
    });
});

router.post('/edit/:id', isSeller, async function (req, res) {
    const proId = req.params.id;
    const newContent = req.body.description;

    const product = await productService.findDetailById(proId);
    if (product.seller_id !== req.session.authUser.id) {
        return res.redirect('/account/posted');
    }

    await productService.appendDescription(proId, newContent);

    res.redirect(`/products/detail/${proId}`);
});
export default router;

router.post('/kick', isAuth, isSeller, async function(req, res) {
    const { proId, bidderId } = req.body;
    
    const product = await productService.findDetailById(proId);
    if (product.seller_id !== req.session.authUser.id) {
        return res.redirect('/');
    }

    await productService.banBidder(proId, bidderId);

    res.redirect(`/products/detail/${proId}`);
});

router.post('/answer', isAuth, async function(req, res) {
    const { proId, questionId, answer } = req.body;
    
    const product = await productService.findDetailById(proId);
    if (product.seller_id !== req.session.authUser.id) {
        return res.redirect('/'); 
    }

    await productService.answerQuestion(questionId, answer);
    
    res.redirect(`/products/detail/${proId}`);
});