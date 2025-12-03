// user.service.js
import db from '../utils/db.js';

export function add(user) {
    return db('users').insert(user);
}

export async function findByEmail(email) {
    const user = await db('users').where('email', email).first();
    
    return user || null;
}

export async function verifyOTP(email, otp) {
    const user = await findByEmail(email);
    if (!user) return false;

    if (user.otp === otp) {
        await db('users')
            .where('email', email)
            .update({ 
                is_verified: true, 
                otp: null
            });
        return true;
    }
    return false;
}

export function findByUsername(username) {
    return db('users').where('username', username).first();
}

export function update(id, user) {
    return db('users').where('id', id).update(user);
}

export async function findById(id) {
    const user = await db('users').where('id', id).first();
    return user || null;
}

export async function isEligibleToBid(id, product) {
    const ratings = db('ratings').where('rated_user_id', id);
    if (!ratings || !Array.isArray(ratings)) {
        return !!product.allow_newbie; 
    }
    const total = ratings.length;
    if (total === 0) {
        return !!product.allow_newbie; 
    }
    const likes = ratings.filter(r => r.score === 1).length;
    const ratio = likes / total;
    return ratio >= 0.8;
}