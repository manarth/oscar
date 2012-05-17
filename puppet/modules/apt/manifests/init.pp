# -*- mode: puppet -*-
# vi: set ft=puppet :

class apt {
  exec { "apt-get update":
    command => "/usr/bin/apt-get update && touch /tmp/apt.update",
    onlyif => "/bin/sh -c '[ ! -f /tmp/apt.update ] || /usr/bin/find /etc/apt -cnewer /tmp/apt.update | /bin/grep . > /dev/null'",
  }
}
