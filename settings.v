@[path('/settings')]
pub fn (mut app App) settings() vweb.Result {
    return $tmpl('templates/settings.html')
}
