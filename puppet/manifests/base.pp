# -*- mode: puppet -*-
# vi: set ft=puppet :


# Load the configuration templates.
import "_common.pp"
import "drupal.pp"
import "services.pp"
import "test.pp"

# Provide a default implementation for the old single-box structure.
# TODO: remove this.
node default inherits drupal_template { }


# Map the Vagrant-provided hostname to a configuration template.
# NB: Regex node IDs require puppet 0.25.0 or later.
node /^vm-.+-drupaldev$/  inherits drupal_template { }
node /^vm-.+-drupalsvcs$/ inherits services_template { }
node /^vm-.+-drupaltest$/ inherits test_template { }
