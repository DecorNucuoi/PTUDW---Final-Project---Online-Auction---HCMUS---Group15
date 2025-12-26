import db from '../utils/db.js';
import * as configService from './config.service.js';

export function findAll() {
    return db('products');
}

export function findAllWithSellerName() {
    return db('products')
        .join('users', 'products.seller_id', 'users.id')
        .select('products.*', 'users.full_name as seller_name')
        .orderBy('products.created_at', 'desc');
}

export function findById(id) {
    return db('products').where('id', id).first();
}

export function del(id) {
    return db('products').where('id', id).del();
}

/**
 * Soft delete product - set status to -1
 * @param {number} id - Product ID
 */
export async function softDelete(id) {
    return await db('products')
        .where('id', id)
        .update({
            status: -1,
            updated_at: new Date()
        });
}

/**
 * Restore soft-deleted product - set status back to 1
 * @param {number} id - Product ID
 */
export async function restore(id) {
    return await db('products')
        .where('id', id)
        .update({
            status: 1,
            updated_at: new Date()
        });
}

export function findTop5EndingSoon() {
    const list = db('products')
        .select('products.*', 'product_images.image_url')
        .leftJoin('product_images', function () {
            this.on('products.id', '=', 'product_images.product_id')
                .andOn('product_images.is_thumbnail', '=', db.raw('true'));
        })
        .where('end_time', '>', new Date())
        .andWhere('status', 1)
        .orderBy('end_time', 'asc')
        .limit(5);
    return list;
}

export function findTop5MostBidded() {
    const list = db('products')
        .select('products.*', 'product_images.image_url')
        .count('bids.id as bid_count')
        .leftJoin('bids', 'products.id', 'bids.product_id')
        .leftJoin('product_images', function () {
            this.on('products.id', '=', 'product_images.product_id')
                .andOn('product_images.is_thumbnail', '=', db.raw('true'));
        })
        .where('products.status', 1)
        .andWhere('products.end_time', '>', new Date())
        .groupBy('products.id', 'product_images.image_url')
        .orderBy('bid_count', 'desc')
        .limit(5);
    return list;
}

export async function findTop5HighestPrice() {
    const list = db('products')
        .select('products.*', 'product_images.image_url')
        .leftJoin('product_images', function () {
            this.on('products.id', '=', 'product_images.product_id')
                .andOn('product_images.is_thumbnail', '=', db.raw('true'));
        })
        .where('status', 1)
        .andWhere('end_time', '>', new Date())
        .orderBy('current_price', 'desc')
        .limit(5);
    return list;
}

export function findByCat(category_id) {
    const list = db('products')
        .where('category_id', category_id)
        .andWhere('status', 1)
        .andWhere('end_time', '>', new Date());
    return list;
}

async function getCategoryIds(catId) {
    catId = Number(catId);

    // If catId is 0, return all category IDs (All Categories)
    if (catId === 0) {
        const allCats = await db('categories').select('id');
        return allCats.map(cat => cat.id);
    }

    const subs = await db('categories').where('parent_id', catId).select('id');
    let subIds = [];
    if (Array.isArray(subs)) {
        subIds = subs.map(item => item.id);
    }
    const listId = [catId, ...subIds];
    return listId;
}

export async function countByCat(catId, minPrice = null, maxPrice = null) {
    const listId = await getCategoryIds(catId);

    const query = db('products')
        .whereIn('category_id', listId)
        .andWhere('status', 1);
    
    if (minPrice !== null) {
        query.andWhere('current_price', '>=', minPrice);
    }
    if (maxPrice !== null) {
        query.andWhere('current_price', '<=', maxPrice);
    }

    const list = await query.count({ amount: 'id' }).first();

    return list ? list.amount : 0;
}

export async function findPageByCat(catId, limit, offset, sortBy = 'time_desc', minPrice = null, maxPrice = null) {
    const listId = await getCategoryIds(catId);

    const query = db('products')
        .select('products.*', 'product_images.image_url')
        .leftJoin('product_images', function () {
            this.on('products.id', '=', 'product_images.product_id')
                .andOn('product_images.is_thumbnail', '=', db.raw('true'));
        })
        .whereIn('products.category_id', listId)
        .andWhere('products.status', 1);
    
    // Apply price filters
    if (minPrice !== null) {
        query.andWhere('products.current_price', '>=', minPrice);
    }
    if (maxPrice !== null) {
        query.andWhere('products.current_price', '<=', maxPrice);
    }

    // Apply sorting
    switch (sortBy) {
        case 'time_asc':
            query.orderBy('products.end_time', 'asc');
            break;
        case 'price_asc':
            query.orderBy('products.current_price', 'asc');
            break;
        case 'price_desc':
            query.orderBy('products.current_price', 'desc');
            break;
        case 'time_desc':
        default:
            query.orderBy('products.created_at', 'desc');
            break;
    }

    const list = await query.limit(limit).offset(offset);

    if (!list || !Array.isArray(list)) {
        return [];
    }

    return list.map(item => ({
        ...item,
        imagePath: item.image_url
    }));
}


export async function search(keyword, catId, sortType, limit, offset) {
    const query = db('products')
        .select(
            'products.*',
            'users.full_name as bidder_name',
            'product_images.image_url', // Select image URL
            db.raw('COUNT(bids.id) as bid_count')
        )
        .leftJoin('users', 'products.winner_id', 'users.id')
        .leftJoin('bids', 'products.id', 'bids.product_id')
        .leftJoin('product_images', function () {
            this.on('products.id', '=', 'product_images.product_id')
                .andOn('product_images.is_thumbnail', '=', db.raw('true'));
        })
        .where('products.status', 1)
        .groupBy('products.id', 'users.full_name', 'product_images.image_url');

    if (keyword) {
        query.whereRaw("to_tsvector('simple', products.name) @@ plainto_tsquery('simple', ?)", [keyword]);
    }

    if (catId > 0) {
        query.where('products.category_id', catId);
    }

    if (sortType === 'price_asc') {
        query.orderBy('products.current_price', 'asc'); // Giá tăng dần
    } else {
        query.orderBy('products.end_time', 'desc');
    }

    const products = await query.clone().limit(limit).offset(offset);

    // Map to include imagePath for consistency
    const productsWithImage = products.map(item => ({
        ...item,
        imagePath: item.image_url
    }));


    const totalResult = await db.from(function () {
        this.select('products.id')
            .from('products')
            .leftJoin('users', 'products.winner_id', 'users.id')
            .where('products.status', 1)
            .modify((qb) => {
                if (keyword) qb.whereRaw("to_tsvector('simple', name) @@ plainto_tsquery('simple', ?)", [keyword]);
                if (catId > 0) qb.where('category_id', catId);
            })
            .as('t')
    }).count('* as total').first();

    return {
        products: productsWithImage,
        total: totalResult.total
    };
}

async function getRatingPoint(userId) {
    const user = await db('users')
        .where('id', userId)
        .select('rating_score', 'rating_count')
        .first();
    
    if (!user || user.rating_count === 0) return 0;
    
    // Công thức: positive_count = (rating_score + rating_count) / 2
    // percentage = (positive_count / rating_count) * 100
    const positiveCount = (user.rating_score + user.rating_count) / 2;
    const percentage = (positiveCount / user.rating_count) * 100;
    return Math.round(percentage);
}


export async function findDetailById(id) {
    const product = await db('products').where('id', id).first();

    if (!product) return null;

    const seller = await db('users').where('id', product.seller_id).first();
    const sellerPoint = await getRatingPoint(product.seller_id);

    let winner = null;
    let winnerPoint = 0;

    if (product.winner_id) {
        winner = await db('users').where('id', product.winner_id).first();
        winnerPoint = await getRatingPoint(product.winner_id);
    }

    return {
        ...product,
        seller_name: seller ? seller.full_name : 'Unknown',
        seller_point: sellerPoint,
        winner_name: winner ? winner.full_name : null,
        winner_point: winnerPoint
    };
}

export async function findRelated(catId, currentId) {
    return db('products')
        .leftJoin('product_images', function() {
            this.on('products.id', '=', 'product_images.product_id')
                .andOn('product_images.is_thumbnail', '=', db.raw('true'));
        })
        .where('products.category_id', catId)
        .whereNot('products.id', currentId)
        .where('products.status', 1)
        .select('products.*', 'product_images.image_url as imagePath')
        .limit(5)
        .orderBy('products.end_time', 'asc');
}

export async function findQuestions(productId) {
    return db('questions')
        .join('users', 'questions.user_id', 'users.id')
        .where('product_id', productId)
        .select('questions.*', 'users.full_name as asker_name')
        .orderBy('created_at', 'desc');
}


export async function placeBid(productId, bidderId, price) {
    return db.transaction(async trx => {

        await trx('bids').insert({
            product_id: productId,
            bidder_id: bidderId,
            price: price,
            max_price: price,
            status: 1,
            created_at: new Date()
        });

        // Auto-extension logic - use config values instead of hardcoded
        const product = await trx('products').where('id', productId).first();
        if (product && product.auto_extend) {
            const now = new Date();
            const endTime = new Date(product.end_time);
            const diff = endTime - now;

            // Get threshold and duration from system_config
            const thresholdMinutes = await configService.getAutoExtendThreshold(); // default: 5
            const durationMinutes = await configService.getAutoExtendDuration(); // default: 10

            const thresholdMs = thresholdMinutes * 60 * 1000;
            const durationMs = durationMinutes * 60 * 1000;

            if (diff > 0 && diff < thresholdMs) { // Less than threshold minutes
                const newEndTime = new Date(endTime.getTime() + durationMs); // Add duration minutes
                await trx('products').where('id', productId).update({ end_time: newEndTime });
            }
        }

        await trx('products')
            .where('id', productId)
            .update({
                current_price: price,
                winner_id: bidderId,
            });

        // Optimization: Insert bid *after* product updates to ensure consistency or before, transaction handles both. 
        // Keeping original order but ensuring product fetch is inside trx.
    });
}

export async function findBidHistory(productId) {
    return db('bids')
        .join('users', 'bids.bidder_id', 'users.id')
        .leftJoin('product_bans', function() {
            this.on('product_bans.product_id', '=', 'bids.product_id')
                .andOn('product_bans.user_id', '=', 'bids.bidder_id');
        })
        .where('bids.product_id', productId)
        .select(
            'bids.*', 
            'users.full_name',
            'users.rating_score',
            'users.rating_count',
            db.raw('CASE WHEN product_bans.user_id IS NOT NULL THEN true ELSE false END as is_banned')
        )
        .orderBy('price', 'desc');
}

export async function addQuestion(entity) {
    return db('questions').insert(entity);
}

export async function add(entity) {
    const [id] = await db('products').insert(entity).returning('id');
    return id;
}

export async function findBySeller(sellerId) {
    return db('products')
        .leftJoin('users', 'products.winner_id', 'users.id')
        .leftJoin('product_images', function() {
            this.on('products.id', '=', 'product_images.product_id')
                .andOn('product_images.is_thumbnail', '=', db.raw('true'));
        })
        .leftJoin('transactions', 'products.id', 'transactions.product_id')
        .where('products.seller_id', sellerId)
        .select('products.*', 'users.full_name as winner_name', 'product_images.image_url as imagePath', 'transactions.status as transaction_status')
        .orderBy('products.created_at', 'desc');
}

export async function findBySellerWithStatus(sellerId, status) {
    return db('products')
        .leftJoin('users', 'products.winner_id', 'users.id')
        .leftJoin('product_images', function() {
            this.on('products.id', '=', 'product_images.product_id')
                .andOn('product_images.is_thumbnail', '=', db.raw('true'));
        })
        .leftJoin('transactions', 'products.id', 'transactions.product_id')
        .where('products.seller_id', sellerId)
        .where('products.status', status)
        .select('products.*', 'users.full_name as winner_name', 'product_images.image_url as imagePath', 'transactions.status as transaction_status')
        .orderBy('products.created_at', 'desc');
}

export async function appendDescription(productId, newContent) {
    // 1. Insert into audit table
    await db('product_desc_updates').insert({
        product_id: productId,
        content: newContent,
        created_at: new Date()
    });

    // 2. Update the main product description for display
    const product = await db('products').where('id', productId).select('description').first();
    const oldDescription = product.description || '';

    const date = new Date().toLocaleString('vi-VN');
    const timeHeader = `
        <div style="margin-top: 20px; border-top: 1px dashed #ccc; padding-top: 10px;">
            <p>
                <span style="background-color: #fff3cd; padding: 5px 10px; border-radius: 5px; font-weight: bold;">
                    ✏️ Cập nhật ngày: ${date}
                </span>
            </p>
        </div>
    `;

    const finalDescription = oldDescription + timeHeader + newContent;

    return db('products').where('id', productId).update({
        description: finalDescription
    });
}

export async function banBidder(productId, bidderId) {
    return db.transaction(async trx => {
        // Insert into product_bans table
        await trx('product_bans')
            .insert({
                product_id: productId,
                user_id: bidderId,
                created_at: new Date()
            })
            .onConflict(['product_id', 'user_id'])
            .ignore(); // Ignore if already banned

        // Invalidate all existing bids from this bidder
        await trx('bids')
            .where({ product_id: productId, bidder_id: bidderId })
            .update({ status: 0 });

        // Recalculate winner
        const newWinner = await trx('bids')
            .leftJoin('product_bans', function() {
                this.on('product_bans.product_id', '=', 'bids.product_id')
                    .andOn('product_bans.user_id', '=', 'bids.bidder_id');
            })
            .where('bids.product_id', productId)
            .where('bids.status', 1)
            .whereNull('product_bans.user_id') // Not banned
            .orderBy('bids.price', 'desc')
            .select('bids.*')
            .first();

        if (newWinner) {
            await trx('products')
                .where('id', productId)
                .update({
                    winner_id: newWinner.bidder_id,
                    current_price: newWinner.price
                });
        } else {
            const product = await trx('products').where('id', productId).select('start_price').first();
            await trx('products')
                .where('id', productId)
                .update({
                    winner_id: null,
                    current_price: product.start_price
                });
        }
    });
}

export async function unbanBidder(productId, bidderId) {
    await db('product_bans')
        .where({ product_id: productId, user_id: bidderId })
        .delete();
}

export async function isBanned(productId, userId) {
    const ban = await db('product_bans')
        .where({ product_id: productId, user_id: userId })
        .first();
    return !!ban;
}

export async function getBannedBidders(productId) {
    return db('product_bans')
        .join('users', 'product_bans.user_id', 'users.id')
        .where('product_bans.product_id', productId)
        .select(
            'users.id',
            'users.full_name',
            'users.email',
            'users.rating_score',
            'users.rating_count',
            'product_bans.created_at as banned_at'
        )
        .orderBy('product_bans.created_at', 'desc');
}

export async function findImages(productId) {
    return db('product_images').where('product_id', productId).orderBy('display_order', 'asc');
}

export async function answerQuestion(questionId, answerContent) {
    return db('questions')
        .where('id', questionId)
        .update({
            answer: answerContent
        });
}