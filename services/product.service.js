import db from '../utils/db.js';

export function findAll() {
  return db('ptoducts');
}

export function findTop5EndingSoon() {
    const list = db('products')
        .where('end_time', '>', new Date())
        .andWhere('status', 1)
        .orderBy('end_time', 'asc')
        .limit(5);
    return list;
}

export function findTop5MostBidded() {
    const list = db('products')
        .select('products.*')
        .count('bids.id as bid_count')
        .leftJoin('bids', 'products.id', 'bids.product_id')
        .where('products.status', 1)
        .andWhere('products.end_time', '>', new Date())
        .groupBy('products.id')
        .orderBy('bid_count', 'desc')
        .limit(5);
    return list;
}

export async function findTop5HighestPrice() {
    const list = db('products')
        .where('status', 1)
        .andWhere('end_time', '>', new Date())
        .orderBy('current_price', 'desc')
        .limit(5);
    return list;
}

export function findByCat(category_id) {
    const list = db('products')
    .where('category_id', category_id)
    .andWhere('status', 1)
    .andWhere('end_time', '>', new Date());
    return list;
}

async function getCategoryIds(catId) {
    catId = Number(catId);  
    const subs = db('categories').where('parent_id', catId).select('id');
    let subIds = [];
    if (Array.isArray(subs)) {
        subIds = subs.map(item => item.id);
    }
    const listId = [catId, ...subIds];
    return listId;
}

export async function countByCat(catId) {
    const listId = getCategoryIds(catId);

    const list = db('products')
        .whereIn('category_id', listId)
        .andWhere('status', 1)
        .count({ amount: 'id' })
        .first();
    
    return list ? list.amount : 0;
}

export async function findPageByCat(catId, limit, offset) {
    const listId = await getCategoryIds(catId);

    const list = await db('products')
        .whereIn('category_id', listId)
        .andWhere('status', 1)
        .limit(limit)
        .offset(offset);

    if (!list || !Array.isArray(list)) {
        return [];
    }

    return list.map(item => ({
        ...item,
        imagePath: `/static/imgs/sp/${item.id}/main_thumbs.jpg`
    }));
}


export async function search(keyword, catId, sortType, limit, offset) {
    const query = db('products')
        .select(
            'products.*',
            'users.full_name as bidder_name',
            db.raw('COUNT(bids.id) as bid_count')
        )
        .leftJoin('users', 'products.winner_id', 'users.id')
        .leftJoin('bids', 'products.id', 'bids.product_id')
        .where('products.status', 1)
        .groupBy('products.id', 'users.full_name');

    if (keyword) {
        query.whereRaw("to_tsvector('simple', products.name) @@ plainto_tsquery('simple', ?)", [keyword]);
    }

    if (catId > 0) {
        query.where('products.category_id', catId);
    }

    if (sortType === 'price_asc') {
        query.orderBy('products.current_price', 'asc'); // Giá tăng dần
    } else {
        query.orderBy('products.end_time', 'desc');
    }

    const products = await query.clone().limit(limit).offset(offset);

    const totalResult = await db.from(function() {
        this.select('products.id')
            .from('products')
            .leftJoin('users', 'products.winner_id', 'users.id')
            .where('products.status', 1)
            .modify((qb) => {
                if (keyword) qb.whereRaw("to_tsvector('simple', name) @@ plainto_tsquery('simple', ?)", [keyword]);
                if (catId > 0) qb.where('category_id', catId);
            })
            .as('t')
    }).count('* as total').first();

    return {
        products: products,
        total: totalResult.total
    };
}

async function getRatingPoint(userId) {
    const result = db('ratings')
        .where('rated_user_id', userId)
        .sum('score as total_score')
        .first();
    return result.total_score || 0; 
}


export async function findDetailById(id) {
    const product = await db('products').where('id', id).first(); 
    
    if (!product) return null;

    const seller = await db('users').where('id', product.seller_id).first();
    const sellerPoint = await getRatingPoint(product.seller_id); 

    let winner = null;
    let winnerPoint = 0;
    
    if (product.winner_id) {
        winner = await db('users').where('id', product.winner_id).first();
        winnerPoint = await getRatingPoint(product.winner_id);
    }

    return {
        ...product,
        seller_name: seller ? seller.full_name : 'Unknown',
        seller_point: sellerPoint,
        winner_name: winner ? winner.full_name : null,
        winner_point: winnerPoint
    };
}

export async function findRelated(catId, currentId) {
    const list = db('products')
        .where('category_id', catId)
        .whereNot('id', currentId) 
        .where('status', 1)
        .limit(5)
        .orderBy('end_time', 'asc'); 
    return list;
}

export async function findQuestions(productId) {
    return db('questions')
        .join('users', 'questions.user_id', 'users.id')
        .where('product_id', productId)
        .select('questions.*', 'users.full_name as asker_name')
        .orderBy('created_at', 'desc');
}


export async function placeBid(productId, bidderId, price) {
    return db.transaction(async trx => {
        
        await trx('bids').insert({
            product_id: productId,
            bidder_id: bidderId,
            price: price,
            max_price: price,
            status: 1,
            created_at: new Date()
        });
        
        await trx('products')
            .where('id', productId)
            .update({
                current_price: price,
                winner_id: bidderId,
        });
    });
}

export async function findBidHistory(productId) {
    return db('bids')
        .join('users', 'bids.bidder_id', 'users.id')
        .where('product_id', productId)
        .select('bids.*', 'users.full_name')
        .orderBy('price', 'desc');
}

export async function addQuestion(entity) {
    return db('questions').insert(entity);
}

export async function add(entity) {
    const [id] = await db('products').insert(entity).returning('id');
    return id;
}

export async function findBySeller(sellerId) {
    return db('products')
        .leftJoin('users', 'products.winner_id', 'users.id')
        .where('products.seller_id', sellerId)
        .select('products.*', 'users.full_name as winner_name')
        .orderBy('products.created_at', 'desc');
}

export async function appendDescription(productId, newContent) {
    const product = await db('products').where('id', productId).select('description').first();
    const oldDescription = product.description || '';

    const date = new Date().toLocaleString('vi-VN');
    const timeHeader = `
        <div style="margin-top: 20px; border-top: 1px dashed #ccc; padding-top: 10px;">
            <p>
                <span style="background-color: #fff3cd; padding: 5px 10px; border-radius: 5px; font-weight: bold;">
                    ✏️ Cập nhật ngày: ${date}
                </span>
            </p>
        </div>
    `;

    const finalDescription = oldDescription + timeHeader + newContent;

    return db('products').where('id', productId).update({
        description: finalDescription
    });
}

export async function banBidder(productId, bidderId) {
    return db.transaction(async trx => {
        await trx('bids')
            .where({ product_id: productId, bidder_id: bidderId })
            .update({ status: 0 });

        const newWinner = await trx('bids')
            .where({ product_id: productId, status: 1 })
            .orderBy('price', 'desc')
            .first();

        if (newWinner) {
            await trx('products')
                .where('id', productId)
                .update({
                    winner_id: newWinner.bidder_id,
                    current_price: newWinner.price
                });
        } else {
            const product = await trx('products').where('id', productId).select('start_price').first();
            
            await trx('products')
                .where('id', productId)
                .update({
                    winner_id: null,
                    current_price: product.start_price
                });
        }
    });
}

export async function isBanned(productId, userId) {
    const bannedBid = await db('bids')
        .where({ product_id: productId, bidder_id: userId, status: 0 })
        .first();
    return !!bannedBid;
}

export async function answerQuestion(questionId, answerContent) {
    return db('questions')
        .where('id', questionId)
        .update({
            answer: answerContent
        });
}