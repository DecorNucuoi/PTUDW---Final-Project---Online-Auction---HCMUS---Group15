import express from 'express';
import * as productService from '../services/product.service.js';
import { shortCache, cacheWrapper } from '../utils/cache.js';

const router = express.Router();

// Helper to check if product is newly posted (within 30 minutes)
function isNewlyPosted(createdAt) {
  const now = new Date();
  const created = new Date(createdAt);
  const diffMinutes = (now - created) / (1000 * 60);
  return diffMinutes <= 30; // Within 30 minutes
}

router.get('/', async function(req, res) {
  try {
    // ✅ OPTIMIZED: Cache homepage data for 30 seconds
    const homepageData = await cacheWrapper(
      shortCache,
      'homepage:top5',
      30,
      async () => {
        const [top5EndingSoon, top5MostBidded, top5HighestPrice] = 
          await Promise.all([
            productService.findTop5EndingSoon(),
            productService.findTop5MostBidded(),
            productService.findTop5HighestPrice()
          ]);
        
        return { top5EndingSoon, top5MostBidded, top5HighestPrice };
      }
    );
    
    // Add isNew flag to all products
    const markNew = (products) => products.map(p => ({
      ...p,
      isNew: isNewlyPosted(p.created_at)
    }));
    
    res.render('home', { 
      top5EndingSoon: markNew(homepageData.top5EndingSoon), 
      top5MostBidded: markNew(homepageData.top5MostBidded), 
      top5HighestPrice: markNew(homepageData.top5HighestPrice)
    });
  } catch (error) {
    console.error('[Homepage] Error loading data:', error);
    res.status(500).render('error', { 
      message: 'Failed to load homepage. Please try again later.' 
    });
  }
});

export default router;