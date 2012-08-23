# -*- mode: puppet -*-
# vi: set ft=puppet :


# TODO: add timezone configuration (and make it easily extensible from sub-boxes).


group { "puppet": 
  ensure => present,
}

# Add a stage which precedes the main installation routine.
stage {"pre": before => Stage["main"]}
# Ensure apt updates before running the main installation routine.
class {'apt': stage => 'pre'}

# Seriously, no-one gets by without vim and the like these days.
package { 'vim': }
package { 'vim-puppet': }
package { 'curl': }

# TODO: Get a bunch of vim syntax files here, like nginx, vcl, etc.
#       Oh, and rewrite the filetype settings.
#       Seriously, .module IS NOT a Pascal file.


file { '/srv' :
  ensure => 'directory',
  owner => 'vagrant',
  group => 'vagrant',
}


# Ensure the "vagrant" user has full MySQL access.
exec { 'mysql':
  command => "/usr/bin/mysql -e 'GRANT ALL ON *.* to \"vagrant\"@\"localhost\" WITH GRANT OPTION;'",
  require => Package['mysql-server'],
}

# Ensure that mod-rewrite is running.
exec { 'a2enmod':
  command => '/usr/sbin/a2enmod rewrite',
  require => Package['apache2'],
}



# Services used to run Drupal.
package { 'apache2': }
package { 'mysql-server': }
package { 'memcached': }
package { 'varnish': }

# PHP and a bunch of PHP extensions.
package { 'php5': }
package { 'php5-cli': }
package { 'php-apc': }
package { 'php5-curl': }
package { 'php5-gd': }
package { 'php5-mcrypt': }
package { 'php5-memcache': }
package { 'php5-memcached': }
package { 'php5-mysql': }
package { 'php5-xsl': }

package { 'php-pear': }



class { 'drush': }
# class { 'drush-feather': }



# These packages would normally only be used in Dev.
class {'avahi': }

package { 'gcc': }
package { 'make': }
package { 'git-core': }
package { 'subversion': }
package { 'php5-dev': }
package { 'php5-xdebug': }
