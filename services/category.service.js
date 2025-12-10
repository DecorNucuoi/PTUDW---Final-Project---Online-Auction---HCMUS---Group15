import db from '../utils/db.js';

export function findAll() {
  return db('categories');
}

export function findById(id) {
  return db('categories').where('id', id).first();
}

export function add(entity) {
  return db('categories').insert(entity);
}

export function del(id) {
  return db('categories').where('id', id).del();
}

export function patch(id, entity) {
  return db('categories').where('id', id).update(entity);
}

export function findRootCategories() {
    return db('categories')
        .whereNull('parent_id');
}

export async function countProductsByCatId(catId) {
    const result = await db('products')
        .where('category_id', catId)
        .count('id as total')
        .first();
    
    return Number(result.total || 0);
}

export async function countChildCats(catId) {
    const result = await db('categories')
        .where('parent_id', catId)
        .count('id as total')
        .first();
    return Number(result.total || 0);
}