# Install Nginx
class nginx {
  package { 'nginx':
    ensure => 'installed',
  }
}

# Configure Nginx to return "Hello World!" at root and redirect /redirect_me to another page
class nginx::config {
  file { '/etc/nginx/sites-available/default':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "server {
                  listen 80 default_server;
                  listen [::]:80 default_server;
                  root /var/www/html;
                  index index.html;
                  location / {
                    return 200 'Hello World!';
                  }
                  location /redirect_me {
                    return 301 https://youtube.com/;
                  }
                }",
  }

  file { '/var/www/html/index.html':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => '<html><body>Hello World!</body></html>',
  }

  service { 'nginx':
    ensure => 'running',
    enable => true,
    require => File['/etc/nginx/sites-available/default', '/var/www/html/index.html'],
  }
}

# Apply the nginx and nginx::config classes
include nginx
include nginx::config
