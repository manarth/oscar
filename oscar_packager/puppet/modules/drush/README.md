# puppet-drush

This puppet module allows the installation of drush from the git repository at drupalcode.org. At present it pulls the most recent release of drush at the time of writing, however this will be converted to a more generic option soon.

## Usage

Prerequisites for use include the need to set

    pluginsync=true

Within your puppet.conf. Once this has been set, the drush module can be included as normal, for example:

    include drush

The particular branch of Drush which is required is set in the $branch_name variable in drush::params.

## Notes

Additional thanks to eric0, gniks and nate_h from the #puppet irc channel.
