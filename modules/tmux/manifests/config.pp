# Class: tmux::config
#
# This module configures vas
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class vas::config (
  $package_name     = $tmux::params::package_name,) inherits tmux::params {
  validate_string($package_name)

  file { '/etc/tmux/tmux.conf':
    ensure => 'present',
    mode   => '640',
    owner  => 'root',
    group  => 'root',
    content => template( "tmux/tmux.conf" ),
  }
}
