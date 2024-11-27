module main

import vweb

struct App {
    vweb.Context
mut:
    users map[string]string // Map to store usernames and passwords
}

fn main() {
    mut app := App{
        users: {
            'admin': 'password123', // Example credentials
        }
    }
    vweb.run(app, 8080)
}

// Login page
@[path('/login')]
pub fn (mut app App) login_page() vweb.Result {
    return $tmpl('templates/login.html')
}

// Handle login form submission
['POST']
pub fn (mut app App) login() vweb.Result {
    username := app.form['username'] or { return app.text('Missing username') }
    password := app.form['password'] or { return app.text('Missing password') }

    // Validate credentials
    if app.users[username] == password {
        return app.redirect('/')
    }
    return app.text('Invalid username or password')
}

// Home page (redirect target)
@[path('/')]
pub fn (mut app App) home() vweb.Result {
    return $tmpl('templates/home.html')
}
