import nodemailer from 'nodemailer';

export const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: 'anhhao.200550@gmail.com', 
        pass: 'lzde klzz njqq qrrk'     
    }
});