import express from 'express';
import bcrypt from 'bcryptjs';
import * as userService from '../services/user.service.js';

const router = express.Router();

router.get('/', async function (req, res) {
    const list = await userService.findAll();
    res.render('vwAdminUser/list', { users: list });
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
    res.redirect('/admin/users');
});

router.post('/delete', async function (req, res) {
    await userService.del(req.body.id);
    res.redirect('/admin/users');
});

router.get('/edit/:id', async function (req, res) {
    const user = await userService.findById(req.params.id);
    if (!user) return res.redirect('/admin/users');
    
    res.render('vwAdminUser/edit', { user });
});

router.post('/edit', async function (req, res) {
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
    res.redirect('/admin/users');
});

router.get('/upgrade-requests', async function (req, res) {
    const list = await userService.findPendingUpgradeRequests();
    
    res.render('vwAdminUser/requests', { 
        requests: list, 
        empty: list.length === 0 
    });
});

router.post('/approve', async function (req, res) {
    const { requestId, userId } = req.body;
    
    await userService.approveUpgrade(requestId, userId);
    
    res.redirect('/admin/users/upgrade-requests');
});

router.post('/reject', async function (req, res) {
    const { requestId } = req.body;
    
    await userService.rejectUpgrade(requestId);
    
    res.redirect('/admin/users/upgrade-requests');
});



export default router;