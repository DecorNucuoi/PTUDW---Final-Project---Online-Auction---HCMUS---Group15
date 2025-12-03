import express from 'express';
import * as categoryService from '../services/category.service.js';

const router = express.Router();

router.get('/', async function(req, res) {
  const list = await categoryService.findAll();
  console.log(list);
});

export default router;