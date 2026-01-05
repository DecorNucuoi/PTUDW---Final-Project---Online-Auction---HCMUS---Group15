/**
 * Image Configuration & Utilities
 * Centralized image path management to avoid hardcoding
 */

// Base paths configuration
export const IMAGE_CONFIG = {
    // Base URL (can be changed to CDN later)
    BASE_URL: process.env.IMAGE_BASE_URL || '/static/imgs',
    
    // Product images directory
    PRODUCT_DIR: 'sp',
    
    // Payment receipts directory  
    PAYMENT_DIR: 'payments',
    
    // Default/fallback images
    DEFAULT_PRODUCT: 'https://placehold.co/400x300?text=No+Image',
    DEFAULT_THUMBNAIL: 'https://placehold.co/200x200?text=No+Image',
    
    // Image versions
    VERSIONS: {
        THUMBNAIL: 'thumb',
        MEDIUM: 'medium',
        ORIGINAL: 'original'
    }
};

/**
 * Get product image URL
 * @param {number} productId - Product ID
 * @param {string} filename - Image filename (default: 'main_thumbs')
 * @param {string} version - Image version: 'thumb', 'medium', 'original'
 * @param {string} format - Image format: 'webp', 'jpg'
 * @returns {string} Full image URL
 */
export function getProductImageUrl(productId, filename = 'main_thumbs', version = null, format = 'jpg') {
    if (!productId) {
        return IMAGE_CONFIG.DEFAULT_PRODUCT;
    }
    
    const versionSuffix = version ? `-${version}` : '';
    return `${IMAGE_CONFIG.BASE_URL}/${IMAGE_CONFIG.PRODUCT_DIR}/${productId}/${filename}${versionSuffix}.${format}`;
}

/**
 * Get product thumbnail URL with WebP support
 * @param {number} productId - Product ID
 * @param {string} filename - Image filename
 * @returns {object} Object with webp and jpg URLs
 */
export function getProductThumbnail(productId, filename = 'main_thumbs') {
    return {
        webp: getProductImageUrl(productId, filename, 'thumb', 'webp'),
        jpg: getProductImageUrl(productId, filename, 'thumb', 'jpg'),
        fallback: getProductImageUrl(productId, filename, null, 'jpg')
    };
}

/**
 * Get product image directory path
 * @param {number} productId - Product ID
 * @returns {string} Directory path
 */
export function getProductImageDir(productId) {
    return `./static/${IMAGE_CONFIG.PRODUCT_DIR}/${productId}`;
}

/**
 * Get payment receipt URL
 * @param {string} filename - Receipt filename
 * @returns {string} Full receipt URL
 */
export function getPaymentReceiptUrl(filename) {
    if (!filename) return null;
    return `${IMAGE_CONFIG.BASE_URL}/${IMAGE_CONFIG.PAYMENT_DIR}/${filename}`;
}

/**
 * Handlebars helper: Get product image URL
 * Usage: {{productImage id 'main_thumbs' 'thumb' 'webp'}}
 */
export function productImageHelper(productId, filename = 'main_thumbs', version = null, format = 'jpg') {
    return getProductImageUrl(productId, filename, version, format);
}

/**
 * Handlebars helper: Get fallback image URL
 * Usage: {{imageFallback imagePath productId}}
 */
export function imageFallbackHelper(imagePath, productId) {
    // If imagePath exists, use it
    if (imagePath) {
        return imagePath;
    }
    
    // Otherwise, return default product image URL
    return getProductImageUrl(productId, 'main_thumbs', null, 'jpg');
}
