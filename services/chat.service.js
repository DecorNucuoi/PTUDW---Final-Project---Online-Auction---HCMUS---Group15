import db from '../utils/db.js';

export async function addMessage(senderId, receiverId, message) {
    return db('messages').insert({
        sender_id: senderId,
        receiver_id: receiverId,
        message: message,
        transaction_id: null  // NULL for general chat
    });
}

export async function getConversation(user1, user2) {
    return db('messages')
        .where(function () {
            this.where('sender_id', user1).andWhere('receiver_id', user2)
        })
        .orWhere(function () {
            this.where('sender_id', user2).andWhere('receiver_id', user1)
        })
        .whereNull('transaction_id')  // Only general chat messages
        .orderBy('created_at', 'asc');
}

export async function getRecentChats(userId) {
    // Complex query to get last message for each conversation
    // Simplified: Just get list of users communicated with
    const sent = await db('messages').distinct('receiver_id').where('sender_id', userId).whereNull('transaction_id');
    const received = await db('messages').distinct('sender_id').where('receiver_id', userId).whereNull('transaction_id');

    const userIds = new Set([
        ...sent.map(x => x.receiver_id),
        ...received.map(x => x.sender_id)
    ]);

    // Fetch user details not implemented for overview yet due to time
    return Array.from(userIds);
}
