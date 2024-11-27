@[path('/logout')]
pub fn (mut app App) logout() vweb.Result {
    // Clear session and redirect to login page
    app.set_cookie('session', '', -1)
    return app.redirect('templates/login.html')
}
