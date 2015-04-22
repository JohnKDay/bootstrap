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
class tmux::config (
  $package_name     = $tmux::params::package_name,) inherits tmux::params {
  validate_string($package_name)
  require tmux::install
  
  file { '/etc/tmux.conf':
    ensure => 'present',
    mode   => '644',
    owner  => 'root',
    group  => 'root',
    content => template( "tmux/tmux.conf" ),
  }
}