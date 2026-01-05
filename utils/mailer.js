import nodemailer from 'nodemailer';
import dotenv from 'dotenv';

// Ensure dotenv is loaded
dotenv.config();

// Debug email config
console.log('📧 Email configuration in mailer.js:');
console.log('   EMAIL_USER:', process.env.EMAIL_USER || 'NOT SET');
console.log('   EMAIL_PASS:', process.env.EMAIL_PASS ? '✓ (length: ' + process.env.EMAIL_PASS.length + ')' : '✗ NOT SET');

export const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: process.env.EMAIL_USER, 
        pass: process.env.EMAIL_PASS     
    }
});