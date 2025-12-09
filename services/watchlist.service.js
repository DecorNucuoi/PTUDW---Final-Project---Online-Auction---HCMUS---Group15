import db from '../utils/db.js';

export async function add(userId, productId) {
    
    const existing = await db('watchlists')
        .where({ user_id: userId, product_id: productId })
        .first();

    if (existing) {
        await db('watchlists')
            .where({ user_id: userId, product_id: productId })
            .del();
        return { action: 'removed' };
    } else {
        await db('watchlists').insert({ user_id: userId, product_id: productId });
        return { action: 'added' };
    }
}