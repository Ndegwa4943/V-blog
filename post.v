@[path('/post')]
pub fn (mut app App) create_post() vweb.Result {
    return $tmpl('templates/post.html')
}
