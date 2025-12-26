import express from 'express';
import * as watchlistService from '../services/watchlist.service.js';

const router = express.Router();

router.post('/api/add', async function (req, res) {
    if (!req.session.isAuthenticated) {
        return res.status(401).json({ 
            authenticated: false, 
            message: 'Vui lòng đăng nhập để thêm vào danh sách yêu thích!' 
        });
    }

    const userId = req.session.authUser.id;
    const productId = req.body.id;

    try {
        const result = await watchlistService.add(userId, productId);
        
        // Trả về message cho client
        if (result.action === 'added') {
            res.json({ 
                success: true, 
                action: 'added',
                message: 'Đã thêm vào danh sách yêu thích!' 
            });
        } else {
            res.json({ 
                success: true, 
                action: 'removed',
                message: 'Đã xóa khỏi danh sách yêu thích!' 
            });
        }
    } catch (err) {
        console.error(err);
        res.status(500).json({ 
            success: false,
            message: 'Có lỗi xảy ra, vui lòng thử lại!' 
        });
    }
});

export default router;