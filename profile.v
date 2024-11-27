@[path('/profile')]
pub fn (mut app App) profile() vweb.Result {
    return $tmpl('templates/profile.html')
}
