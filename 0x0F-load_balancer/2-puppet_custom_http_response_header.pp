#configure a brand new ubuntu machine

exec {'apt-update':
  command => '/usr/bin/apt-get update'
}

# Set up Nginx
class nginx {
  package { 'nginx':
    ensure => installed,
  }

  service { 'nginx':
    ensure => running,
    enable => true,
  }
}

# Configure custom HTTP header
class custom_header {
  file { '/etc/nginx/conf.d/custom_headers.conf':
    ensure  => present,
    content => "add_header X-Served-By $::hostname always;",
    notify  => Class['nginx'],
  }
}

# Apply classes
include nginx
include custom_header
