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
        return res.render('404', { layout: false }); 
    }

    next();
}

export function isSeller(req, res, next) {
    if (!req.session.isAuthenticated) {
        req.session.retUrl = req.originalUrl;
        res.redirect('/account/signin');
    }
    
    if (req.session.authUser.role !== 1) {
        return res.render('404'); 
    }
    next();
}