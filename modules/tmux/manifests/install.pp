# Class: tmux::install
#
# This module installs tmux
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class tmux::install (
  $pacakge_name = $tmux::params::package_name,) inherits tmux::params {

  package { $package_name: ensure => present }
}