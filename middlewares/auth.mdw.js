export function isAuth(req, res, next) {
    if (!req.session.isAuthenticated) {
        req.session.retUrl = req.originalUrl;
        res.redirect('/account/signin');
    } else {
        next();
    }
}

export function isAdmin(req, res, next) {
    if (!req.session.isAuthenticated) {
        return res.redirect(`/account/signin?retUrl=${req.originalUrl}`);
    }

    if (req.session.authUser.role !== 2) {
        return res.status(403).send('<h1>403 - Forbidden</h1><p>Chỉ Admin mới được truy cập trang này!</p><a href="/">Quay về trang chủ</a>'); 
    }

    next();
}

export function isSeller(req, res, next) {
    if (!req.session.isAuthenticated) {
        req.session.retUrl = req.originalUrl;
        return res.redirect('/account/signin');
    }
    
    if (req.session.authUser.role !== 1) {
        return res.status(403).send('<h1>403 - Forbidden</h1><p>Chỉ Seller mới được truy cập trang này!</p><a href="/">Quay về trang chủ</a>');
    }
    
    next();
}