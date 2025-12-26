import express from 'express';
import multer from 'multer';
import path from 'path';
import { isAuth } from '../middlewares/auth.mdw.js';
import * as transactionService from '../services/transaction.service.js';
import * as productService from '../services/product.service.js';
import * as userService from '../services/user.service.js';
import * as emailService from '../services/email.service.js';
import db from '../utils/db.js';

const router = express.Router();

// ============================================
// MULTER CONFIGURATION FOR PAYMENT PROOF UPLOAD
// ============================================

const storage = multer.diskStorage({
    destination: './static/imgs/payments/',
    filename: (req, file, cb) => {
        const uniqueName = `payment_${Date.now()}${path.extname(file.originalname)}`;
        cb(null, uniqueName);
    }
});

const upload = multer({
    storage,
    limits: { fileSize: 5 * 1024 * 1024 }, // 5MB limit
    fileFilter: (req, file, cb) => {
        const allowedTypes = /jpeg|jpg|png|pdf/;
        const extname = allowedTypes.test(path.extname(file.originalname).toLowerCase());
        const mimetype = allowedTypes.test(file.mimetype);
        
        if (extname && mimetype) {
            cb(null, true);
        } else {
            cb(new Error('Only images (JPG, PNG) and PDF files are allowed'));
        }
    }
});

// ============================================
// MAIN TRANSACTION VIEW
// ============================================

/**
 * GET /transaction/:productId
 * Main transaction view - shows 4-step progress and forms
 */
router.get('/:productId', isAuth, async function (req, res) {
    const productId = parseInt(req.params.productId);
    const userId = req.session.authUser.id;
    
    // Validation: productId must be a valid number
    if (isNaN(productId) || productId <= 0) {
        req.session.errorMessage = 'ID sản phẩm không hợp lệ';
        return res.redirect('/');
    }
    
    try {
        // Get product details
        const product = await productService.findDetailById(productId);
        
        if (!product) {
            req.session.errorMessage = 'Không tìm thấy sản phẩm';
            return res.redirect('/');
        }
        
        // Check if product has ended
        if (product.status !== 2) {
            return res.redirect(`/products/${productId}`);
        }
        
        // Check if user is buyer or seller
        const isBuyer = product.winner_id === userId;
        const isSeller = product.seller_id === userId;
        
        if (!isBuyer && !isSeller) {
            // Not a participant - redirect to restricted product view
            return res.redirect(`/products/${productId}?ended=true`);
        }
        
        // Get or create transaction
        let transaction = await transactionService.getTransactionByProductId(productId);
        
        if (!transaction) {
            // Auto-create transaction if it doesn't exist
            transaction = await transactionService.createTransaction(
                productId,
                product.winner_id,
                product.seller_id,
                product.current_price
            );
            
            // Fetch full transaction details after creation
            transaction = await transactionService.getTransactionByProductId(productId);
        }
        
        // Get buyer and seller details
        const buyer = await userService.findById(product.winner_id);
        const seller = await userService.findById(product.seller_id);
        
        // Get product main image
        const mainImage = await db('product_images')
            .where({ product_id: productId, is_thumbnail: true })
            .first();
        
        product.main_image = mainImage ? mainImage.image_url : '/static/imgs/default-product.jpg';
        
        // Get ratings if transaction is at step 3 or 4
        let ratings = { buyerRating: null, sellerRating: null };
        if (transaction.status >= 3) {
            ratings = await transactionService.getTransactionRatings(productId);
        }
        
        // Determine chat partner
        const chatPartnerId = isBuyer ? product.seller_id : product.winner_id;
        
        res.render('vwTransaction/complete', {
            product,
            transaction,
            buyer,
            seller,
            isBuyer,
            isSeller,
            chatPartnerId,
            hasRatedBuyer: !!ratings.buyerRating,
            hasRatedSeller: !!ratings.sellerRating,
            buyerRating: ratings.buyerRating,
            sellerRating: ratings.sellerRating,
            bothRated: !!ratings.buyerRating && !!ratings.sellerRating
        });
    } catch (error) {
        console.error('Error loading transaction:', error);
        req.session.errorMessage = 'Lỗi tải giao dịch. Vui lòng thử lại.';
        res.redirect('/');
    }
});

// ============================================
// STEP 1: BUYER SUBMITS PAYMENT
// ============================================

/**
 * POST /transaction/:id/step1
 * Buyer uploads payment proof and shipping address
 */
router.post('/:id/step1', isAuth, upload.single('payment_proof'), async function (req, res) {
    const transactionId = parseInt(req.params.id);
    const userId = req.session.authUser.id;
    const { shipping_address } = req.body;
    
    try {
        const transaction = await transactionService.getTransactionById(transactionId);
        
        if (!transaction) {
            return res.status(404).send('Transaction not found');
        }
        
        // Validation: Only buyer can submit payment
        if (transaction.buyer_id !== userId) {
            return res.status(403).send('Unauthorized - Only buyer can submit payment');
        }
        
        // Validation: Transaction must be at status 0
        if (transaction.status !== 0) {
            return res.status(400).send('Invalid transaction status');
        }
        
        // Validation: Must have uploaded file
        if (!req.file) {
            return res.status(400).send('Payment proof is required');
        }
        
        const paymentProofPath = `/static/imgs/payments/${req.file.filename}`;
        
        // Update transaction
        await transactionService.submitPayment(transactionId, shipping_address, paymentProofPath);
        
        // Reload transaction to get updated data
        const updatedTransaction = await transactionService.getTransactionById(transactionId);
        
        // Send email to seller
        const seller = await userService.findById(transaction.seller_id);
        const product = await productService.findDetailById(transaction.product_id);
        await emailService.sendPaymentReceivedEmail(updatedTransaction, seller, product).catch(err => {
            console.error('Email error:', err);
        });
        
        res.redirect(`/transaction/${transaction.product_id}`);
    } catch (error) {
        console.error('Error submitting payment:', error);
        res.status(500).send('Error processing payment submission');
    }
});

// ============================================
// STEP 2: SELLER CONFIRMS SHIPPING
// ============================================

/**
 * POST /transaction/:id/step2
 * Seller submits shipping tracking number
 */
router.post('/:id/step2', isAuth, async function (req, res) {
    const transactionId = parseInt(req.params.id);
    const userId = req.session.authUser.id;
    const { shipping_tracking } = req.body;
    
    try {
        const transaction = await transactionService.getTransactionById(transactionId);
        
        if (!transaction) {
            return res.status(404).send('Transaction not found');
        }
        
        // Validation: Only seller can submit shipping
        if (transaction.seller_id !== userId) {
            return res.status(403).send('Unauthorized - Only seller can confirm shipping');
        }
        
        // Validation: Transaction must be at status 1 (payment submitted)
        if (transaction.status !== 1) {
            return res.status(400).send('Payment not confirmed yet');
        }
        
        // Update transaction
        await transactionService.submitShipping(transactionId, shipping_tracking);
        
        // Reload transaction to get updated data
        const updatedTransaction = await transactionService.getTransactionById(transactionId);
        
        // Send email to buyer
        const buyer = await userService.findById(transaction.buyer_id);
        const product = await productService.findDetailById(transaction.product_id);
        await emailService.sendShippingConfirmedEmail(updatedTransaction, buyer, product).catch(err => {
            console.error('Email error:', err);
        });
        
        res.redirect(`/transaction/${transaction.product_id}`);
    } catch (error) {
        console.error('Error confirming shipping:', error);
        res.status(500).send('Error processing shipping confirmation');
    }
});

// ============================================
// STEP 3: BUYER CONFIRMS RECEIVED
// ============================================

/**
 * POST /transaction/:id/step3
 * Buyer confirms item has been received
 */
router.post('/:id/step3', isAuth, async function (req, res) {
    const transactionId = parseInt(req.params.id);
    const userId = req.session.authUser.id;
    
    try {
        const transaction = await transactionService.getTransactionById(transactionId);
        
        if (!transaction) {
            return res.status(404).send('Transaction not found');
        }
        
        // Validation: Only buyer can confirm received
        if (transaction.buyer_id !== userId) {
            return res.status(403).send('Unauthorized - Only buyer can confirm receipt');
        }
        
        // Validation: Transaction must be at status 2 (shipped)
        if (transaction.status !== 2) {
            return res.status(400).send('Item not shipped yet');
        }
        
        // Update transaction
        await transactionService.confirmReceived(transactionId);
        
        // Send email to both parties
        const buyer = await userService.findById(transaction.buyer_id);
        const seller = await userService.findById(transaction.seller_id);
        const product = await productService.findDetailById(transaction.product_id);
        await emailService.sendReceivedConfirmedEmail(transaction, buyer, seller, product).catch(err => {
            console.error('Email error:', err);
        });
        
        res.redirect(`/transaction/${transaction.product_id}`);
    } catch (error) {
        console.error('Error confirming receipt:', error);
        res.status(500).send('Error processing receipt confirmation');
    }
});

// ============================================
// STEP 4: MUTUAL RATING
// ============================================

/**
 * POST /transaction/:id/step4
 * Both parties submit ratings for each other
 */
router.post('/:id/step4', isAuth, async function (req, res) {
    const transactionId = parseInt(req.params.id);
    const userId = req.session.authUser.id;
    const { score, comment } = req.body;
    
    try {
        const transaction = await transactionService.getTransactionById(transactionId);
        
        if (!transaction) {
            return res.status(404).send('Transaction not found');
        }
        
        // Validation: Transaction must be at status 3 (received)
        if (transaction.status !== 3 && transaction.status !== 4) {
            return res.status(400).send('Cannot rate yet - item not received');
        }
        
        const isBuyer = transaction.buyer_id === userId;
        const isSeller = transaction.seller_id === userId;
        
        if (!isBuyer && !isSeller) {
            return res.status(403).send('Unauthorized');
        }
        
        const ratedUserId = isBuyer ? transaction.seller_id : transaction.buyer_id;
        
        // Check if already rated (for update scenario)
        const existingRating = await userService.findRating(transaction.product_id, userId);
        
        if (existingRating) {
            // UPDATE existing rating
            await userService.updateRating(existingRating.id, {
                score: parseInt(score),
                comment: comment
            });
        } else {
            // INSERT new rating
            await userService.addRating({
                product_id: transaction.product_id,
                rater_id: userId,
                rated_user_id: ratedUserId,
                score: parseInt(score),
                comment: comment,
                created_at: new Date()
            });
        }
        
        // Check if BOTH have rated → Update transaction status to 4 (Complete)
        const bothRated = await transactionService.bothPartiesRated(transaction.product_id);
        
        if (bothRated && transaction.status === 3) {
            await transactionService.updateTransactionStatus(transactionId, 4);
            
            // Send completion email
            const buyer = await userService.findById(transaction.buyer_id);
            const seller = await userService.findById(transaction.seller_id);
            const product = await productService.findDetailById(transaction.product_id);
            await emailService.sendTransactionCompleteEmail(transaction, buyer, seller, product).catch(err => {
                console.error('Email error:', err);
            });
        }
        
        res.redirect(`/transaction/${transaction.product_id}`);
    } catch (error) {
        console.error('Error submitting rating:', error);
        res.status(500).send('Error processing rating');
    }
});

// ============================================
// CANCEL TRANSACTION
// ============================================

/**
 * POST /transaction/:id/cancel
 * Seller cancels the transaction (auto-rate buyer -1)
 */
router.post('/:id/cancel', isAuth, async function (req, res) {
    const transactionId = parseInt(req.params.id);
    const userId = req.session.authUser.id;
    const { reason } = req.body;
    
    try {
        const transaction = await transactionService.getTransactionById(transactionId);
        
        if (!transaction) {
            return res.status(404).send('Transaction not found');
        }
        
        // Validation: Only seller can cancel
        if (transaction.seller_id !== userId) {
            return res.status(403).send('Unauthorized - Only seller can cancel');
        }
        
        // Validation: Cannot cancel if already received (status 3) or completed (status 4)
        if (transaction.status >= 3) {
            return res.status(400).send('Cannot cancel at this stage');
        }
        
        // Validation: Already canceled
        if (transaction.status === 5) {
            return res.status(400).send('Transaction already canceled');
        }
        
        // Update transaction status to 5 (Canceled)
        await transactionService.cancelTransaction(transactionId, userId, reason || 'Buyer did not respond');
        
        // Auto-rate buyer with -1
        await userService.addRating({
            product_id: transaction.product_id,
            rater_id: userId, // seller
            rated_user_id: transaction.buyer_id,
            score: -1,
            comment: `Giao dịch bị hủy: ${reason || 'Người thắng không thanh toán'}`,
            created_at: new Date()
        });
        
        // Send email to buyer
        const buyer = await userService.findById(transaction.buyer_id);
        const product = await productService.findDetailById(transaction.product_id);
        await emailService.sendTransactionCanceledEmail(transaction, buyer, product, reason).catch(err => {
            console.error('Email error:', err);
        });
        
        res.redirect('/account/posted');
    } catch (error) {
        console.error('Error canceling transaction:', error);
        res.status(500).send('Error canceling transaction');
    }
});

export default router;
