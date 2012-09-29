# -*- mode: puppet -*-
# vi: set ft=puppet :

class git_check_config {

  # Push the script to the server, and configure to run on login.
  file { "git_check_config.sh":
    ensure => 'file',
    path   => '/etc/profile.d/git_check_config.sh',
    source => 'puppet:///modules/git_check_config/git_check_config.sh',

    owner  => 'root',
    group  => 'root',
    mode   => '755',
  }

}
