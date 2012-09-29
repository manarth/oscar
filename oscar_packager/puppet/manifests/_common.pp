# -*- mode: puppet -*-
# vi: set ft=puppet :

###
# This template is implemented by all nodes.
###

# All nodes should have a 'puppet' group.
group { "puppet": 
  ensure => present,
}

# Provide a default path for Exec for all nodes.
Exec {
  path => ["/bin", "/usr/bin", "/usr/sbin"]
}
