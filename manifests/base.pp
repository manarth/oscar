# -*- mode: puppet -*-
# vi: set ft=puppet :

group { "puppet": 
  ensure => present,
}

stage {"pre": before => Stage["main"]}
class {'apt': stage => 'pre'}

package { 'vim': }
package { 'vim-puppet': }
package { 'curl': }

# Global.
package { 'apache2': }
package { 'mysql-server': }
package { 'memcached': }
package { 'varnish': }

package { 'php5': }
package { 'php5-cli': }
package { 'php5-dev': }
package { 'php-apc': }

package { 'php5-curl': }
package { 'php5-gd': }
package { 'php5-memcache': }
package { 'php5-memcached': }
package { 'php5-mysql': }
package { 'php5-xdebug': }
package { 'php5-xsl': }


# Dev-only.
class {'avahi': }
package { 'gcc': }
package { 'make': }
package { 'git-core': }
package { 'subversion': }
