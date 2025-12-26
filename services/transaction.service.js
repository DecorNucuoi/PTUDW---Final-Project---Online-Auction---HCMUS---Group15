import db from '../utils/db.js';

/**
 * Transaction Service
 * Handles all business logic for post-auction transaction flow (4-step process)
 */

// ============================================
// CORE CRUD OPERATIONS
// ============================================

/**
 * Create a new transaction after auction ends
 * @param {number} productId - Product ID (1-to-1 relationship)
 * @param {number} buyerId - Winner user ID
 * @param {number} sellerId - Seller user ID
 * @param {number} finalPrice - Final auction price
 * @returns {Promise<Object>} Created transaction
 */
export async function createTransaction(productId, buyerId, sellerId, finalPrice) {
    const [transaction] = await db('transactions')
        .insert({
            product_id: productId,
            buyer_id: buyerId,
            seller_id: sellerId,
            final_price: finalPrice,
            status: 0, // 0 = Waiting for payment
            created_at: new Date(),
            updated_at: new Date()
        })
        .returning('*');
    
    return transaction;
}

/**
 * Get transaction by product ID
 * @param {number} productId
 * @returns {Promise<Object|null>} Transaction or null if not found
 */
export async function getTransactionByProductId(productId) {
    const transaction = await db('transactions')
        .where('product_id', productId)
        .first();
    
    return transaction || null;
}

/**
 * Get transaction by transaction ID
 * @param {number} id - Transaction ID
 * @returns {Promise<Object|null>} Transaction with buyer/seller details
 */
export async function getTransactionById(id) {
    const transaction = await db('transactions')
        .leftJoin('users as buyer', 'transactions.buyer_id', 'buyer.id')
        .leftJoin('users as seller', 'transactions.seller_id', 'seller.id')
        .leftJoin('products', 'transactions.product_id', 'products.id')
        .where('transactions.id', id)
        .select(
            'transactions.*',
            'buyer.id as buyer_id',
            'buyer.full_name as buyer_name',
            'buyer.email as buyer_email',
            'seller.id as seller_id',
            'seller.full_name as seller_name',
            'seller.email as seller_email',
            'products.name as product_name',
            'products.seller_id as product_seller_id',
            'products.winner_id as product_winner_id'
        )
        .first();
    
    return transaction || null;
}

/**
 * Update transaction status
 * @param {number} id - Transaction ID
 * @param {number} status - New status (0-5)
 * @returns {Promise<number>} Number of rows updated
 */
export async function updateTransactionStatus(id, status) {
    return await db('transactions')
        .where('id', id)
        .update({
            status,
            updated_at: new Date()
        });
}

// ============================================
// STEP HANDLERS
// ============================================

/**
 * Step 1: Buyer submits payment proof and shipping address
 * @param {number} transactionId
 * @param {string} shippingAddress
 * @param {string} paymentProofPath - File path to uploaded payment proof
 * @returns {Promise<number>}
 */
export async function submitPayment(transactionId, shippingAddress, paymentProofPath) {
    return await db('transactions')
        .where('id', transactionId)
        .update({
            shipping_address: shippingAddress,
            payment_proof: paymentProofPath,
            status: 1, // 1 = Payment submitted
            updated_at: new Date()
        });
}

/**
 * Step 2: Seller confirms shipping and provides tracking number
 * @param {number} transactionId
 * @param {string} shippingTracking - Tracking number from shipping company
 * @returns {Promise<number>}
 */
export async function submitShipping(transactionId, shippingTracking) {
    return await db('transactions')
        .where('id', transactionId)
        .update({
            shipping_tracking: shippingTracking,
            status: 2, // 2 = Shipped
            updated_at: new Date()
        });
}

/**
 * Step 3: Buyer confirms item received
 * @param {number} transactionId
 * @returns {Promise<number>}
 */
export async function confirmReceived(transactionId) {
    return await db('transactions')
        .where('id', transactionId)
        .update({
            status: 3, // 3 = Received (waiting for ratings)
            updated_at: new Date()
        });
}

/**
 * Cancel transaction (seller only)
 * @param {number} transactionId
 * @param {number} canceledBy - User ID who canceled
 * @param {string} reason - Cancellation reason
 * @returns {Promise<number>}
 */
export async function cancelTransaction(transactionId, canceledBy, reason) {
    return await db('transactions')
        .where('id', transactionId)
        .update({
            status: 5, // 5 = Canceled
            updated_at: new Date()
        });
}

// ============================================
// QUERIES
// ============================================

/**
 * Get all transactions where user is the buyer
 * @param {number} userId
 * @returns {Promise<Array>} List of transactions
 */
export async function getBuyerTransactions(userId) {
    return await db('transactions')
        .leftJoin('products', 'transactions.product_id', 'products.id')
        .leftJoin('users as seller', 'transactions.seller_id', 'seller.id')
        .where('transactions.buyer_id', userId)
        .select(
            'transactions.*',
            'products.name as product_name',
            'seller.full_name as seller_name'
        )
        .orderBy('transactions.created_at', 'desc');
}

/**
 * Get all transactions where user is the seller
 * @param {number} userId
 * @returns {Promise<Array>} List of transactions
 */
export async function getSellerTransactions(userId) {
    return await db('transactions')
        .leftJoin('products', 'transactions.product_id', 'products.id')
        .leftJoin('users as buyer', 'transactions.buyer_id', 'buyer.id')
        .where('transactions.seller_id', userId)
        .select(
            'transactions.*',
            'products.name as product_name',
            'buyer.full_name as buyer_name'
        )
        .orderBy('transactions.created_at', 'desc');
}

// ============================================
// VALIDATION
// ============================================

/**
 * Check if user can access this transaction (buyer or seller only)
 * @param {number} transactionId
 * @param {number} userId
 * @returns {Promise<boolean>}
 */
export async function canAccessTransaction(transactionId, userId) {
    const transaction = await db('transactions')
        .where('id', transactionId)
        .whereRaw('(buyer_id = ? OR seller_id = ?)', [userId, userId])
        .first();
    
    return !!transaction;
}

/**
 * Check if user can cancel this transaction
 * Rules: Only seller can cancel, and only before item is received (status < 3)
 * @param {number} transactionId
 * @param {number} userId
 * @returns {Promise<boolean>}
 */
export async function canCancelTransaction(transactionId, userId) {
    const transaction = await db('transactions')
        .where('id', transactionId)
        .where('seller_id', userId) // Only seller can cancel
        .where('status', '<', 3) // Can only cancel before received
        .whereNot('status', 5) // Can't cancel if already canceled
        .first();
    
    return !!transaction;
}

/**
 * Get ratings for a transaction
 * @param {number} productId
 * @returns {Promise<Object>} Object with buyer and seller ratings
 */
export async function getTransactionRatings(productId) {
    const transaction = await getTransactionByProductId(productId);
    if (!transaction) return { buyerRating: null, sellerRating: null };
    
    const ratings = await db('ratings')
        .where('product_id', productId)
        .whereIn('rater_id', [transaction.buyer_id, transaction.seller_id]);
    
    const buyerRating = ratings.find(r => r.rater_id === transaction.buyer_id) || null;
    const sellerRating = ratings.find(r => r.rater_id === transaction.seller_id) || null;
    
    return { buyerRating, sellerRating };
}

/**
 * Check if both parties have rated each other
 * @param {number} productId
 * @returns {Promise<boolean>}
 */
export async function bothPartiesRated(productId) {
    const { buyerRating, sellerRating } = await getTransactionRatings(productId);
    return !!buyerRating && !!sellerRating;
}
