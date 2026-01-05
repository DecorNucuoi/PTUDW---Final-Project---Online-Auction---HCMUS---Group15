/**
 * Performance Monitoring Middleware
 * Tracks request timing and logs slow requests
 */

export function performanceMonitoring(req, res, next) {
    const start = Date.now();
    
    // Track response time
    res.on('finish', () => {
        const duration = Date.now() - start;
        const method = req.method;
        const url = req.originalUrl;
        const status = res.statusCode;
        
        // Log slow requests (>1000ms)
        if (duration > 1000) {
            console.warn(`[Performance] ⚠️ SLOW ${method} ${url} - ${duration}ms - ${status}`);
        }
        
        // Log very slow requests (>3000ms)
        if (duration > 3000) {
            console.error(`[Performance] 🔴 VERY SLOW ${method} ${url} - ${duration}ms - ${status}`);
        }
        
        // Log all requests in development (optional)
        if (process.env.NODE_ENV === 'development' && duration > 500) {
            console.log(`[Performance] ${method} ${url} - ${duration}ms - ${status}`);
        }
    });
    
    next();
}
