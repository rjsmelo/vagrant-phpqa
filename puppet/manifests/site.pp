stage { 'bootstrap':
    before => Stage['main'],
}

class { 'yum':
    extrarepo => [ 'epel', 'remi' ],
    stage => bootstrap,
}

group { 'puppet': ensure => present }
Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
File { owner => 0, group => 0, mode => 0644 }

package { [
    'vim-enhanced',
    'git',
    'php-pecl-imagick',
    'java-1.7.0-openjdk',
    'ant',
  ]:
  ensure  => 'installed',
}

service { "cron":
  ensure => "stopped",
}

service { "iptables":
  ensure => "stopped",
}

class { 'apache': }
apache::module { 'rewrite': }
file { "/etc/httpd/conf.d/welcome.conf":
    ensure => absent,
    require => Package['apache']
}

class { 'composer': }

class { 'php':
        service => 'apache'
}
php::module { 'pdo': }

php::pear::module { 'phing':
    alldeps => 'true',
    require => Package['php-pecl-imagick']
}

class { 'jenkins': }

