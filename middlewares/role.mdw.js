// Middleware phân quyền chi tiết theo đề bài

// Allow guest (anyone can access)
export function allowGuest(req, res, next) {
    // Always allow
    next();
}

// Require authenticated user (any role)
export function requireAuth(req, res, next) {
    if (!req.session.isAuthenticated) {
        return res.redirect('/account/signin?retUrl=' + encodeURIComponent(req.originalUrl));
    }
    next();
}

// Check if user is bidder (role = 0)
export function isBidder(req, res, next) {
    if (!req.session.isAuthenticated) {
        return res.redirect('/account/signin');
    }
    if (req.session.authUser.role !== 0) {
        return res.status(403).send('Chỉ Bidder mới được truy cập trang này!');
    }
    next();
}

// Check if user is bidder or seller (role = 0 or 1) - Cho bid
export function isBidderOrSeller(req, res, next) {
    if (!req.session.isAuthenticated) {
        return res.redirect('/account/signin');
    }
    if (req.session.authUser.role !== 0 && req.session.authUser.role !== 1) {
        return res.status(403).send('Chỉ Bidder hoặc Seller mới được đấu giá!');
    }
    next();
}

// Check if user is seller (role = 1)
export function isSeller(req, res, next) {
    if (!req.session.isAuthenticated) {
        return res.redirect('/account/signin');
    }
    if (req.session.authUser.role !== 1) {
        return res.status(403).send('Chỉ Seller mới được truy cập trang này!');
    }
    next();
}

// Check if user is at least seller (role >= 1) - Seller hoặc Admin
export function isAtLeastSeller(req, res, next) {
    if (!req.session.isAuthenticated) {
        return res.redirect('/account/signin');
    }
    if (req.session.authUser.role < 1) {
        return res.status(403).send('Bạn cần quyền Seller để truy cập!');
    }
    next();
}

// Check if user is admin (role = 2)
export function isAdmin(req, res, next) {
    if (!req.session.isAuthenticated) {
        return res.redirect('/account/signin');
    }
    if (req.session.authUser.role !== 2) {
        return res.status(403).send('Chỉ Admin mới được truy cập trang này!');
    }
    next();
}

// Middleware để pass thông tin role vào views
export function attachRoleInfo(req, res, next) {
    res.locals.isGuest = !req.session.isAuthenticated;
    res.locals.isAuthenticated = req.session.isAuthenticated || false;
    res.locals.authUser = req.session.authUser || null;
    
    if (req.session.authUser) {
        res.locals.isBidder = req.session.authUser.role === 0;
        res.locals.isSeller = req.session.authUser.role === 1;
        res.locals.isAdmin = req.session.authUser.role === 2;
        // Admin KHÔNG được bid hoặc sell
        res.locals.canBid = (req.session.authUser.role === 0 || req.session.authUser.role === 1);
        res.locals.canSell = req.session.authUser.role === 1;
    } else {
        res.locals.isBidder = false;
        res.locals.isSeller = false;
        res.locals.isAdmin = false;
        res.locals.canBid = false;
        res.locals.canSell = false;
    }
    
    next();
}
