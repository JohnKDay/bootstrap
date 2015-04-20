# Class: profiles::bootstrap::packages
#
# This module manages profiles
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class bootstrap::packages (
  $packagelist = $::bootstrap::params::packagelist) inherits ::bootstrap::params {
  package { $packagelist: ensure => 'isntalled' }
}
