import express from 'express';
import * as watchlistService from '../services/watchlist.service.js';

const router = express.Router();

router.post('/api/add', async function (req, res) {
    if (!req.session.isAuthenticated) {
        return res.status(401).json({ 
            authenticated: false, 
            message: 'Please login first' 
        });
    }

    const userId = req.session.authUser.id;
    const productId = req.body.id;

    try {
        const result = await watchlistService.add(userId, productId);
        res.json({ success: true, action: result.action });
    } catch (err) {
        console.error(err);
        res.status(500).json({ success: false });
    }
});

export default router;