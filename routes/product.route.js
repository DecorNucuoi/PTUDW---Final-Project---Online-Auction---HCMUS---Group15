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
import { requireAuth, isBidderOrSeller, isAtLeastSeller, allowGuest } from '../middlewares/role.mdw.js';
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


router.post('/question', async function (req, res) {
    if (!req.session.isAuthenticated) {
        return res.redirect(`/account/signin?retUrl=/products/detail/${req.body.proId}`);
    }

    const proId = req.body.proId;
    const questionText = req.body.question;
    const userId = req.session.authUser.id;

    const product = await productService.findDetailById(proId);

    const newQuestion = {
        product_id: proId,
        user_id: userId,
        question: questionText,
        created_at: new Date()
    };
    await productService.addQuestion(newQuestion);


    const seller = await db('users').where('id', product.seller_id).first();
    const sellerEmail = seller.email;
    const bidder = req.session.authUser;

    const productLink = `http://localhost:3000/products/detail/${proId}`;

    const mailOptions = {
        from: `"HỆ THỐNG ĐẤU GIÁ" <${process.env.EMAIL_USER}>`,
        to: sellerEmail,
        subject: `💬 [Sản phẩm #${proId}] Có câu hỏi mới từ khách hàng về "${product.name}"`,
        html: `
            <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #0d6efd; border-radius: 8px; max-width: 600px;">
                <div style="background: linear-gradient(135deg, #0d6efd 0%, #0dcaf0 100%); color: white; padding: 25px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                    <h2 style="margin: 0;">💬 Câu hỏi mới về sản phẩm!</h2>
                </div>
                
                <p>Xin chào <strong>${seller.full_name || seller.email}</strong>,</p>
                <p>Có khách hàng quan tâm đến sản phẩm của bạn và đã gửi câu hỏi.</p>
                
                <div style="background-color: #cfe2ff; padding: 15px; border-radius: 6px; margin: 15px 0; border-left: 4px solid #0d6efd;">
                    <h3 style="margin: 0 0 10px 0; color: #084298;">📦 ${product.name}</h3>
                    <p style="margin: 5px 0; font-size: 0.9em; color: #6c757d;">ID sản phẩm: #${proId}</p>
                    <p style="margin: 5px 0;"><strong>Giá hiện tại:</strong> ${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(product.current_price)}</p>
                </div>

                <div style="background-color: #f8f9fa; padding: 15px; border-radius: 6px; margin: 15px 0;">
                    <p style="margin: 5px 0;"><strong>👤 Từ:</strong> ${bidder.full_name}</p>
                    <p style="margin: 5px 0;"><strong>📧 Email:</strong> <a href="mailto:${bidder.email}" style="color: #0d6efd;">${bidder.email}</a></p>
                    <p style="margin: 10px 0 5px 0;"><strong>💭 Câu hỏi:</strong></p>
                    <div style="background-color: white; padding: 15px; border-left: 3px solid #0d6efd; font-style: italic; color: #212529;">
                        "${questionText}"
                    </div>
                </div>

                <p><strong>📋 Bước tiếp theo:</strong></p>
                <ul style="line-height: 1.8;">
                    <li>Trả lời câu hỏi nhanh chóng để tăng cơ hội bán hàng</li>
                    <li>Có thể liên hệ trực tiếp qua email: <code>${bidder.email}</code></li>
                    <li>Hoặc trả lời trên hệ thống để mọi người cùng thấy</li>
                </ul>

                <p style="text-align: center; margin-top: 25px;">
                    <a href="${productLink}" style="display: inline-block; background-color: #198754; color: white; padding: 12px 30px; text-decoration: none; border-radius: 6px; font-weight: bold; font-size: 16px;">
                        📝 Trả lời câu hỏi ngay →
                    </a>
                </p>

                <hr style="margin: 30px 0; border: 1px solid #ddd;">
                <p style="font-size: 12px; color: #6c757d; margin: 0;">
                    Email này được gửi tự động từ hệ thống đấu giá. Vui lòng không trả lời email này.<br>
                    Liên hệ khách hàng trực tiếp qua email: <a href="mailto:${bidder.email}">${bidder.email}</a>
                </p>
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

    req.session.successMessage = 'Tin nhắn đã được gửi thành công! Người bán sẽ nhận được thông báo qua email.';
    res.redirect(`/products/detail/${proId}`);
});


router.get('/byCat', async function (req, res) {
    const catId = parseInt(req.query.id) || 0;
    const categories = await categoryService.findAll();

    // Determine what to show based on selected category
    let showCategoryFilter = false;
    let filterCategories = [];
    let selectedCategory = null;
    let filterTitle = '';

    if (catId === 0) {
        // All Categories selected - show all parent categories in filter
        showCategoryFilter = true;
        filterCategories = categories.filter(cat => !cat.parent_id);
        filterTitle = 'Browse by Category';
        selectedCategory = { id: 0, name: 'All Categories' };
    } else if (catId > 0) {
        selectedCategory = categories.find(cat => cat.id === catId);

        if (selectedCategory && !selectedCategory.parent_id) {
            // Parent category selected - show its subcategories in filter
            filterCategories = categories.filter(cat => cat.parent_id === catId);
            showCategoryFilter = filterCategories.length > 0;
            filterTitle = selectedCategory.name + ' Subcategories';
        }
        // Child category selected - don't show category filter (showCategoryFilter remains false)
    }

    res.render('vwProduct/byCat', {
        catId: catId,
        categories: categories,
        selectedCatId: catId,
        showCategoryFilter: showCategoryFilter,
        filterCategories: filterCategories,
        filterTitle: filterTitle,
        selectedCategory: selectedCategory
    });
});

router.get('/api/byCat', async function (req, res) {
    try {
        const catId = req.query.id || 0;
        const page = parseInt(req.query.page) || 1;
        const limit = 6;
        const offset = (page - 1) * limit;
        const sortBy = req.query.sort || 'time_desc';
        const minPrice = req.query.minPrice ? parseInt(req.query.minPrice) : null;
        const maxPrice = req.query.maxPrice ? parseInt(req.query.maxPrice) : null;

        const total = await productService.countByCat(catId, minPrice, maxPrice);
        const products = await productService.findPageByCat(catId, limit, offset, sortBy, minPrice, maxPrice);

        const totalPages = Math.ceil(total / limit);

        res.json({
            products: products,
            total: total,
            currentPage: page,
            totalPages: totalPages
        });
    } catch (err) {
        console.error('Error in /api/byCat:', err);
        res.status(500).json({ error: 'Server error' });
    }
});


router.get('/search', function (req, res) {
    const keyword = req.query.q || '';
    res.render('vwProduct/search', { keyword });
});

router.get('/api/search', async function (req, res) {
    try {
        const keyword = req.query.q || '';
        const catId = req.query.catId || 0;
        const sort = req.query.sort || 'time_desc';
        const page = parseInt(req.query.page) || 1;
        const limit = 6;
        const offset = (page - 1) * limit;

        const result = await productService.search(keyword, catId, sort, limit, offset);

        // Add isNew flag (within 30 minutes)
        const markNew = (products) => products.map(p => {
            const now = new Date();
            const created = new Date(p.created_at);
            const diffMinutes = (now - created) / (1000 * 60);
            return {
                ...p,
                isNew: diffMinutes <= 30
            };
        });

        const totalPages = Math.ceil(result.total / limit);

        res.json({
            products: markNew(result.products),
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
    const trimmed = name.trim();
    if (trimmed.length <= 2) return trimmed;
    
    // Tách thành các từ
    const words = trimmed.split(' ');
    
    if (words.length === 1) {
        // Một từ: giữ chữ cái đầu và cuối, che phần giữa
        const word = words[0];
        if (word.length <= 3) {
            return word[0] + '*'.repeat(word.length - 1);
        }
        return word[0] + '*'.repeat(word.length - 2) + word[word.length - 1];
    } else {
        // Nhiều từ: giữ từ đầu, che các từ giữa, giữ ký tự đầu từ cuối
        const maskedWords = words.map((word, index) => {
            if (index === 0) return word; // Giữ nguyên từ đầu
            if (index === words.length - 1) {
                // Từ cuối: giữ chữ cái đầu
                return word[0] + '*'.repeat(Math.max(0, word.length - 1));
            }
            // Các từ giữa: che hết
            return '*'.repeat(word.length);
        });
        return maskedWords.join(' ');
    }
}

router.get('/detail/:id', async function (req, res) {
    const proId = req.params.id || 0;

    const product = await productService.findDetailById(proId);
    if (!product) {
        return res.redirect('/');
    }

    const relatedProducts = await productService.findRelated(product.category_id, proId);

    // Nếu là guest → không hiển thị Q&A và giới hạn bid history
    const isGuest = !req.session.isAuthenticated;
    const questions = isGuest ? [] : await productService.findQuestions(proId);

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

    const dbImages = await productService.findImages(proId);
    let images = [];
    if (dbImages && dbImages.length > 0) {
        images = dbImages.map(img => ({
            src: img.image_url,
            active: img.is_thumbnail
        }));
    }

    const nextBidPrice = Number(product.current_price) + Number(product.step_price);

    // Check if auction has expired
    const now = new Date();
    const endTime = new Date(product.end_time);
    const isExpired = now > endTime || product.status !== 1;

    const err_message = req.session.err_message;
    const success_message = req.session.success_message;

    delete req.session.err_message;
    delete req.session.success_message;

    // Get banned bidders list if user is the seller
    const isSeller = req.session.authUser && product.seller_id === req.session.authUser.id;
    const bannedBidders = isSeller ? await productService.getBannedBidders(proId) : [];

    res.render('vwProduct/detail', {
        product: product,
        nextBidPrice: nextBidPrice,
        relatedProducts: relatedProducts,
        questions: questions,
        bidHistory: historyView,
        images: images,
        err_message: err_message,
        success_message: success_message,
        isGuest: isGuest,
        isExpired: isExpired,
        canBid: req.session.authUser?.role === 0 || req.session.authUser?.role === 1,
        isSeller: isSeller,
        bannedBidders: bannedBidders
    });
});


router.post('/bid', async function (req, res) {
    if (!req.session.isAuthenticated) {
        return res.redirect('/account/signin');
    }

    // Admin không được phép đấu giá
    if (req.session.authUser.role === 2) {
        req.session.err_message = 'Admin không được phép tham gia đấu giá!';
        return res.redirect(`/products/detail/${req.body.id}`);
    }

    // Chỉ Bidder (role=0) và Seller (role=1) mới được bid
    if (req.session.authUser.role !== 0 && req.session.authUser.role !== 1) {
        req.session.err_message = 'Bạn không có quyền tham gia đấu giá!';
        return res.redirect(`/products/detail/${req.body.id}`);
    }

    const bidderId = req.session.authUser.id;
    const productId = req.body.id;
    const bidPrice = Number(req.body.price);

    const product = await productService.findDetailById(productId);

    // Check 1: Seller không được bid vào sản phẩm của chính mình
    if (product.seller_id === bidderId) {
        req.session.err_message = 'Bạn không thể đấu giá sản phẩm của chính mình!';
        return res.redirect(`/products/detail/${productId}`);
    }

    // Check 2: Kiểm tra đấu giá đã kết thúc chưa
    const now = new Date();
    const endTime = new Date(product.end_time);
    if (now > endTime) {
        req.session.err_message = 'Đấu giá đã kết thúc! Không thể ra giá thêm.';
        return res.redirect(`/products/detail/${productId}`);
    }

    // Check 3: Kiểm tra sản phẩm còn active không
    if (product.status !== 1) {
        req.session.err_message = 'Sản phẩm này không còn khả dụng để đấu giá.';
        return res.redirect(`/products/detail/${productId}`);
    }

    const isBanned = await productService.isBanned(productId, bidderId);
    if (isBanned) {
        req.session.err_message = 'Người bán đã từ chối quyền đấu giá của bạn đối với sản phẩm này.';
        return res.redirect(`/products/detail/${productId}`);
    }

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
        const oldWinnerId = product.winner_id;

        await productService.placeBid(productId, bidderId, bidPrice);

        // Email: Success to current bidder
        const bidderEmail = req.session.authUser.email;
        const bidderName = req.session.authUser.full_name;
        const mailOptionsSuccess = {
            from: `"HỆ THỐNG ĐẤU GIÁ" <${process.env.EMAIL_USER}>`,
            to: bidderEmail,
            subject: `✅ [Thành công] Bạn đang dẫn đầu đấu giá "${product.name}"`,
            html: `
                <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #28a745; border-radius: 8px; max-width: 600px;">
                    <div style="background: linear-gradient(135deg, #28a745 0%, #20c997 100%); color: white; padding: 25px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                        <h2 style="margin: 0;">✅ Đặt giá thành công!</h2>
                    </div>
                    
                    <p>Xin chào <strong>${bidderName}</strong>,</p>
                    <p>Bạn đã đặt giá thành công và hiện đang <strong style="color: #28a745;">dẫn đầu</strong> cuộc đấu giá!</p>
                    
                    <div style="background-color: #d4edda; padding: 15px; border-radius: 6px; margin: 15px 0; border-left: 4px solid #28a745;">
                        <h3 style="margin: 0 0 10px 0; color: #155724;">${product.name}</h3>
                        <p style="margin: 5px 0;"><strong>Giá của bạn:</strong> 
                            <span style="font-size: 1.4em; color: #28a745; font-weight: bold;">
                                ${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(bidPrice)}
                            </span>
                        </p>
                        <p style="margin: 5px 0; font-size: 0.9em; color: #6c757d;">ID sản phẩm: #${productId}</p>
                    </div>

                    <div style="background-color: #fff3cd; padding: 12px; border-left: 4px solid #ffc107; margin: 15px 0;">
                        <p style="margin: 0; color: #856404;">
                            <strong>⏰ Lưu ý:</strong> Bạn có thể bị vượt giá bất cứ lúc nào. Chúng tôi sẽ gửi email thông báo nếu điều này xảy ra.
                        </p>
                    </div>

                    <p style="text-align: center; margin-top: 25px;">
                        <a href="http://localhost:3000/products/detail/${productId}" style="display: inline-block; background-color: #0d6efd; color: white; padding: 12px 30px; text-decoration: none; border-radius: 6px; font-weight: bold;">
                            🔍 Xem sản phẩm →
                        </a>
                    </p>

                    <hr style="margin: 30px 0; border: 1px solid #ddd;">
                    <p style="font-size: 12px; color: #6c757d; margin: 0;">
                        Email này được gửi tự động từ hệ thống đấu giá. Vui lòng không trả lời email này.
                    </p>
                </div>
            `
        };
        transporter.sendMail(mailOptionsSuccess, (err) => { if (err) console.error('Mail bid success error:', err); });

        // Email: Outbid to old winner
        if (oldWinnerId && oldWinnerId !== bidderId) {
            const oldWinner = await userService.findById(oldWinnerId);
            if (oldWinner) {
                const seller = await userService.findById(product.seller_id);
                const mailOptionsOutbid = {
                    from: `"HỆ THỐNG ĐẤU GIÁ" <${process.env.EMAIL_USER}>`,
                    to: oldWinner.email,
                    subject: `⚠️ [Vượt giá] Bạn đã bị vượt giá cho "${product.name}"`,
                    html: `
                        <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #ffc107; border-radius: 8px; max-width: 600px;">
                            <div style="background: linear-gradient(135deg, #ffc107 0%, #fd7e14 100%); color: #000; padding: 25px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                                <h2 style="margin: 0;">⚠️ Bạn đã bị vượt giá!</h2>
                            </div>
                            
                            <p>Chào <strong>${oldWinner.full_name}</strong>,</p>
                            <p>Có người vừa đặt giá cao hơn bạn cho sản phẩm bạn đang theo dõi.</p>
                            
                            <div style="background-color: #fff3cd; padding: 15px; border-radius: 6px; margin: 15px 0; border-left: 4px solid #ffc107;">
                                <h3 style="margin: 0 0 10px 0; color: #856404;">${product.name}</h3>
                                <p style="margin: 5px 0;"><strong>⬆️ Giá mới (cao hơn):</strong> 
                                    <span style="font-size: 1.4em; color: #dc3545; font-weight: bold;">
                                        ${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(bidPrice)}
                                    </span>
                                </p>
                                <p style="margin: 5px 0;"><strong>⏰ Thời gian còn lại:</strong> Kiểm tra trên trang sản phẩm</p>
                                <p style="margin: 5px 0; font-size: 0.9em; color: #6c757d;">ID sản phẩm: #${productId}</p>
                            </div>

                            <div style="background-color: #f8f9fa; padding: 12px; border-radius: 6px; margin: 15px 0;">
                                <p style="margin: 5px 0;"><strong>👤 Người bán:</strong> ${seller ? seller.full_name : 'N/A'}</p>
                                <p style="margin: 5px 0;"><strong>📧 Email:</strong> ${seller ? seller.email : 'N/A'}</p>
                            </div>

                            <p style="background-color: #d1ecf1; padding: 12px; border-left: 4px solid #0dcaf0; margin: 15px 0; color: #055160;">
                                <strong>💡 Hành động nhanh!</strong> Nếu bạn vẫn muốn sản phẩm này, hãy đặt giá cao hơn ngay bây giờ!
                            </p>

                            <p style="text-align: center; margin-top: 25px;">
                                <a href="http://localhost:3000/products/detail/${productId}" style="display: inline-block; background-color: #dc3545; color: white; padding: 14px 35px; text-decoration: none; border-radius: 6px; font-weight: bold; font-size: 16px;">
                                    🔥 Đặt giá lại ngay! →
                                </a>
                            </p>

                            <hr style="margin: 30px 0; border: 1px solid #ddd;">
                            <p style="font-size: 12px; color: #6c757d; margin: 0;">
                                Email này được gửi tự động từ hệ thống đấu giá. Vui lòng không trả lời email này.
                            </p>
                        </div>
                    `
                };
                transporter.sendMail(mailOptionsOutbid, (err) => { if (err) console.error('Mail outbid error:', err); });
            }
        }

        req.session.success_message = 'Ra giá thành công!';
        res.redirect(`/products/detail/${productId}`);
    } catch (err) {
        console.error(err);
        req.session.err_message = 'Lỗi hệ thống.';
        res.redirect(`/products/detail/${productId}`);
    }
});

router.get('/upload', async function (req, res) {
    // Chỉ Seller (role=1) mới được upload
    if (!req.session.isAuthenticated) {
        return res.redirect('/account/signin');
    }
    
    if (req.session.authUser.role !== 1) {
        req.session.errorMessage = 'Chỉ Seller mới được đăng sản phẩm!';
        return res.redirect('/');
    }

    const categories = await categoryService.findAll();

    res.render('vwProduct/upload', {
        categories: categories
    });
});

router.post('/upload', upload.array('imgs', 10), async function (req, res) {
    try {
        // Chỉ Seller (role=1) mới được upload
        if (!req.session.isAuthenticated) {
            return res.redirect('/account/signin');
        }
        
        if (req.session.authUser.role !== 1) {
            req.session.errorMessage = 'Chỉ Seller mới được đăng sản phẩm!';
            return res.redirect('/');
        }

        const files = req.files;

        if (!files || files.length < 4) {
            const categories = await categoryService.findAll();
            return res.render('vwProduct/upload', {
                categories: categories,
                err_message: 'Vui lòng chọn tối thiểu 4 ảnh sản phẩm!'
            });
        }

        if (files.length > 10) {
            const categories = await categoryService.findAll();
            return res.render('vwProduct/upload', {
                categories: categories,
                err_message: 'Tối đa 10 ảnh sản phẩm!'
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
            allow_newbie: req.body.allow_newbie === 'on',
            status: 1,
            created_at: new Date()
        };

        console.log('Creating product with entity:', entity);

        const ret = await productService.add(entity);
        const productId = ret.id || ret;
        
        console.log('Product created with ID:', productId);

        const targetDir = path.join(process.cwd(), 'static', 'imgs', 'sp', String(productId));
        
        console.log('Target directory:', targetDir);

        // Tạo thư mục với recursive: true
        if (!fs.existsSync(targetDir)) {
            fs.mkdirSync(targetDir, { recursive: true });
            console.log('Created directory:', targetDir);
        }

        // Verify thư mục đã tồn tại
        if (!fs.existsSync(targetDir)) {
            throw new Error('Failed to create target directory: ' + targetDir);
        }

        // Move files
        for (let i = 0; i < files.length; i++) {
            const oldPath = files[i].path;
            let newFileName = '';

            if (i === 0) {
                newFileName = 'main_thumbs.jpg';
            } else {
                newFileName = `${i}.jpg`;
            }

            const newPath = path.join(targetDir, newFileName);
            
            console.log(`Moving file ${i}: ${oldPath} -> ${newPath}`);

            // Check if source file exists
            if (!fs.existsSync(oldPath)) {
                console.error('Source file does not exist:', oldPath);
                continue;
            }

            // Use fs.copyFileSync + fs.unlinkSync thay vì renameSync để tránh lỗi cross-device
            try {
                fs.copyFileSync(oldPath, newPath);
                fs.unlinkSync(oldPath);
                console.log(`Successfully moved file ${i}`);
            } catch (err) {
                console.error(`Error moving file ${i}:`, err);
                // Fallback: try rename
                fs.renameSync(oldPath, newPath);
            }
        }

        // Lưu thông tin ảnh vào database
        const imageInserts = [];
        for (let i = 0; i < files.length; i++) {
            const imageUrl = `/static/imgs/sp/${productId}/${i === 0 ? 'main_thumbs.jpg' : i + '.jpg'}`;
            imageInserts.push({
                product_id: productId,
                image_url: imageUrl,
                is_thumbnail: i === 0
            });
        }
        
        if (imageInserts.length > 0) {
            await db('product_images').insert(imageInserts);
            console.log(`Inserted ${imageInserts.length} images into database`);
        }

        req.session.successMessage = 'Đăng sản phẩm thành công!';
        res.redirect(`/products/detail/${productId}`);
    } catch (err) {
        console.error('Upload error:', err);
        const categories = await categoryService.findAll();
        return res.render('vwProduct/upload', {
            categories: categories,
            err_message: 'Có lỗi xảy ra: ' + err.message
        });
    }
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

router.post('/kick', isAuth, isSeller, async function (req, res) {
    const { proId, bidderId } = req.body;

    const product = await productService.findDetailById(proId);
    if (product.seller_id !== req.session.authUser.id) {
        return res.redirect('/');
    }

    // Check if already banned
    const alreadyBanned = await productService.isBanned(proId, bidderId);
    if (alreadyBanned) {
        req.session.err_message = 'Người dùng này đã bị cấm trước đó.';
        return res.redirect(`/products/detail/${proId}`);
    }

    await productService.banBidder(proId, bidderId);

    const bidder = await userService.findById(bidderId);
    const sellerInfo = await userService.findById(req.session.authUser.id);
    if (bidder) {
        const mailOptions = {
            from: `"HỆ THỐNG ĐẤU GIÁ" <${process.env.EMAIL_USER}>`,
            to: bidder.email,
            subject: `⛔ [Từ chối] Bạn đã bị từ chối đấu giá sản phẩm #${proId}`,
            html: `
                <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #dc3545; border-radius: 8px; max-width: 600px;">
                    <div style="background: linear-gradient(135deg, #dc3545 0%, #d63384 100%); color: white; padding: 25px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                        <h2 style="margin: 0;">⛔ Thông báo từ chối đấu giá</h2>
                    </div>
                    
                    <p>Chào <strong>${bidder.full_name}</strong>,</p>
                    <p>Người bán đã <strong style="color: #dc3545;">từ chối quyền tham gia đấu giá</strong> của bạn đối với sản phẩm:</p>
                    
                    <div style="background-color: #f8d7da; padding: 15px; border-radius: 6px; margin: 15px 0; border-left: 4px solid #dc3545;">
                        <h3 style="margin: 0 0 10px 0; color: #721c24;">${product.name}</h3>
                        <p style="margin: 5px 0; font-size: 0.9em; color: #6c757d;">ID sản phẩm: #${proId}</p>
                    </div>

                    <div style="background-color: #f8f9fa; padding: 15px; border-radius: 6px; margin: 15px 0;">
                        <p style="margin: 5px 0;"><strong>👤 Người bán:</strong> ${sellerInfo.full_name}</p>
                        <p style="margin: 5px 0;"><strong>📧 Email liên hệ:</strong> <a href="mailto:${sellerInfo.email}" style="color: #0d6efd;">${sellerInfo.email}</a></p>
                    </div>

                    <div style="background-color: #fff3cd; padding: 12px; border-left: 4px solid #ffc107; margin: 15px 0;">
                        <p style="margin: 0; color: #856404;">
                            <strong>📝 Lý do:</strong> Quyền hạn của người bán (Seller's discretion)
                        </p>
                    </div>

                    <p style="color: #6c757d; font-size: 0.9em;">⚠️ Mọi lượt đấu giá trước đó của bạn cho sản phẩm này đã bị vô hiệu hóa.</p>

                    <p>Nếu bạn cho rằng đây là sự nhầm lẫn, vui lòng liên hệ trực tiếp người bán qua email ở trên.</p>

                    <p style="text-align: center; margin-top: 25px;">
                        <a href="http://localhost:3000" style="display: inline-block; background-color: #0d6efd; color: white; padding: 12px 30px; text-decoration: none; border-radius: 6px; font-weight: bold;">
                            🔍 Xem sản phẩm khác →
                        </a>
                    </p>

                    <hr style="margin: 30px 0; border: 1px solid #ddd;">
                    <p style="font-size: 12px; color: #6c757d; margin: 0;">
                        Email này được gửi tự động từ hệ thống đấu giá. Liên hệ người bán: <a href="mailto:${sellerInfo.email}">${sellerInfo.email}</a>
                    </p>
                </div>
            `
        };
        transporter.sendMail(mailOptions, (err) => {
            if (err) console.error('Lỗi gửi mail ban:', err);
        });
    }

    req.session.success_message = `Đã cấm người dùng ${bidder ? bidder.full_name : bidderId} đấu giá sản phẩm này và gửi email thông báo.`;
    res.redirect(`/products/detail/${proId}`);
});

router.post('/unban', isAuth, isSeller, async function (req, res) {
    const { proId, userId } = req.body;

    const product = await productService.findDetailById(proId);
    if (product.seller_id !== req.session.authUser.id) {
        return res.redirect('/');
    }

    await productService.unbanBidder(proId, userId);

    const user = await userService.findById(userId);
    const sellerInfo = await userService.findById(req.session.authUser.id);
    if (user) {
        const mailOptions = {
            from: `"HỆ THỐNG ĐẤU GIÁ" <${process.env.EMAIL_USER}>`,
            to: user.email,
            subject: `✅ [Thông báo] Bạn đã được phép đấu giá lại sản phẩm #${proId}`,
            html: `
                <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #28a745; border-radius: 8px; max-width: 600px;">
                    <div style="background: linear-gradient(135deg, #28a745 0%, #20c997 100%); color: white; padding: 25px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                        <h2 style="margin: 0;">✅ Thông báo gỡ bỏ hạn chế</h2>
                    </div>
                    
                    <p>Chào <strong>${user.full_name}</strong>,</p>
                    <p>Người bán đã <strong style="color: #28a745;">gỡ bỏ hạn chế đấu giá</strong> của bạn đối với sản phẩm:</p>
                    
                    <div style="background-color: #d4edda; padding: 15px; border-radius: 6px; margin: 15px 0; border-left: 4px solid #28a745;">
                        <h3 style="margin: 0 0 10px 0; color: #155724;">${product.name}</h3>
                        <p style="margin: 5px 0;"><strong>Giá hiện tại:</strong> ${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(product.current_price)}</p>
                        <p style="margin: 5px 0; font-size: 0.9em; color: #6c757d;">ID sản phẩm: #${proId}</p>
                    </div>

                    <div style="background-color: #f8f9fa; padding: 15px; border-radius: 6px; margin: 15px 0;">
                        <p style="margin: 5px 0;"><strong>👤 Người bán:</strong> ${sellerInfo.full_name}</p>
                        <p style="margin: 5px 0;"><strong>📧 Email:</strong> <a href="mailto:${sellerInfo.email}" style="color: #0d6efd;">${sellerInfo.email}</a></p>
                    </div>

                    <p style="background-color: #d1ecf1; padding: 12px; border-left: 4px solid #0dcaf0; margin: 15px 0; color: #055160;">
                        🎉 <strong>Tin tốt lành!</strong> Bạn có thể tham gia đấu giá sản phẩm này trở lại!
                    </p>

                    <p style="text-align: center; margin-top: 25px;">
                        <a href="http://localhost:3000/products/detail/${proId}" style="display: inline-block; background-color: #28a745; color: white; padding: 14px 35px; text-decoration: none; border-radius: 6px; font-weight: bold; font-size: 16px;">
                            🔥 Xem sản phẩm ngay →
                        </a>
                    </p>

                    <hr style="margin: 30px 0; border: 1px solid #ddd;">
                    <p style="font-size: 12px; color: #6c757d; margin: 0;">
                        Email này được gửi tự động từ hệ thống đấu giá. Liên hệ người bán: <a href="mailto:${sellerInfo.email}">${sellerInfo.email}</a>
                    </p>
                </div>
            `
        };
        transporter.sendMail(mailOptions, (err) => {
            if (err) console.error('Lỗi gửi mail unban:', err);
        });
    }

    req.session.success_message = `Đã gỡ bỏ lệnh cấm cho người dùng ${user ? user.full_name : userId} và gửi email thông báo.`;
    res.redirect(`/products/detail/${proId}`);
});

router.post('/ban-user', isAuth, isSeller, async function (req, res) {
    const { proId, userEmail } = req.body;

    const product = await productService.findDetailById(proId);
    if (product.seller_id !== req.session.authUser.id) {
        return res.redirect('/');
    }

    // Find user by email
    const user = await db('users').where('email', userEmail).first();
    if (!user) {
        req.session.err_message = 'Không tìm thấy người dùng với email này.';
        return res.redirect(`/products/detail/${proId}`);
    }

    // Check if already banned
    const alreadyBanned = await productService.isBanned(proId, user.id);
    if (alreadyBanned) {
        req.session.err_message = 'Người dùng này đã bị cấm trước đó.';
        return res.redirect(`/products/detail/${proId}`);
    }

    // Check if user is seller themselves
    if (user.id === req.session.authUser.id) {
        req.session.err_message = 'Bạn không thể tự cấm chính mình.';
        return res.redirect(`/products/detail/${proId}`);
    }

    await productService.banBidder(proId, user.id);

    const sellerInfo = await userService.findById(req.session.authUser.id);
    const mailOptions = {
        from: `"HỆ THỐNG ĐẤU GIÁ" <${process.env.EMAIL_USER}>`,
        to: user.email,
        subject: `⛔ [Từ chối] Bạn đã bị cấm đấu giá sản phẩm #${proId}`,
        html: `
            <div style="font-family: Arial, sans-serif; padding: 20px; border: 2px solid #dc3545; border-radius: 8px; max-width: 600px;">
                <div style="background: linear-gradient(135deg, #dc3545 0%, #d63384 100%); color: white; padding: 25px; text-align: center; border-radius: 6px 6px 0 0; margin: -20px -20px 20px -20px;">
                    <h2 style="margin: 0;">⛔ Thông báo cấm đấu giá</h2>
                </div>
                
                <p>Chào <strong>${user.full_name}</strong>,</p>
                <p>Người bán đã <strong style="color: #dc3545;">cấm bạn tham gia đấu giá</strong> sản phẩm:</p>
                
                <div style="background-color: #f8d7da; padding: 15px; border-radius: 6px; margin: 15px 0; border-left: 4px solid #dc3545;">
                    <h3 style="margin: 0 0 10px 0; color: #721c24;">${product.name}</h3>
                    <p style="margin: 5px 0; font-size: 0.9em; color: #6c757d;">ID sản phẩm: #${proId}</p>
                </div>

                <div style="background-color: #f8f9fa; padding: 15px; border-radius: 6px; margin: 15px 0;">
                    <p style="margin: 5px 0;"><strong>👤 Người bán:</strong> ${sellerInfo.full_name}</p>
                    <p style="margin: 5px 0;"><strong>📧 Email liên hệ:</strong> <a href="mailto:${sellerInfo.email}" style="color: #0d6efd;">${sellerInfo.email}</a></p>
                </div>

                <div style="background-color: #fff3cd; padding: 12px; border-left: 4px solid #ffc107; margin: 15px 0;">
                    <p style="margin: 0; color: #856404;">
                        <strong>📝 Lý do:</strong> Quyết định của người bán
                    </p>
                </div>

                <p style="color: #6c757d; font-size: 0.9em;">⚠️ Bạn sẽ không thể đặt giá cho sản phẩm này.</p>

                <p>Nếu bạn có thắc mắc, vui lòng liên hệ người bán qua email ở trên.</p>

                <p style="text-align: center; margin-top: 25px;">
                    <a href="http://localhost:3000" style="display: inline-block; background-color: #0d6efd; color: white; padding: 12px 30px; text-decoration: none; border-radius: 6px; font-weight: bold;">
                        🔍 Khám phá sản phẩm khác →
                    </a>
                </p>

                <hr style="margin: 30px 0; border: 1px solid #ddd;">
                <p style="font-size: 12px; color: #6c757d; margin: 0;">
                    Email này được gửi tự động từ hệ thống đấu giá. Liên hệ người bán: <a href="mailto:${sellerInfo.email}">${sellerInfo.email}</a>
                </p>
            </div>
        `
    };
    transporter.sendMail(mailOptions, (err) => {
        if (err) console.error('Lỗi gửi mail ban:', err);
    });

    req.session.success_message = `Đã cấm người dùng ${user.full_name} (${userEmail}) đấu giá sản phẩm này và gửi email thông báo.`;
    res.redirect(`/products/detail/${proId}`);
});

router.post('/answer', isAuth, async function (req, res) {
    const { proId, questionId, answer } = req.body;

    const product = await productService.findDetailById(proId);
    if (product.seller_id !== req.session.authUser.id) {
        return res.redirect('/');
    }

    await productService.answerQuestion(questionId, answer);

    // Get question details to find who asked and send notification email
    const question = await db('questions')
        .where('id', questionId)
        .first();

    if (question && question.user_id) {
        const bidder = await db('users').where('id', question.user_id).first();
        const bidderEmail = bidder.email;
        const productLink = `http://localhost:3000/products/detail/${proId}`;

        const mailOptions = {
            from: `"HỆ THỐNG ĐẤU GIÁ" <${process.env.EMAIL_USER}>`,
            to: bidderEmail,
            subject: `[Sản phẩm #${proId}] Người bán đã trả lời câu hỏi của bạn`,
            html: `
                <div style="font-family: Arial, sans-serif; padding: 20px; border: 1px solid #ddd;">
                    <h3 style="color: #198754;">Người bán đã trả lời câu hỏi của bạn!</h3>
                    <p>Sản phẩm: <strong>${product.name}</strong></p>
                    <hr>
                    <p><strong>Câu hỏi của bạn:</strong></p>
                    <p style="background-color: #f8f9fa; padding: 10px; font-style: italic;">
                        "${question.question}"
                    </p>
                    <p><strong>Câu trả lời từ người bán:</strong></p>
                    <p style="background-color: #d1e7dd; padding: 10px; border-left: 4px solid #198754;">
                        "${answer}"
                    </p>
                    <hr>
                    <p>Bấm vào nút dưới đây để xem chi tiết sản phẩm:</p>
                    <a href="${productLink}" style="background-color: #0d6efd; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; display: inline-block;">
                        Xem chi tiết sản phẩm
                    </a>
                </div>
            `
        };

        transporter.sendMail(mailOptions, (err, info) => {
            if (err) {
                console.log('Lỗi gửi mail cho bidder:', err);
            } else {
                console.log('Đã gửi mail cho bidder:', bidderEmail);
            }
        });
    }

    req.session.successMessage = 'Câu trả lời đã được gửi thành công! Người mua sẽ nhận được thông báo qua email.';
    res.redirect(`/products/detail/${proId}`);
});