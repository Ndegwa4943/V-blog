import vweb

struct App {
    vweb.Context
}

fn main() {
    vweb.run<App>(8080)
}

@[path('/')]
pub fn (mut app App) index() vweb.Result {
    return app.html()
}

@[path('/post')]
pub fn (mut app App) create_post() vweb.Result {
    return app.text('templates/post.html')
}

@[path('/profile')]
pub fn (mut app App) profile() vweb.Result {
    return app.text('templates/profile.html')
}
pub fn (mut app App) html() string {
    return $tmpl('templates/home.html')
}
