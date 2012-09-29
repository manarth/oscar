# Class: drush::params
#
# This class provides only the variable for the $branch_name of the drush
# repository which is to be checked out. It is set to the most recent
# branch at the time of writing.
# 
# == Variables
#   $branch_name = Valid branch name for Drush
#
# == Authors
#
# James Clemence <james+github@jvc26.org>
#
class drush::params {
	$branch_name = "7.x-5.x"
}
