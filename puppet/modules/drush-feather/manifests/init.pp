# -*- mode: puppet -*-
# vi: set ft=puppet :

# Class: drush
#
class drush-feather {


    file { '/usr/share/drush/commands':
        ensure  => directory,
        recurse => true,
        purge   => true,
        require => Class['drush'],
    }

    exec { 'fetch-drush-feather':
        cwd     => '/tmp',
        command => "/usr/local/lib/drush/drush dl feather",
        creates => '/usr/share/drush/commands/feather',
        require => File['/usr/share/drush/commands'], 
    }
}
