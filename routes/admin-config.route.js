// routes/admin-config.route.js
import express from 'express';
import * as configService from '../services/config.service.js';

const router = express.Router();

/**
 * GET /admin/config
 * Display system configuration page
 */
router.get('/', async function (req, res) {
    try {
        const configs = await configService.getAll();
        
        // Group configs by category for better UI
        const groupedConfigs = {
            auction: configs.filter(c => c.config_key.includes('extend') || c.config_key.includes('rating')),
            upload: configs.filter(c => c.config_key.includes('upload') || c.config_key.includes('image')),
            system: configs.filter(c => c.config_key.includes('session') || c.config_key.includes('retry'))
        };
        
        res.render('vwAdminConfig/index', {
            groupedConfigs
        });
    } catch (error) {
        console.error('Error loading config:', error);
        res.status(500).send('Error loading configuration');
    }
});

/**
 * POST /admin/config/update
 * Update system configuration
 */
router.post('/update', async function (req, res) {
    try {
        const updates = {};
        
        // Extract config updates from form data
        for (const key in req.body) {
            if (key.startsWith('config_')) {
                const configKey = key.replace('config_', '');
                const value = req.body[key];
                
                // Validate numeric values
                if (configKey.includes('threshold') || 
                    configKey.includes('duration') || 
                    configKey.includes('max') || 
                    configKey.includes('min') ||
                    configKey.includes('timeout') ||
                    configKey.includes('percent')) {
                    const numValue = parseFloat(value);
                    if (isNaN(numValue) || numValue < 0) {
                        req.session.errorMessage = `Giá trị không hợp lệ cho ${configKey}. Phải là số dương.`;
                        return res.redirect('/admin/config');
                    }
                    updates[configKey] = numValue;
                } else {
                    updates[configKey] = value;
                }
            }
        }
        
        // Update all configs
        const totalUpdated = await configService.updateMultiple(updates);
        
        req.session.successMessage = `Đã cập nhật ${totalUpdated} cấu hình thành công!`;
        res.redirect('/admin/config');
    } catch (error) {
        console.error('Error updating config:', error);
        req.session.errorMessage = 'Lỗi khi cập nhật cấu hình. Vui lòng thử lại.';
        res.redirect('/admin/config');
    }
});

/**
 * POST /admin/config/reset
 * Reset configuration to defaults
 */
router.post('/reset', async function (req, res) {
    try {
        const defaults = {
            rating_threshold_percent: 80,
            auto_extend_threshold_minutes: 5,
            auto_extend_duration_minutes: 10,
            max_bid_retries: 3,
            session_timeout_hours: 24,
            max_upload_images: 10,
            min_upload_images: 4
        };
        
        await configService.updateMultiple(defaults);
        
        req.session.successMessage = 'Đã khôi phục cấu hình về mặc định!';
        res.redirect('/admin/config');
    } catch (error) {
        console.error('Error resetting config:', error);
        req.session.errorMessage = 'Lỗi khi khôi phục cấu hình. Vui lòng thử lại.';
        res.redirect('/admin/config');
    }
});

export default router;
