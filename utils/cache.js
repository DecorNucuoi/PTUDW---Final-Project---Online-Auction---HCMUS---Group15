import NodeCache from 'node-cache';

// Create cache instances with different TTLs
export const shortCache = new NodeCache({
    stdTTL: 30,           // 30 seconds
    checkperiod: 60,      // Check for expired keys every 60s
    useClones: false,     // Don't clone objects (better performance)
    deleteOnExpire: true,
    maxKeys: 1000         // Limit cache size
});

export const mediumCache = new NodeCache({
    stdTTL: 300,          // 5 minutes
    checkperiod: 120,
    useClones: false,
    maxKeys: 500
});

export const longCache = new NodeCache({
    stdTTL: 3600,         // 1 hour
    checkperiod: 600,
    useClones: false,
    maxKeys: 100
});

// Cache wrapper with error handling
export async function cacheWrapper(cache, key, ttl, fetchFn) {
    try {
        // Try to get from cache
        const cached = cache.get(key);
        if (cached !== undefined) {
            console.log(`[Cache HIT] ${key}`);
            return cached;
        }

        console.log(`[Cache MISS] ${key}`);
        // Fetch fresh data
        const data = await fetchFn();
        
        // Store in cache
        if (data !== null && data !== undefined) {
            cache.set(key, data, ttl || cache.options.stdTTL);
        }

        return data;
    } catch (error) {
        console.error(`[Cache ERROR] ${key}:`, error.message);
        // Fallback to direct fetch on cache error
        return await fetchFn();
    }
}

// Cache statistics for monitoring
export function getCacheStats() {
    return {
        short: {
            ...shortCache.getStats(),
            keys: shortCache.keys().length
        },
        medium: {
            ...mediumCache.getStats(),
            keys: mediumCache.keys().length
        },
        long: {
            ...longCache.getStats(),
            keys: longCache.keys().length
        }
    };
}

// Clear all caches (useful for admin panel)
export function clearAllCaches() {
    shortCache.flushAll();
    mediumCache.flushAll();
    longCache.flushAll();
    console.log('[Cache] All caches cleared');
    return true;
}

// Clear specific cache keys by pattern
export function clearCacheByPattern(pattern) {
    let totalCleared = 0;
    
    // Clear from all cache instances
    [shortCache, mediumCache, longCache].forEach(cache => {
        const keys = cache.keys();
        const matchedKeys = keys.filter(k => k.includes(pattern));
        cache.del(matchedKeys);
        totalCleared += matchedKeys.length;
    });
    
    console.log(`[Cache] Cleared ${totalCleared} keys matching: ${pattern}`);
    return totalCleared;
}

// Get all cache keys (for debugging)
export function getAllCacheKeys() {
    return {
        short: shortCache.keys(),
        medium: mediumCache.keys(),
        long: longCache.keys()
    };
}
