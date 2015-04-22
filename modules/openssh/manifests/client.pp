# Class: openssh::client
#
# This module manages openssh client
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class openssh::client (
  $client_configfile = $openssh::params::client_configfile,) inherits openssh::params {
  require openssh::install

  file { $client_configfile:
    ensure  => 'present',
    content => template('openssh/ssh_config')
  }

}