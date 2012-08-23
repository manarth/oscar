# -*- mode: puppet -*-
# vi: set ft=puppet :

class phpmyadmin {
  # PHPMyAdmin provides a web UI to browse and manage MySQL databases.

  package { 'phpmyadmin':
    ensure   => present,
  }

  # The Lucid package provides a config file for Apache, which exposes
  # /phpmyadmin as a URL alias. 
  # The file is /etc/phpmyadmin/apache.conf: this needs to be symlinked so that
  # it's loaded by Apache.
  file { '/etc/apache2/conf.d/phpmyadmin':
    ensure => link,
    target => '/etc/phpmyadmin/apache.conf',
    require => Package['phpmyadmin', 'apache2'],
  }

  # Restart Apache after the config file is deployed.
  service { 'apache2':
    subscribe => File['/etc/apache2/conf.d/phpmyadmin'],
  }
}
