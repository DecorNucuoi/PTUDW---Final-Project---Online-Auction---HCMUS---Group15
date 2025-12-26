import express from 'express';
import bcrypt from 'bcryptjs';
import * as userService from '../services/user.service.js';
import { sendUpgradeApprovedEmail, sendUpgradeRejectedEmail } from '../services/email.service.js';

const router = express.Router();

router.get('/', async function (req, res) {
    const list = await userService.findAll();
    res.render('vwAdminUser/list', { 
        users: list
    });
});

router.get('/detail/:id', async function (req, res) {
    const user = await userService.findById(req.params.id);
    if (!user) return res.redirect('/admin/users');
    
    res.render('vwAdminUser/detail', { user });
});

router.get('/add', function (req, res) {
    res.render('vwAdminUser/add');
});

router.post('/add', async function (req, res) {
    try {
        const rawPassword = req.body.password;
        const hash = bcrypt.hashSync(rawPassword, 10);

        const entity = {
            email: req.body.email,
            password: hash,
            full_name: req.body.full_name,
            role: parseInt(req.body.role),
            address: req.body.address,
            created_at: new Date(),
            is_verified: true
        };

        await userService.add(entity);
        
        const roleNames = { 0: 'Admin', 1: 'Bidder', 2: 'Seller' };
        req.session.successMessage = `Đã thêm người dùng "${entity.full_name}" (${roleNames[entity.role]}) thành công!`;
        res.redirect('/admin/users');
    } catch (error) {
        console.error('Error adding user:', error);
        req.session.errorMessage = 'Lỗi hệ thống khi thêm người dùng. Email có thể đã tồn tại!';
        res.redirect('/admin/users/add');
    }
});

router.post('/delete', async function (req, res) {
    try {
        const userId = req.body.id;
        
        // Get user info before deletion
        const user = await userService.findById(userId);
        if (!user) {
            req.session.errorMessage = 'Không tìm thấy người dùng cần xóa!';
            return res.redirect('/admin/users');
        }
        
        await userService.del(userId);
        
        req.session.successMessage = `Đã xóa người dùng "${user.full_name}" (${user.email}) thành công!`;
        res.redirect('/admin/users');
    } catch (error) {
        console.error('Error deleting user:', error);
        req.session.errorMessage = 'Lỗi hệ thống khi xóa người dùng. Vui lòng thử lại!';
        res.redirect('/admin/users');
    }
});

router.get('/edit/:id', async function (req, res) {
    const user = await userService.findById(req.params.id);
    if (!user) return res.redirect('/admin/users');
    
    res.render('vwAdminUser/edit', { user });
});

router.post('/edit', async function (req, res) {
    try {
        const id = req.body.id;
        
        const entity = {
            full_name: req.body.full_name,
            email: req.body.email,
            role: parseInt(req.body.role),
            address: req.body.address
        };

        if (req.body.new_password) {
            entity.password = bcrypt.hashSync(req.body.new_password, 10);
        }

        await userService.patch(id, entity);
        
        const passwordChanged = req.body.new_password ? ' (đã đổi mật khẩu)' : '';
        req.session.successMessage = `Đã cập nhật thông tin người dùng "${entity.full_name}"${passwordChanged}!`;
        res.redirect('/admin/users');
    } catch (error) {
        console.error('Error editing user:', error);
        req.session.errorMessage = 'Lỗi hệ thống khi cập nhật người dùng. Email có thể đã tồn tại!';
        res.redirect(`/admin/users/edit/${req.body.id}`);
    }
});

router.get('/upgrade-requests', async function (req, res) {
    const list = await userService.findPendingUpgradeRequests();
    
    res.render('vwAdminUser/requests', { 
        requests: list, 
        empty: list.length === 0
    });
});

router.post('/approve', async function (req, res) {
    try {
        const { requestId, userId } = req.body;
        
        // Get user info before approval
        const user = await userService.findById(userId);
        if (!user) {
            req.session.errorMessage = 'Không tìm thấy người dùng!';
            return res.redirect('/admin/users/upgrade-requests');
        }
        
        await userService.approveUpgrade(requestId, userId);
        
        // Send email notification
        try {
            await sendUpgradeApprovedEmail(user);
        } catch (emailError) {
            console.error('[ADMIN] Email notification error:', emailError);
            // Don't block the approval if email fails
        }
        
        req.session.successMessage = `Đã duyệt yêu cầu nâng cấp của "${user.full_name}" (${user.email}) thành Seller thành công và đã gửi email thông báo!`;
        res.redirect('/admin/users/upgrade-requests');
    } catch (error) {
        console.error('Error approving upgrade:', error);
        req.session.errorMessage = 'Lỗi hệ thống khi duyệt yêu cầu. Vui lòng thử lại!';
        res.redirect('/admin/users/upgrade-requests');
    }
});

router.post('/reject', async function (req, res) {
    try {
        const { requestId, userId, reason } = req.body;
        
        // Get user info before rejection
        const user = userId ? await userService.findById(userId) : null;
        
        await userService.rejectUpgrade(requestId);
        
        // Send email notification
        if (user) {
            try {
                await sendUpgradeRejectedEmail(user, reason || 'Không được cung cấp');
            } catch (emailError) {
                console.error('[ADMIN] Email notification error:', emailError);
            }
        }
        
        req.session.successMessage = 'Đã từ chối yêu cầu nâng cấp và gửi email thông báo!';
        res.redirect('/admin/users/upgrade-requests');
    } catch (error) {
        console.error('Error rejecting upgrade:', error);
        req.session.errorMessage = 'Lỗi hệ thống khi từ chối yêu cầu. Vui lòng thử lại!';
        res.redirect('/admin/users/upgrade-requests');
    }
});



export default router;