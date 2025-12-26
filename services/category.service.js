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

/**
 * Find all products in a category
 * @param {number} catId - Category ID
 * @returns {Promise<Array>} Array of products
 */
export async function findProductsByCatId(catId) {
    return db('products')
        .where('category_id', catId)
        .orderBy('created_at', 'desc');
}

export async function countChildCats(catId) {
    const result = await db('categories')
        .where('parent_id', catId)
        .count('id as total')
        .first();
    return Number(result.total || 0);
}

export async function findSubcategories(parentId) {
    return db('categories')
        .where('parent_id', parentId)
        .orderBy('name');
}

export async function buildMegaMenuStructure() {
    try {
        const allCategories = await db('categories').orderBy('name');
        
        // Get product counts for all categories in one query
        const productCounts = await db('products')
            .select('category_id')
            .count('id as count')
            .groupBy('category_id');
        
        // Create a map for quick lookup
        const countMap = {};
        productCounts.forEach(item => {
            countMap[item.category_id] = Number(item.count || 0);
        });
        
        // Build hierarchical structure
        const rootCategories = allCategories.filter(cat => !cat.parent_id);
        const megaMenuData = [];
        
        for (const rootCat of rootCategories) {
            const subcategories = allCategories.filter(cat => cat.parent_id === rootCat.id);
            
            // Get product count for root category
            const productCount = countMap[rootCat.id] || 0;
            
            // Group subcategories into columns (max 4 columns for mega menu)
            const subcatColumns = [];
            if (subcategories.length > 0) {
                const itemsPerColumn = Math.ceil(subcategories.length / Math.min(4, subcategories.length));
                
                for (let i = 0; i < subcategories.length; i += itemsPerColumn) {
                    const column = subcategories.slice(i, i + itemsPerColumn);
                    // Add product count for each subcategory
                    column.forEach(subcat => {
                        subcat.productCount = countMap[subcat.id] || 0;
                    });
                    subcatColumns.push(column);
                }
            }
            
            megaMenuData.push({
                ...rootCat,
                productCount,
                subcategoriesColumns: subcatColumns,
                hasSubcategories: subcategories.length > 0
            });
        }
        
        return megaMenuData;
    } catch (error) {
        console.error('Error building mega menu structure:', error);
        return []; // Return empty array on error
    }
}

export async function getCategoriesWithHierarchy() {
    const allCategories = await db('categories').orderBy('name');
    
    // Create a map for quick lookup
    const categoryMap = {};
    allCategories.forEach(cat => {
        categoryMap[cat.id] = { ...cat, children: [] };
    });
    
    // Build the hierarchy
    const rootCategories = [];
    allCategories.forEach(cat => {
        if (cat.parent_id) {
            if (categoryMap[cat.parent_id]) {
                categoryMap[cat.parent_id].children.push(categoryMap[cat.id]);
            }
        } else {
            rootCategories.push(categoryMap[cat.id]);
        }
    });
    
    return rootCategories;
}