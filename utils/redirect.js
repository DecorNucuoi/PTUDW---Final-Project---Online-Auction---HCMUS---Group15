/**
 * Redirect helper that ensures session is saved before redirecting
 * This fixes the issue where session messages are lost during redirect
 */
export function redirectWithSession(req, res, url) {
    req.session.save((err) => {
        if (err) {
            console.error('Session save error:', err);
        }
        res.redirect(url);
    });
}

/**
 * Set success message and redirect
 */
export function redirectWithSuccess(req, res, url, message) {
    req.session.successMessage = message;
    redirectWithSession(req, res, url);
}

/**
 * Set error message and redirect
 */
export function redirectWithError(req, res, url, message) {
    req.session.errorMessage = message;
    redirectWithSession(req, res, url);
}
