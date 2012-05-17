# -*- mode: puppet -*-
# vi: set ft=puppet :

class avahi {

  package { 'avahi-daemon' :  }
  package { 'avahi-discover': }
  package { 'avahi-utils': }
  package { 'libapache2-mod-dnssd': }

  File {
    require => Package['avahi-daemon'],
    before  => Service['avahi-daemon'],
    owner => root, group => 0, mode => 0644,
  }

  file {
    '/etc/avahi/services/apache.service' : 
      source => "puppet://${server}/modules/avahi/services/apache.service",
  }
  file {
    '/etc/avahi/services/ssh.service' : 
      source => "puppet://${server}/modules/avahi/services/ssh.service",
  }
  file {
    '/etc/avahi/services/smb.service' : 
      source => "puppet://${server}/modules/avahi/services/smb.service",
  }


  service {
    'avahi-daemon' :
      ensure => running,
      enable => true,
      hasstatus => true,
      require => Package[avahi-daemon],
  }
}
