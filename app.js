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
import * as categoryService from './services/category.service.js';
import { isAuth , isAdmin} from "./middlewares/auth.mdw.js";

const app = express();

const PORT = process.env.PORT || 3000;

app.set('trust proxy', 1) // trust first proxy
app.use(session({
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false }
}));

app.engine('handlebars', engine({helpers: {
    format_currency(value) {
      return new Intl.NumberFormat('en-US').format(value);
    },
    section: expressHandlebarsSections(),
    isEqual: function (a, b) {
      return a === b;
    },
    format_remainingTime: function (endDate) {
      const now = new Date();
      const end = new Date(endDate);
      const diff = end - now;

      const days = Math.floor(diff / (1000 * 60 * 60 * 24));
      const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));

      if (days > 0) {
        return `${days} days ${hours} hours`;
      } else if (hours > 0) {
        return `${hours} hours ${minutes} minutes`;
      } else {
        return `${minutes} minutes`;
      }
    }
}}));

app.set('view engine', 'handlebars');
app.set('views', './views');

app.use('/static', express.static('static'));
app.use(express.urlencoded({ extended: true }));

app.use(async function (req, res, next) {
  res.locals.isAuthenticated = req.session.isAuthenticated;
  res.locals.authUser = req.session.authUser;
  next();
});   

app.use(async function(req, res, next) {
  const list = await categoryService.findAll();
  res.locals.lcCategories = list;
  next();
});

app.use('/categories', categoryRouter);
app.use('/account', accountRouter);
app.use('/products', productRouter);
app.use('/watchlist', watchlistRouter);
app.use('/', homeRouter);

app.listen(3000, () => {
  console.log("Server is running on port http://localhost:3000");
});
