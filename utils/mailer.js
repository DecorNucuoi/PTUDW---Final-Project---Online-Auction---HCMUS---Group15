import nodemailer from 'nodemailer';

export const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: '<YOUR_EMAIL>gmail.com', 
        pass: '<YOUR_APPLICATION_PASSWORD>'     
    }

});
