// user.service.js
import db from '../utils/db.js';
import * as configService from './config.service.js';

export function add(user) {
    return db('users').insert(user);
}

export async function findByEmail(email) {
    const user = await db('users').where('email', email).first();

    return user || null;
}

export async function verifyOTP(email, otp) {
    const user = await findByEmail(email);
    if (!user) return false;

    if (user.otp === otp) {
        await db('users')
            .where('email', email)
            .update({
                is_verified: true,
                otp: null
            });
        return true;
    }
    return false;
}

export function findByUsername(username) {
    return db('users').where('username', username).first();
}

export function update(id, user) {
    return db('users').where('id', id).update(user);
}

export async function findById(id) {
    const user = await db('users').where('id', id).first();
    return user || null;
}

export async function isEligibleToBid(id, product) {
    const ratings = await db('ratings').where('rated_user_id', id);
    if (!ratings || !Array.isArray(ratings)) {
        return !!product.allow_newbie;
    }
    const total = ratings.length;
    if (total === 0) {
        return !!product.allow_newbie;
    }
    const likes = ratings.filter(r => r.score === 1).length;
    const ratio = likes / total;
    
    // Get rating threshold from system_config (default: 80%)
    const threshold = await configService.getRatingThreshold(); // Returns number like 80
    const thresholdDecimal = threshold / 100; // Convert to 0.8
    
    return ratio >= thresholdDecimal;
}

export async function getWatchlist(Id) {
    return db('watchlists')
        .join('products', 'watchlists.product_id', 'products.id')
        .leftJoin('product_images', function() {
            this.on('products.id', '=', 'product_images.product_id')
                .andOn('product_images.is_thumbnail', '=', db.raw('true'));
        })
        .where('watchlists.user_id', Id)
        .select('products.*', 'product_images.image_url as imagePath');
}

export async function getBiddingList(Id) {
    return db('bids')
        .join('products', 'bids.product_id', 'products.id')
        .where('bids.bidder_id', Id)
        .where('products.status', 1)
        .distinct('products.id')
        .select('products.*');
}

export async function getWonList(Id) {
    return db('products')
        .join('users', 'products.seller_id', 'users.id')
        .leftJoin('product_images', function() {
            this.on('products.id', '=', 'product_images.product_id')
                .andOn('product_images.is_thumbnail', '=', db.raw('true'));
        })
        .leftJoin('transactions', 'products.id', 'transactions.product_id')
        .where('products.winner_id', Id)
        .where('products.status', 2)
        .select('products.*', 'users.full_name as seller_name', 'users.email as seller_email', 'product_images.image_url as imagePath', 'transactions.status as transaction_status');
}

export async function getMyRatings(Id) {
    return db('ratings')
        .join('users', 'ratings.rater_id', 'users.id')
        .where('ratings.rated_user_id', Id)
        .select('ratings.*', 'users.full_name as rater_name');
}

export async function addRating(entity) {
    return db('ratings').insert(entity);
}

export async function findRating(productId, raterId) {
    const rating = await db('ratings')
        .where({ product_id: productId, rater_id: raterId })
        .first();
    return rating || null;
}

export async function updateRating(ratingId, updates) {
    return db('ratings')
        .where('id', ratingId)
        .update({
            ...updates,
            updated_at: new Date()
        });
}

export async function hasRated(productId, raterId) {
    const row = await db('ratings')
        .where({ product_id: productId, rater_id: raterId })
        .first();
    return !!row;
}

export async function requestUpgrade(userId) {
    return db('upgrade_requests').insert({
        user_id: userId,
        status: 0,
        created_at: new Date()
    });
}

export async function isPendingUpgrade(userId) {
    const request = await db('upgrade_requests')
        .where('user_id', userId)
        .where('status', 0)
        .first();
    return !!request;
}


export function findAll() {
    return db('users').orderBy('id', 'asc');
}


export async function del(id) {
    return db.transaction(async trx => {
        await trx('bids').where('bidder_id', id).del();
        await trx('watchlists').where('user_id', id).del();
        await trx('upgrade_requests').where('user_id', id).del();
        await trx('products').where('seller_id', id).del();
        await trx('users').where('id', id).del();
    });
}

export function patch(id, entity) {
    return db('users').where('id', id).update(entity);
}

export function findPendingUpgradeRequests() {
    return db('upgrade_requests')
        .join('users', 'upgrade_requests.user_id', 'users.id')
        .where('upgrade_requests.status', 0)
        .select(
            'upgrade_requests.id as request_id',
            'users.id',
            'users.full_name',
            'users.email',
            'upgrade_requests.created_at as request_time'
        );
}

export async function approveUpgrade(requestId, userId) {
    return db.transaction(async trx => {
        await trx('users').where('id', userId).update({ role: 1 });

        await trx('upgrade_requests').where('id', requestId).update({ status: 1 });
    });
}

export async function rejectUpgrade(requestId) {
    return db('upgrade_requests').where('id', requestId).update({ status: 2 });
}