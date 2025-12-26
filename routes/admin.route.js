// routes/admin.route.js
import express from 'express';
import db from '../utils/db.js';

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

export default router;
