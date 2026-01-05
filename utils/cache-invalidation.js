import { clearCacheByPattern } from './cache.js';

/**
 * Invalidate product-related caches
 * @param {number} productId - Product ID
 */
export function invalidateProductCache(productId) {
    clearCacheByPattern(`product:${productId}:`);
    console.log(`[Cache Invalidation] Product ${productId} caches cleared`);
}

/**
 * Invalidate category caches
 */
export function invalidateCategoryCache() {
    clearCacheByPattern('categories:');
    clearCacheByPattern('megamenu:');
    console.log('[Cache Invalidation] Category caches cleared');
}

/**
 * Invalidate homepage caches
 */
export function invalidateHomepageCache() {
    clearCacheByPattern('homepage:');
    console.log('[Cache Invalidation] Homepage caches cleared');
}

/**
 * Invalidate all product listings
 */
export function invalidateProductListings() {
    clearCacheByPattern('category:');
    clearCacheByPattern('products:');
    console.log('[Cache Invalidation] Product listing caches cleared');
}

/**
 * Cache invalidation handlers for specific events
 */
export const cacheInvalidationHandlers = {
    /**
     * When a bid is placed
     * Invalidates product detail and homepage (top products might change)
     */
    onBidPlaced: (productId) => {
        invalidateProductCache(productId);
        invalidateHomepageCache();
        console.log(`[Event] Bid placed on product ${productId}`);
    },
    
    /**
     * When a new product is created
     * Invalidates homepage and product listings
     */
    onProductCreated: (productId, categoryId) => {
        invalidateHomepageCache();
        invalidateProductListings();
        if (categoryId) {
            clearCacheByPattern(`product:${categoryId}:related`);
        }
        console.log(`[Event] Product ${productId} created`);
    },
    
    /**
     * When a product is updated
     * Invalidates specific product cache
     */
    onProductUpdated: (productId) => {
        invalidateProductCache(productId);
        console.log(`[Event] Product ${productId} updated`);
    },
    
    /**
     * When a category is changed (created, updated, deleted)
     * Invalidates mega menu and category caches
     */
    onCategoryChanged: () => {
        invalidateCategoryCache();
        invalidateProductListings();
        console.log('[Event] Category changed');
    },
    
    /**
     * When an auction ends
     * Invalidates product and homepage caches
     */
    onAuctionEnded: (productId) => {
        invalidateProductCache(productId);
        invalidateHomepageCache();
        console.log(`[Event] Auction ended for product ${productId}`);
    },
    
    /**
     * When a question is added to a product
     * Invalidates product questions cache
     */
    onQuestionAdded: (productId) => {
        clearCacheByPattern(`product:${productId}:questions`);
        console.log(`[Event] Question added to product ${productId}`);
    },
    
    /**
     * When a user is banned from bidding
     * Invalidates product cache
     */
    onBidderBanned: (productId) => {
        invalidateProductCache(productId);
        console.log(`[Event] Bidder banned from product ${productId}`);
    },
    
    /**
     * When product images are updated
     * Invalidates product images cache
     */
    onImagesUpdated: (productId) => {
        clearCacheByPattern(`product:${productId}:images`);
        console.log(`[Event] Images updated for product ${productId}`);
    }
};
