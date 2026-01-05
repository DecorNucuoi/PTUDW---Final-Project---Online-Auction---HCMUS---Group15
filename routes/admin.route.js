// routes/admin.route.js
import express from 'express';
import db from '../utils/db.js';
import { getCacheStats, clearAllCaches, getAllCacheKeys } from '../utils/cache.js';

const router = express.Router();

/**
 * GET /admin
 * Admin Dashboard - Overview of system statistics
 */
router.get('/', async function (req, res) {
    try {
        // Get statistics
        const stats = await getSystemStats();
        
        res.render('vwAdmin/dashboard', {
            stats: stats,
            adminUser: req.session.authUser
        });
    } catch (error) {
        console.error('Error loading admin dashboard:', error);
        res.status(500).send('Lỗi khi tải dashboard');
    }
});

/**
 * Get system statistics for dashboard
 */
async function getSystemStats() {
    // Total users by role
    const userStats = await db('users')
        .select('role')
        .count('id as count')
        .groupBy('role');
    
    const usersByRole = {
        bidders: 0,
        sellers: 0,
        admins: 0
    };
    
    userStats.forEach(stat => {
        if (stat.role === 0) usersByRole.bidders = Number(stat.count);
        if (stat.role === 1) usersByRole.sellers = Number(stat.count);
        if (stat.role === 2) usersByRole.admins = Number(stat.count);
    });
    
    // Total products by status
    const productStats = await db('products')
        .select('status')
        .count('id as count')
        .groupBy('status');
    
    const productsByStatus = {
        draft: 0,
        active: 0,
        ended: 0,
        deleted: 0
    };
    
    productStats.forEach(stat => {
        if (stat.status === -1) productsByStatus.deleted = Number(stat.count);
        if (stat.status === 0) productsByStatus.draft = Number(stat.count);
        if (stat.status === 1) productsByStatus.active = Number(stat.count);
        if (stat.status === 2) productsByStatus.ended = Number(stat.count);
    });
    
    // Total categories
    const categoryCount = await db('categories').count('id as count').first();
    const totalCategories = Number(categoryCount.count);
    
    // Root categories
    const rootCategoryCount = await db('categories')
        .whereNull('parent_id')
        .count('id as count')
        .first();
    const totalRootCategories = Number(rootCategoryCount.count);
    
    // Pending upgrade requests
    const pendingRequests = await db('upgrade_requests')
        .where('status', 0) // 0 = pending, 1 = approved, 2 = rejected
        .count('id as count')
        .first();
    const totalPendingRequests = Number(pendingRequests.count || 0);
    
    // Total bids
    const bidCount = await db('bids').count('id as count').first();
    const totalBids = Number(bidCount.count);
    
    // Recent activities (last 10 bids)
    const recentBids = await db('bids')
        .join('users', 'bids.bidder_id', 'users.id')
        .join('products', 'bids.product_id', 'products.id')
        .select('bids.*', 'users.full_name as bidder_name', 'products.name as product_name')
        .orderBy('bids.created_at', 'desc')
        .limit(10);
    
    return {
        users: {
            total: usersByRole.bidders + usersByRole.sellers + usersByRole.admins,
            bidders: usersByRole.bidders,
            sellers: usersByRole.sellers,
            admins: usersByRole.admins
        },
        products: {
            total: productsByStatus.draft + productsByStatus.active + productsByStatus.ended,
            active: productsByStatus.active,
            ended: productsByStatus.ended,
            draft: productsByStatus.draft,
            deleted: productsByStatus.deleted
        },
        categories: {
            total: totalCategories,
            root: totalRootCategories
        },
        upgradeRequests: totalPendingRequests,
        bids: totalBids,
        recentBids: recentBids
    };
}

/**
 * GET /admin/cache-stats
 * View cache statistics
 */
router.get('/cache-stats', function (req, res) {
    try {
        const stats = getCacheStats();
        const keys = getAllCacheKeys();
        
        res.json({
            success: true,
            statistics: stats,
            keys: keys,
            timestamp: new Date().toISOString()
        });
    } catch (error) {
        console.error('Error getting cache stats:', error);
        res.status(500).json({
            success: false,
            message: 'Failed to get cache statistics',
            error: error.message
        });
    }
});

/**
 * GET /admin/cache-stats
 * Display cache statistics
 */
router.get('/cache-stats', function (req, res) {
    try {
        const stats = getCacheStats();
        
        // Calculate hit rates
        const hitRate = {
            short: stats.short.hits + stats.short.misses > 0 
                ? ((stats.short.hits / (stats.short.hits + stats.short.misses)) * 100).toFixed(2)
                : 0,
            medium: stats.medium.hits + stats.medium.misses > 0
                ? ((stats.medium.hits / (stats.medium.hits + stats.medium.misses)) * 100).toFixed(2)
                : 0,
            long: stats.long.hits + stats.long.misses > 0
                ? ((stats.long.hits / (stats.long.hits + stats.long.misses)) * 100).toFixed(2)
                : 0
        };

        // Get all cache keys
        const cacheKeys = getAllCacheKeys();
        
        res.render('vwAdmin/cache-stats', {
            stats,
            hitRate,
            cacheKeys,
            adminUser: req.session.authUser
        });
    } catch (error) {
        console.error('Error loading cache stats:', error);
        res.status(500).send('Lỗi khi tải cache statistics');
    }
});

/**
 * POST /admin/clear-cache
 * Clear all caches
 */
router.post('/clear-cache', function (req, res) {
    try {
        clearAllCaches();
        req.session.successMessage = 'All caches cleared successfully';
        res.redirect('/admin/cache-stats');
    } catch (error) {
        console.error('Error clearing cache:', error);
        req.session.errorMessage = 'Failed to clear caches';
        res.redirect('/admin/cache-stats');
    }
});

export default router;
