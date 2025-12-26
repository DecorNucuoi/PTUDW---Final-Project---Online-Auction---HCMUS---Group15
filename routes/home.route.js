import express from 'express';
import * as productService from '../services/product.service.js';

const router = express.Router();

// Helper to check if product is newly posted (within 30 minutes)
function isNewlyPosted(createdAt) {
  const now = new Date();
  const created = new Date(createdAt);
  const diffMinutes = (now - created) / (1000 * 60);
  return diffMinutes <= 30; // Within 30 minutes
}

router.get('/', async function(req, res) {
  const top5EndingSoon = await productService.findTop5EndingSoon();
  const top5MostBidded = await productService.findTop5MostBidded();
  const top5HighestPrice = await productService.findTop5HighestPrice();
  
  // Add isNew flag to all products
  const markNew = (products) => products.map(p => ({
    ...p,
    isNew: isNewlyPosted(p.created_at)
  }));
  
  res.render('home', { 
    top5EndingSoon: markNew(top5EndingSoon), 
    top5MostBidded: markNew(top5MostBidded), 
    top5HighestPrice: markNew(top5HighestPrice)
  });
});

export default router;