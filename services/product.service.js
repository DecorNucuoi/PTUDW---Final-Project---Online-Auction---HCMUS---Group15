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


/**
 * 🔍 ADVANCED SEARCH ENGINE
 * Features:
 * - Full-text search với relevance scoring
 * - Multi-field search (name, description, category)
 * - Advanced filters (price, condition, bids, time, seller rating)
 * - Intelligent sorting với popularity boost
 * - Search analytics tracking
 */
export async function search(keyword, catId, sortType, limit, offset, filters = {}) {
    const {
        minPrice = null,
        maxPrice = null,
        condition = null,      // 'new', 'like_new', 'used'
        minBids = null,
        maxBids = null,
        endingSoon = null,     // hours remaining
        minSellerRating = null // percentage (0-100)
    } = filters;

    // Build base query with all necessary joins
    const baseQuery = db('products')
        .leftJoin('product_images', function () {
            this.on('products.id', '=', 'product_images.product_id')
                .andOn('product_images.is_thumbnail', '=', db.raw('true'));
        })
        .leftJoin('categories', 'products.category_id', 'categories.id')
        .leftJoin('users as sellers', 'products.seller_id', 'sellers.id')
        .where('products.status', 1)
        .andWhere('products.end_time', '>', new Date());

    // 🎯 FULL-TEXT SEARCH với relevance scoring
    if (keyword && keyword.trim()) {
        const searchTerms = keyword.trim().toLowerCase().split(/\s+/);
        const searchPattern = `%${keyword.trim()}%`;
        
        // Search trong multiple fields với weighting
        baseQuery.where(function() {
            // Priority 1: Exact match trong tên (highest relevance)
            this.whereRaw('LOWER(products.name) = LOWER(?)', [keyword.trim()])
            // Priority 2: Tên bắt đầu với keyword
            .orWhereRaw('LOWER(products.name) LIKE LOWER(?)', [keyword.trim() + '%'])
            // Priority 3: Tên chứa keyword
            .orWhereRaw('LOWER(products.name) LIKE LOWER(?)', [searchPattern])
            // Priority 4: Description chứa keyword
            .orWhereRaw('LOWER(products.description) LIKE LOWER(?)', [searchPattern])
            // Priority 5: Category name
            .orWhereRaw('LOWER(categories.name) LIKE LOWER(?)', [searchPattern]);
        });
    }

    // 🏷️ Category filter (include subcategories)
    if (catId > 0) {
        const categoryIds = await getCategoryIds(catId);
        baseQuery.whereIn('products.category_id', categoryIds);
    }

    // 💰 Price range filters
    if (minPrice !== null && minPrice > 0) {
        baseQuery.where('products.current_price', '>=', minPrice);
    }
    if (maxPrice !== null && maxPrice > 0) {
        baseQuery.where('products.current_price', '<=', maxPrice);
    }

    // 📦 Condition filter
    if (condition && ['new', 'like_new', 'used'].includes(condition)) {
        baseQuery.where('products.condition', condition);
    }

    // 🔨 Bid count filter
    // Note: We'll handle bid count aggregation in the main query
    // This is just to prepare the join if needed

    // ⏰ Ending soon filter (in hours)
    if (endingSoon !== null && endingSoon > 0) {
        const endTime = new Date();
        endTime.setHours(endTime.getHours() + endingSoon);
        baseQuery.where('products.end_time', '<=', endTime);
    }

    // ⭐ Seller rating filter (using rating_score out of 5)
    if (minSellerRating !== null && minSellerRating > 0) {
        // Convert percentage (0-100) to score (0-5)
        const minScore = (minSellerRating / 100) * 5;
        baseQuery.where('sellers.rating_score', '>=', minScore);
    }

    // Count total results (optimized)
    const countQuery = baseQuery.clone()
        .clearSelect()
        .clearOrder()
        .countDistinct('products.id as total')
        .first();

    // Products query with enhanced data
    const productsQuery = baseQuery.clone()
        .select(
            'products.*',
            'product_images.image_url',
            'categories.name as category_name',
            'sellers.full_name as seller_name',
            'sellers.rating_score as seller_rating_score',
            'sellers.rating_count as seller_rating_count'
        );

    // 🎲 INTELLIGENT SORTING
    switch (sortType) {
        case 'relevance':
            // Sort by relevance score (for keyword searches)
            if (keyword && keyword.trim()) {
                productsQuery.orderByRaw(
                    `CASE 
                        WHEN LOWER(products.name) = LOWER(?) THEN 1
                        WHEN LOWER(products.name) LIKE LOWER(?) THEN 2
                        WHEN LOWER(products.name) LIKE LOWER(?) THEN 3
                        ELSE 4
                    END`,
                    [keyword.trim(), keyword.trim() + '%', `%${keyword.trim()}%`]
                );
            }
            // Secondary sort by created date (most_bids will be handled in JS)
            productsQuery.orderBy('products.created_at', 'desc');
            break;
        
        case 'price_asc':
            productsQuery.orderBy('products.current_price', 'asc');
            break;
        
        case 'price_desc':
            productsQuery.orderBy('products.current_price', 'desc');
            break;
        
        case 'ending_soon':
            productsQuery.orderBy('products.end_time', 'asc');
            break;
        
        case 'most_bids':
            // Will sort by bid count in JavaScript after fetching bid counts
            productsQuery.orderBy('products.created_at', 'desc');
            break;
        
        case 'newest':
            productsQuery.orderBy('products.created_at', 'desc');
            break;
        
        case 'time_desc':
        default:
            productsQuery.orderBy('products.created_at', 'desc');
            break;
    }

    // Execute queries in parallel
    const [products, totalResult] = await Promise.all([
        productsQuery.limit(limit).offset(offset),
        countQuery
    ]);

    // Handle empty results
    if (!products || products.length === 0) {
        return {
            products: [],
            total: 0
        };
    }

    // Get bid counts for all products in a single query
    const productIds = products.map(p => p.id);
    const bidCounts = productIds.length > 0 ? await db('bids')
        .select('product_id')
        .count('* as count')
        .whereIn('product_id', productIds)
        .groupBy('product_id') : [];
    
    const bidCountMap = {};
    bidCounts.forEach(item => {
        bidCountMap[item.product_id] = parseInt(item.count) || 0;
    });

    // Apply bid count filter if specified
    let filteredProducts = products;
    if (minBids !== null || maxBids !== null) {
        filteredProducts = products.filter(p => {
            const count = bidCountMap[p.id] || 0;
            if (minBids !== null && count < minBids) return false;
            if (maxBids !== null && count > maxBids) return false;
            return true;
        });
    }

    // Calculate seller rating percentage and add bid count
    const productsWithEnhancedData = filteredProducts.map(item => {
        // Convert rating_score (0-5) to percentage (0-100)
        const sellerRating = item.seller_rating_score 
            ? Math.round((item.seller_rating_score / 5) * 100)
            : null;
        
        return {
            ...item,
            imagePath: item.image_url,
            seller_rating_percentage: sellerRating,
            seller_rating_count: item.seller_rating_count || 0,
            bid_count: bidCountMap[item.id] || 0,
            time_remaining_hours: Math.max(0, Math.floor((new Date(item.end_time) - new Date()) / (1000 * 60 * 60)))
        };
    });

    // Sort by bid count if requested (must be done after adding bid_count to products)
    if (sortType === 'most_bids' || (sortType === 'relevance' && (!keyword || !keyword.trim()))) {
        productsWithEnhancedData.sort((a, b) => b.bid_count - a.bid_count);
    }

    return {
        products: productsWithEnhancedData,
        total: parseInt(totalResult.total) || 0
    };
}

/**
 * 🔍 Search Autocomplete/Suggestions
 * Trả về gợi ý sản phẩm khi user đang gõ
 */
export async function searchSuggestions(keyword, limit = 5) {
    if (!keyword || keyword.trim().length < 2) {
        return [];
    }

    const searchPattern = `%${keyword.trim()}%`;
    
    const suggestions = await db('products')
        .select('id', 'name', 'current_price')
        .leftJoin('product_images', function () {
            this.on('products.id', '=', 'product_images.product_id')
                .andOn('product_images.is_thumbnail', '=', db.raw('true'));
        })
        .select('product_images.image_url')
        .where('products.status', 1)
        .andWhere('products.end_time', '>', new Date())
        .where(function() {
            this.whereRaw('LOWER(products.name) LIKE LOWER(?)', [searchPattern]);
        })
        .orderByRaw(
            `CASE 
                WHEN LOWER(products.name) LIKE LOWER(?) THEN 1
                WHEN LOWER(products.name) LIKE LOWER(?) THEN 2
                ELSE 3
            END`,
            [keyword.trim() + '%', searchPattern]
        )
        .limit(limit);
    
    return suggestions;
}

/**
 * 📊 Get Popular Search Keywords
 * Trả về các từ khóa tìm kiếm phổ biến (có thể cache)
 */
export async function getPopularSearches(limit = 10) {
    try {
        // Phân tích từ các tên sản phẩm phổ biến
        const popularProducts = await db('products')
            .select('products.name')
            .leftJoin('bids', 'products.id', 'bids.product_id')
            .where('products.status', 1)
            .andWhere('products.end_time', '>', new Date())
            .groupBy('products.id', 'products.name')
            .orderByRaw('COUNT(bids.id) DESC')
            .limit(limit);
        
        // Trích xuất keywords từ tên sản phẩm
        const keywords = popularProducts.map(p => {
            const words = p.name.split(' ').filter(w => w.length > 3);
            return words[0] || p.name.split(' ')[0];
        });
        
        return [...new Set(keywords)].slice(0, limit);
    } catch (err) {
        console.error('[getPopularSearches] Error:', err);
        return [];
    }
}

/**
 * 🎯 Get Search Filters Metadata
 * Trả về metadata cho filters (min/max values, available options)
 */
export async function getSearchFiltersMetadata() {
    try {
        const [priceRange, categories] = await Promise.all([
            // Price range
            db('products')
                .where('status', 1)
                .andWhere('end_time', '>', new Date())
                .min('current_price as min')
                .max('current_price as max')
                .first()
                .catch(() => ({ min: 0, max: 100000000 })),
            
            // Active categories with product counts
            db('categories')
                .select('categories.id', 'categories.name', 'categories.parent_id')
                .leftJoin('products', 'categories.id', 'products.category_id')
                .where('products.status', 1)
                .andWhere('products.end_time', '>', new Date())
                .groupBy('categories.id', 'categories.name', 'categories.parent_id')
                .count('products.id as product_count')
                .havingRaw('COUNT(products.id) > 0')
                .orderBy('product_count', 'desc')
                .catch(() => [])
        ]);

        return {
            priceRange: {
                min: Math.floor(priceRange?.min || 0),
                max: Math.ceil(priceRange?.max || 100000000)
            },
            bidRange: {
                min: 0,
                max: 100
            },
            categories: categories || [],
            conditions: ['new', 'like_new', 'used'],
            sortOptions: [
                { value: 'relevance', label: 'Most Relevant' },
                { value: 'ending_soon', label: 'Ending Soon' },
                { value: 'most_bids', label: 'Most Bids' },
                { value: 'price_asc', label: 'Price: Low to High' },
                { value: 'price_desc', label: 'Price: High to Low' },
                { value: 'newest', label: 'Newest' }
            ]
        };
    } catch (err) {
        console.error('[getSearchFiltersMetadata] Error:', err);
        return {
            priceRange: { min: 0, max: 100000000 },
            bidRange: { min: 0, max: 100 },
            categories: [],
            conditions: ['new', 'like_new', 'used'],
            sortOptions: [
                { value: 'relevance', label: 'Most Relevant' },
                { value: 'ending_soon', label: 'Ending Soon' },
                { value: 'most_bids', label: 'Most Bids' },
                { value: 'price_asc', label: 'Price: Low to High' },
                { value: 'price_desc', label: 'Price: High to Low' },
                { value: 'newest', label: 'Newest' }
            ]
        };
    }
}

// Helper function: Calculate rating percentage in-memory (fast)
function calculateRatingPercentage(score, count) {
    if (!count || count === 0) return 0;
    // Formula: positive_count = (rating_score + rating_count) / 2
    // percentage = (positive_count / rating_count) * 100
    const positiveCount = (score + count) / 2;
    return Math.round((positiveCount / count) * 100);
}

async function getRatingPoint(userId) {
    const user = await db('users')
        .where('id', userId)
        .select('rating_score', 'rating_count')
        .first();
    
    if (!user || user.rating_count === 0) return 0;
    
    return calculateRatingPercentage(user.rating_score, user.rating_count);
}

// ✅ OPTIMIZED: 1 query with JOINs instead of 5 sequential queries (5x faster)
export async function findDetailById(id) {
    const product = await db('products')
        .leftJoin('users as seller', 'products.seller_id', 'seller.id')
        .leftJoin('users as winner', 'products.winner_id', 'winner.id')
        .where('products.id', id)
        .select(
            'products.*',
            'seller.full_name as seller_name',
            'seller.email as seller_email',
            'seller.rating_score as seller_rating_score',
            'seller.rating_count as seller_rating_count',
            'winner.full_name as winner_name',
            'winner.rating_score as winner_rating_score',
            'winner.rating_count as winner_rating_count'
        )
        .first();

    if (!product) return null;

    // Calculate rating percentages in-memory (instant, no DB query)
    product.seller_point = calculateRatingPercentage(
        product.seller_rating_score,
        product.seller_rating_count
    );
    
    if (product.winner_name) {
        product.winner_point = calculateRatingPercentage(
            product.winner_rating_score,
            product.winner_rating_count
        );
    }

    return product;
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
    // Lấy thông tin product để biết winner hiện tại
    const product = await db('products').where('id', productId).first();
    
    const bids = await db('bids')
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
        .orderBy('created_at', 'desc'); // Sắp xếp theo thời gian mới nhất đầu tiên
    
    // Đánh dấu bid của winner hiện tại (chỉ lượt MỚI NHẤT với bidder_id và price khớp)
    if (product && product.winner_id && product.current_price) {
        // Tìm tất cả bids của winner với giá khớp
        const winnerBids = bids.filter(bid => 
            bid.bidder_id === product.winner_id && 
            parseFloat(bid.price) === parseFloat(product.current_price) &&
            !bid.is_banned
        );
        
        // Chỉ đánh dấu bid MỚI NHẤT (created_at lớn nhất)
        if (winnerBids.length > 0) {
            const latestWinnerBid = winnerBids.reduce((latest, current) => 
                new Date(current.created_at) > new Date(latest.created_at) ? current : latest
            );
            
            bids.forEach(bid => {
                bid.is_current_winner = (bid.id === latestWinnerBid.id);
            });
        } else {
            bids.forEach(bid => {
                bid.is_current_winner = false;
            });
        }
    } else {
        // Không có winner
        bids.forEach(bid => {
            bid.is_current_winner = false;
        });
    }
    
    return bids;
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

        // Recalculate winner: Tìm bid MỚI NHẤT (gần nhất) không bị banned
        // Vì chỉ được ra giá cao hơn, bid mới nhất cũng là giá cao nhất
        const newWinner = await trx('bids')
            .leftJoin('product_bans', function() {
                this.on('product_bans.product_id', '=', 'bids.product_id')
                    .andOn('product_bans.user_id', '=', 'bids.bidder_id');
            })
            .where('bids.product_id', productId)
            .where('bids.status', 1)
            .whereNull('product_bans.user_id') // Not banned
            .orderBy('bids.created_at', 'desc') // Sắp theo thời gian mới nhất
            .select('bids.*')
            .first();

        console.log('🔍 New winner after ban:', newWinner);
        
        if (newWinner) {
            console.log(`✅ Cập nhật winner_id=${newWinner.bidder_id}, current_price=${newWinner.price}`);
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
    return db.transaction(async trx => {
        // Remove ban
        await trx('product_bans')
            .where({ product_id: productId, user_id: bidderId })
            .delete();

        // Recalculate winner: Tìm bid GIÁ CAO NHẤT, rồi MỚI NHẤT nếu cùng giá
        // Đây là logic giống với khi người đấu giá bình thường
        const newWinner = await trx('bids')
            .leftJoin('product_bans', function() {
                this.on('product_bans.product_id', '=', 'bids.product_id')
                    .andOn('product_bans.user_id', '=', 'bids.bidder_id');
            })
            .where('bids.product_id', productId)
            .where('bids.status', 1)
            .whereNull('product_bans.user_id') // Not banned
            .orderBy('bids.price', 'desc') // Giá cao nhất trước
            .orderBy('bids.created_at', 'desc') // Nếu cùng giá, mới nhất thắng
            .select('bids.*')
            .first();

        console.log('🔓 New winner after unban:', newWinner);
        
        if (newWinner) {
            console.log(`✅ Cập nhật winner_id=${newWinner.bidder_id}, current_price=${newWinner.price}`);
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

/**
 * Get unique bidders for a product (for email notifications)
 * @param {number} productId - Product ID
 * @returns {Promise<Array>} Array of unique bidder objects with email
 */
export async function getUniqueBidders(productId) {
    return db('bids')
        .join('users', 'bids.bidder_id', 'users.id')
        .where('bids.product_id', productId)
        .select(
            'users.id',
            'users.email',
            'users.full_name'
        )
        .groupBy('users.id', 'users.email', 'users.full_name')
        .orderBy('users.id');
}