import express from 'express';
import { isAuth } from '../middlewares/auth.mdw.js';
import * as chatService from '../services/chat.service.js';
import * as userService from '../services/user.service.js';
import { sendNewMessageEmail } from '../services/email.service.js';

const router = express.Router();

router.get('/with/:id', isAuth, async function (req, res) {
    const currentUserId = req.session.authUser.id;
    const partnerId = parseInt(req.params.id);
    const referer = req.query.ref; // 'transaction'
    const productId = req.query.productId;

    if (currentUserId === partnerId) {
        return res.redirect('/');
    }

    const partner = await userService.findById(partnerId);
    if (!partner) {
        return res.redirect('/');
    }

    const messages = await chatService.getConversation(currentUserId, partnerId);

    // Format messages
    const formattedMessages = messages.map(m => ({
        ...m,
        isSelf: m.sender_id === currentUserId,
        time: new Date(m.created_at).toLocaleString('vi-VN')
    }));
    
    // Determine back URL
    let backUrl = '/';
    if (referer === 'transaction' && productId) {
        backUrl = `/transaction/${productId}`;
    } else if (req.query.backUrl) {
        backUrl = req.query.backUrl;
    }

    res.render('vwChat/index', {
        partner: partner,
        messages: formattedMessages,
        empty: formattedMessages.length === 0,
        backUrl: backUrl,
        receiverId: partnerId
    });
});

router.post('/send', isAuth, async function (req, res) {
    const senderId = req.session.authUser.id;
    const { receiverId, message, backUrl } = req.body;

    if (message.trim()) {
        await chatService.addMessage(senderId, receiverId, message);
        
        // Send email notification to receiver
        try {
            const sender = await userService.findById(senderId);
            const receiver = await userService.findById(receiverId);
            
            if (receiver && sender) {
                // Truncate message if too long
                const messagePreview = message.length > 200 ? message.substring(0, 200) + '...' : message;
                await sendNewMessageEmail(receiver, sender, messagePreview);
            }
        } catch (emailError) {
            console.error('[CHAT] Email notification error:', emailError);
            // Don't block the chat functionality if email fails
        }
    }
    
    // Preserve backUrl in redirect
    const redirectUrl = backUrl ? `/chat/with/${receiverId}?backUrl=${encodeURIComponent(backUrl)}` : `/chat/with/${receiverId}`;
    res.redirect(redirectUrl);
});

export default router;
