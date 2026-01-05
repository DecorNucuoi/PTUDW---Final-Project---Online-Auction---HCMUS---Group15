import 'dotenv/config'
import express from 'express';
import { engine } from 'express-handlebars';
import expressHandlebarsSections from 'express-handlebars-sections';
import session from 'express-session';
import categoryRouter from './routes/category.route.js';
import accountRouter from './routes/account.route.js';
import productRouter from './routes/product.route.js';
import homeRouter from './routes/home.route.js';
import watchlistRouter from './routes/watchlist.route.js';
import adminRouter from './routes/admin.route.js';
import adminCategoryRouter from './routes/admin-category.route.js';
import adminProductRouter from './routes/admin-product.route.js';
import adminUserRouter from './routes/admin-user.route.js';
import adminConfigRouter from './routes/admin-config.route.js';
import chatRouter from './routes/chat.route.js';
import transactionRouter from './routes/transaction.route.js';
import * as categoryService from './services/category.service.js';
import { isAuth, isAdmin } from "./middlewares/auth.mdw.js";
import { attachRoleInfo } from "./middlewares/role.mdw.js";
import { performanceMonitoring } from "./middlewares/performance.mdw.js";
import db from './utils/db.js';
import { transporter } from './utils/mailer.js';
import * as emailService from './services/email.service.js';
import { longCache, cacheWrapper } from './utils/cache.js';
import compression from 'compression';
import { productImageHelper, imageFallbackHelper } from './utils/image-config.js';

const app = express();

const PORT = process.env.PORT || 3000;

// ✅ OPTIMIZED: Performance monitoring (must be early in chain)
app.use(performanceMonitoring);

// ✅ OPTIMIZED: Add gzip compression middleware
app.use(compression({
    level: 6,          // Compression level (0-9, 6 is good balance)
    threshold: 1024,   // Only compress responses > 1KB
    filter: (req, res) => {
        // Don't compress if client explicitly requests no compression
        if (req.headers['x-no-compression']) {
            return false;
        }
        // Use default filter function
        return compression.filter(req, res);
    }
}));

// ✅ OPTIMIZED: Add request timeout protection (30s limit)
app.use((req, res, next) => {
  // Set timeout to 30 seconds
  req.setTimeout(30000);
  res.setTimeout(30000);
  
  // Handle timeout
  req.on('timeout', () => {
    console.error('[Timeout] Request timeout:', req.method, req.url);
    if (!res.headersSent) {
      res.status(408).send('Request timeout');
    }
  });
  
  next();
});

app.set('trust proxy', 1)
app.use(session({
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false }
}));

app.engine('handlebars', engine({
  helpers: {
    format_currency(value) {
      if (!value && value !== 0) return '0';
      return new Intl.NumberFormat('vi-VN').format(value);
    },
    format_number(value) {
      if (!value && value !== 0) return '0';
      return new Intl.NumberFormat('vi-VN').format(value);
    },
    format_price_usd(value) {
      if (!value && value !== 0) return '$0';
      return '$' + new Intl.NumberFormat('en-US').format(value);
    },
    calculate_rating_percentage: function (rating_score, rating_count) {
      if (!rating_count || rating_count === 0) return 0;
      // Công thức: positive_count = (rating_score + rating_count) / 2
      // percentage = (positive_count / rating_count) * 100
      const positiveCount = (rating_score + rating_count) / 2;
      const percentage = (positiveCount / rating_count) * 100;
      return Math.round(percentage);
    },
    section: expressHandlebarsSections(),
    eq: function (a, b) {
      return a === b;
    },
    isEqual: function (a, b) {
      return a === b;
    },
    isNotEqual: function (a, b) {
      return a !== b;
    },
    and: function (a, b) {
      return a && b;
    },
    or: function (a, b) {
      return a || b;
    },
    not: function (value) {
      return !value;
    },
    gt: function (a, b) {
      return a > b;
    },
    gte: function (a, b) {
      return a >= b;
    },
    subtract: function (a, b) {
      return a - b;
    },
    lt: function (a, b) {
      return a < b;
    },
    lte: function (a, b) {
      return a <= b;
    },
    addOne: function (value) {
      return value + 1;
    },
    // ✅ OPTIMIZED: Centralized image path helpers (no hardcoding)
    productImage: productImageHelper,
    imageFallback: imageFallbackHelper,
    hasSubcategories: function (parentId, categories) {
      if (!parentId || !categories || !Array.isArray(categories)) return false;
      const numParentId = parseInt(parentId);
      if (isNaN(numParentId)) return false;
      return categories.some(cat => cat.parent_id === numParentId);
    },
    format_remainingTime: function (endDate) {
      const now = new Date();
      const end = new Date(endDate);
      const diff = end - now;

      const days = Math.floor(diff / (1000 * 60 * 60 * 24));
      const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));

      if (diff <= 0) {
        return "Ended";
      } else if (days > 0) {
        return `${days}d ${hours}h`;
      } else if (hours > 0) {
        return `${hours}h ${minutes}m`;
      } else {
        return `${minutes}m`;
      }
    },
    isEndingSoon: function (endDate) {
      const now = new Date();
      const end = new Date(endDate);
      const diff = end - now;
      return diff > 0 && diff <= 24 * 60 * 60 * 1000; // 24 hours
    },
    json: function (context) {
      return JSON.stringify(context);
    }
  }
}));

app.set('view engine', 'handlebars');
app.set('views', './views');

app.use('/static', express.static('static'));
app.use(express.urlencoded({ extended: true }));

// Attach role information to all views
app.use(attachRoleInfo);

// Flash messages middleware
app.use(function(req, res, next) {
  if (req.session.successMessage) {
    res.locals.successMessage = req.session.successMessage;
    delete req.session.successMessage;
  }
  if (req.session.errorMessage) {
    res.locals.errorMessage = req.session.errorMessage;
    delete req.session.errorMessage;
  }
  next();
});

// ✅ OPTIMIZED: Cache mega menu data (eliminate ~200 queries/s)
app.use(async function (req, res, next) {
  try {
    // Cache categories for 5 minutes
    const list = await cacheWrapper(
      longCache,
      'categories:all',
      300,
      () => categoryService.findAll()
    );

    // Cache mega menu for 5 minutes
    const megaMenuData = await cacheWrapper(
      longCache,
      'megamenu:structure',
      300,
      () => categoryService.buildMegaMenuStructure()
    );

    res.locals.lcCategories = list;
    res.locals.megaMenuCategories = megaMenuData;
    next();
  } catch (error) {
    console.error('[Middleware] Category loading error:', error);
    // Fallback to empty arrays on error
    res.locals.lcCategories = [];
    res.locals.megaMenuCategories = [];
    next();
  }
});

app.use('/categories', categoryRouter);
app.use('/account', accountRouter);
app.use('/products', productRouter);
app.use('/watchlist', watchlistRouter);
app.use('/transaction', transactionRouter);
app.use('/admin/categories', isAuth, isAdmin, adminCategoryRouter);
app.use('/admin/products', isAuth, isAdmin, adminProductRouter);
app.use('/admin/users', isAuth, isAdmin, adminUserRouter);
app.use('/admin/config', isAuth, isAdmin, adminConfigRouter);
app.use('/admin', isAuth, isAdmin, adminRouter); // Dashboard - must be last
app.use('/chat', isAuth, chatRouter);
app.use('/', homeRouter);

// Cron job: Tự động kết thúc đấu giá hết hạn
async function endExpiredAuctions() {
  try {
    const now = new Date();
    
    // Find all active products where end_time has passed
    const expiredProducts = await db('products')
      .leftJoin('users as winner', 'products.winner_id', 'winner.id')
      .leftJoin('users as seller', 'products.seller_id', 'seller.id')
      .where('products.status', 1)
      .where('products.end_time', '<', now)
      .select(
        'products.id', 
        'products.name', 
        'products.winner_id', 
        'products.seller_id',
        'products.current_price',
        'products.start_price',
        'winner.email as winner_email',
        'winner.full_name as winner_name',
        'seller.email as seller_email',
        'seller.full_name as seller_name'
      );
    
    if (expiredProducts.length > 0) {
      console.log(`\n[CRON] ${new Date().toISOString()} - Found ${expiredProducts.length} expired auction(s). Processing...`);
      
      for (const product of expiredProducts) {
        try {
          // Update product status to ended (status = 2)
          await db('products')
            .where('id', product.id)
            .update({
              status: 2
            });
          
          console.log(`[CRON] ✓ Product #${product.id} status updated to ENDED`);
          
          // Prepare winner and seller objects for email service
          const winner = product.winner_id ? {
            id: product.winner_id,
            email: product.winner_email,
            full_name: product.winner_name
          } : null;
          
          const seller = {
            id: product.seller_id,
            email: product.seller_email,
            full_name: product.seller_name
          };
          
          // Send emails using email service
          const emailResults = await emailService.processAuctionEnd(product, winner, seller);
          
          // Log results
          if (winner) {
            console.log(`[CRON] Product #${product.id} - Winner: ${winner.full_name} - Email: ${emailResults.winnerEmailSent ? '✓' : '✗'}`);
          } else {
            console.log(`[CRON] Product #${product.id} - No winner`);
          }
          console.log(`[CRON] Product #${product.id} - Seller email: ${emailResults.sellerEmailSent ? '✓' : '✗'}`);
          
        } catch (productError) {
          console.error(`[CRON] ✗ Error processing product #${product.id}:`, productError.message);
        }
      }
      
      console.log(`[CRON] Finished processing ${expiredProducts.length} auction(s)\n`);
    }
  } catch (error) {
    console.error('[CRON] ✗ Error in endExpiredAuctions:', error.message);
  }
}

// Run cron job every minute
setInterval(endExpiredAuctions, 60 * 1000);

// Run once on startup
console.log('[CRON] Starting auction ending cron job...');
endExpiredAuctions();

app.listen(PORT, () => {
  console.log(`\n🚀 Server is running on http://localhost:${PORT}`);
  console.log(`⏰ Auction ending cron job is active (runs every 60 seconds)`);
  console.log(`📧 Email notifications enabled\n`);
});
