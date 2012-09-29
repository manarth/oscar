# -*- mode: puppet -*-
# vi: set ft=puppet :

define phpundeprecate ( $file ) {
  # The command is idempotent, no need to check if the file has already 
  # changed.
  exec { "phpundeprecate $file":
    command => "sed -i 's/^#/;/' $file",
    path => ["/bin", "/usr/bin", "/usr/sbin"],
  }
}
