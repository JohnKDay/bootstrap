# Class: openssh::install
#
# This module manages openssh install
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class openssh::install (
  $server_pkg = $openssh::params::server_pkg,
  $client_pkg = $openssh::params::client_pkg,) inherits openssh::params {
  package { $server_pkg: ensure => 'installed', }

  package { $client_pkg: ensure => 'installed', }

}