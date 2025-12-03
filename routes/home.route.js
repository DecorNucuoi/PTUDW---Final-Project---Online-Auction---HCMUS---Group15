import express from 'express';
import * as productService from '../services/product.service.js';

const router = express.Router();

router.get('/', async function(req, res) {
  const top5EndingSoon = await productService.findTop5EndingSoon();
  const top5MostBidded = await productService.findTop5MostBidded();
  const top5HighestPrice = await productService.findTop5HighestPrice();
  res.render('home', { top5EndingSoon, top5MostBidded, top5HighestPrice });
});

export default router;