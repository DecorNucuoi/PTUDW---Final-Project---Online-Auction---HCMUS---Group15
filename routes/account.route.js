import express from 'express';
import bcrypt from 'bcryptjs';
import axios from 'axios';
import nodemailer from 'nodemailer';
import randomstring from 'randomstring';
import { isAuth } from '../middlewares/auth.mdw.js';
import { transporter } from '../utils/mailer.js'; 
import * as userService from '../services/user.service.js';

const router = express.Router();

const RECAPTCHA_SECRET_KEY = '6LdJzh0sAAAAAKEeVW0DC8qe_2pO4T4HRDGdrcWU'; 


router.get('/signup', function(req, res) {
    res.render('vwAccount/signup');
});

router.post('/signup',async function(req, res) {
    const captchaResponse = req.body['g-recaptcha-response'];
    if (!captchaResponse) {
        return res.render('vwAccount/signup', { err_message: 'Please complete the captcha.' });
    }

     try {
        const verifyUrl = `https://www.google.com/recaptcha/api/siteverify?secret=${RECAPTCHA_SECRET_KEY}&response=${captchaResponse}`;
        const response = await axios.post(verifyUrl);
        if (!response.data.success) {
            return res.render('vwAccount/signup', { err_message: 'Captcha verification failed.' });
        }
    } catch (error) {
        return res.render('vwAccount/signup', { err_message: 'Captcha error.' });
    }

    const user = await userService.findByEmail(req.body.email);
    if (user) {
        return res.render('vwAccount/signup', { err_message: 'Email already exists.' });
    }

    const hash = bcrypt.hashSync(req.body.password, 10);
    const otp = randomstring.generate({ length: 6, charset: 'numeric' });
    const otpExpired = new Date(Date.now() + 15 * 60 * 1000);


    const newUser = {
        password: hash,
        full_name: req.body.fullname,
        address: req.body.address,
        email: req.body.email,
        role: 0,
        is_verified: false,
        otp: otp,
        otp_expired: otpExpired
    };

    await userService.add(newUser);

    const mailOptions = {
        from: 'Auction System',
        to: req.body.email,
        subject: 'Verify your account',
        html: `<h3>Your OTP code is: <b>${otp}</b></h3>`
    };

    transporter.sendMail(mailOptions, function(error, info){
        if (error) {
            console.log(error);
            return res.render('vwAccount/signup', { err_message: 'Could not send OTP email.' });
        } else {
            console.log('Email sent: ' + info.response);
            return res.render('vwAccount/otp', { email: req.body.email });
        }
    });
});

router.post('/otp', async function(req, res) {
    const { email, otp } = req.body;
    const result = await userService.verifyOTP(email, otp);
    
    if (result) {
        redirect('/');
        //res.redirect('/account/login');
    } else {
        res.render('vwAccount/otp', { email, err_message: 'Invalid OTP.' });
    }
});

router.get('/signin', function (req, res) {
    res.render('vwAccount/signin');
});

router.post('/signin', async function (req, res) {
    const email = req.body.email;
    const user = await userService.findByEmail(email);
    if (!email) {
        return res.render('vwAccount/signin', { errorMessage: 'Invalid email or password' });
    }
    const password = req.body.password;
    const ret = bcrypt.compareSync(password, user.password);
    if (ret === false) {
        return  res.render('vwAccount/signin', { errorMessage: 'Invalid email or password' });
    } 
    req.session.isAuthenticated = true;
    req.session.authUser = user;
    const retUrl = req.session.retUrl || '/';
    delete req.session.retUrl;
    res.redirect(retUrl);
});

router.post('/signout', function (req, res) {
    req.session.isAuthenticated = false;
    delete req.session.authUser;
    const returnUrl = req.headers.referer || '/';
    res.redirect(returnUrl);
});

router.get('/profile',isAuth, function (req, res) {
    res.render('vwAccount/profile',{ user: req.session.authUser});
});

router.post('/profile',isAuth, async function (req, res) {
    const id = req.body.id;
    const newFullName = req.body.full_name;
    const newEmail = req.body.email;
    const currentEmail = req.session.authUser.email;

    if (newEmail === currentEmail) {
        const user = {
            full_name: newFullName,
        };
        
        await userService.update(id, user);
        
        req.session.authUser.full_name = newFullName;
        
        return res.render('vwAccount/profile', { 
            user: req.session.authUser,
            success_message: 'Profile updated successfully!' 
        });
    }

    const existingUser = await userService.findByEmail(newEmail);
    if (existingUser) {
        return res.render('vwAccount/profile', { 
            user: req.session.authUser,
            err_message: 'Email already exists. Please choose another one.' 
        });
    }

    const otp = randomstring.generate({ length: 6, charset: 'numeric' });

    req.session.tempUpdate = {
        full_name: newFullName,
        email: newEmail,
        otp: otp
    };

    const mailOptions = {
        from: 'Auction System',
        to: newEmail, // Gửi tới email mới
        subject: 'Verify Email Change',
        html: `
            <h3>You requested to change your email.</h3>
            <p>Your OTP code is: <b>${otp}</b></p>
            <p>If you did not request this, please ignore this email.</p>
        `
    };
    
    transporter.sendMail(mailOptions, function(error, info){
        if (error) {
            console.log(error);
            return res.render('vwAccount/profile', { 
                user: req.session.authUser,
                err_message: 'Could not send OTP. Please try again later.' 
            });
        } else {
            console.log('Email sent: ' + info.response);
            // Chuyển sang trang nhập OTP dành riêng cho việc đổi email
            return res.redirect('/account/verify-email-change');
        }
    });
});

router.get('/verify-email-change', isAuth, function(req, res) {
    if (!req.session.tempUpdate) {
        return res.redirect('/account/profile');
    }
    
    res.render('vwAccount/otp-update', { 
        email: req.session.tempUpdate.email 
    });
});

router.post('/verify-email-change', isAuth, async function(req, res) {
    const { otp } = req.body;
    const tempData = req.session.tempUpdate;

    if (!tempData) {
        return res.redirect('/account/profile');
    }

    if (otp === tempData.otp) {
        const id = req.session.authUser.id;

        await userService.update(id, {
            full_name: tempData.full_name,
            email: tempData.email
        });

        req.session.authUser.full_name = tempData.full_name;
        req.session.authUser.email = tempData.email;

        delete req.session.tempUpdate;

        return res.render('vwAccount/profile', { 
            user: req.session.authUser,
            success_message: 'Email updated successfully!' 
        });
    } else {
        return res.render('vwAccount/otp-update', { 
            email: tempData.email, 
            err_message: 'Invalid OTP.' 
        });
    }
});

router.get('/change-password',isAuth , function (req, res) {
    res.render('VwAccount/change-password');
});

router.post('/change-password', isAuth, async function (req, res) {
    const { current_password, new_password, confirm_password } = req.body;
    const userId = req.session.authUser.id;

    const user = await userService.findById(userId);

    const isMatch = bcrypt.compareSync(current_password, user.password);

    if (!isMatch) {
        return res.render('vwAccount/change-password', {
            err_message: 'Current password is incorrect.'
        });
    }

    if (new_password !== confirm_password) {
        return res.render('vwAccount/change-password', {
            err_message: 'New passwords do not match.'
        });
    }

    const newPasswordHash = bcrypt.hashSync(new_password, 10);

    await userService.update(userId, {
        password: newPasswordHash
    });

    res.render('vwAccount/change-password', {
        success_message: 'Password changed successfully!'
    });
});

router.get('/forgot-password', function (req, res) {
    res.render('vwAccount/forgot');
});

router.post('/forgot-password', async function (req, res) {
    const email = req.body.email;
    const user = await userService.findByEmail(email);

    if (!user) {
        return res.render('vwAccount/forgot', { err_message: 'Email does not exist.' });
    }

    const otp = randomstring.generate({ length: 6, charset: 'numeric' });
    await userService.update(user.id, { otp: otp });

    req.session.forgotEmail = email;

    const mailOptions = {
        from: 'Auction System',
        to: email,
        subject: 'Reset Password OTP',
        html: `<h3>Your OTP for password reset is: <b>${otp}</b></h3>`
    };

    transporter.sendMail(mailOptions, function(error, info){
        if (error) {
            console.log(error);
            return res.render('vwAccount/forgot', { err_message: 'Error sending email.' });
        } else {
            res.redirect('/account/forgot-password/otp');
        }
    });
});

router.get('/forgot-password/otp', function (req, res) {
    if (!req.session.forgotEmail) return res.redirect('/account/forgot-password');
    res.render('vwAccount/forgot-otp', { email: req.session.forgotEmail });
});

router.post('/forgot-password/otp', async function (req, res) {
    const email = req.session.forgotEmail;
    const inputOtp = req.body.otp;

    const user = await userService.findByEmail(email);
    
    if (user.otp === inputOtp) {
        req.session.otpVerified = true;
        res.redirect('/account/forgot-password/reset');
    } else {
        res.render('vwAccount/forgot-otp', { 
            email: email, 
            err_message: 'Invalid OTP code.' 
        });
    }
});

router.get('/forgot-password/reset', function (req, res) {
    if (!req.session.forgotEmail || !req.session.otpVerified) {
        return res.redirect('/account/forgot-password');
    }
    res.render('vwAccount/forgot-reset');
});

router.post('/forgot-password/reset', async function (req, res) {
    if (!req.session.forgotEmail || !req.session.otpVerified) {
        return res.redirect('/account/forgot-password');
    }

    const email = req.session.forgotEmail;
    const newPassword = req.body.password;
    
    const hash = bcrypt.hashSync(newPassword, 10);
    
    const user = await userService.findByEmail(email);
    
    await userService.update(user.id, { 
        password: hash,
        otp: null 
    });

    delete req.session.forgotEmail;
    delete req.session.otpVerified;

    res.render('vwAccount/signin', { 
        success_message: 'Password reset successfully! Please login.' 
    });
});

export default router;