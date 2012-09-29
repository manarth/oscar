# Class: drush
#
# This class installs prerequisite packages and Drush. Supported on Debian
# based systems. Module should be installed on the Puppet modules path.
#
# == Requires:
#
#   Packages: git, php5-cli, php-pear
#   Pear Resources: Console_Table (prerequisite for Drush)
#
# == Variables:
#
#   Inherits $branch_name from drush::params
#
# == Examples
#
#   class {'drush': }
#   include drush
#
# == Authors
#
#   James Clemence <james+github@jvc26.org>
#
class drush {

    include drush::params

    package { 'Console_Table':
        ensure   => present,
        provider => pear,
        require  => Package['php-pear'],
    }

    exec { 'fetch-drush':
        cwd     => '/tmp',
        command => "/usr/bin/git clone --branch $drush::params::branch_name http://git.drupal.org/project/drush.git",
        creates => '/tmp/drush',
        require => Package['php5-cli', 'php-pear', 'Console_Table', 'git-core'], 
    }

    file { '/usr/local/lib/drush':
        ensure  => directory,
        recurse => true,
        purge   => true,
        source  => '/tmp/drush',
        require => Exec['fetch-drush'],
    }

    file { '/usr/local/bin/drush':
        ensure  => '/usr/local/lib/drush/drush',
        require => File['/usr/local/lib/drush'],
    }
}
