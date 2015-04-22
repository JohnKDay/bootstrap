# == Class: bootstrap
#
# Full description of class bootstrap here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { bootstrap:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2011 Your name here, unless otherwise noted.
#
class bootstrap (
  $timeregion       = $::bootstrap::params::timeregion,
  $timelocal        = $::bootstrap::params::timelocal,
  $ntpservers       = $::bootstrap::params::ntpservers,
  $ntprestrict      = $::bootstrap::params::ntprestrict,
  $sudo_purge       = $::bootstrap::params::sudo_purge,
  $sudo_replace     = $::bootstrap::params::sudo_replace,
  $firewalld_ensure = $::bootstrap::params::firewalld_ensure,
  $firewalld_enable = $::bootstrap::params::firewalld_enable,
  $ssh_permit_root_login = $::bootstrap::params::ssh_permit_root_login,
  $ssh_options_hash = $::bootstrap::params::ssh_options_hash,
  $selinux_mode     = $::bootstrap::params::selinux_mode) inherits ::bootstrap::params {
  include ::bootstrap::jkday
  include ::bootstrap::repos
  include ::bootstrap::packages
  include ::bootstrap::update
  include ::bootstrap::docker 
  include ::tmux

  class { 'sudo':
    purge               => $sudo_purge,
    config_file_replace => $sudo_replace,
  }

  include ::ntp

  class { 'timezone':
    region   => $timeregion,
    locality => $timelocal,
  }

  #  class { '::ntp':
  #    servers  => $ntpservers,
  #    restrict => $ntprestrict,
  #  }

  class { '::selinux':
    mode => $selinux_mode,
  }

  service { 'firewalld':
    ensure => $firewalld_ensure,
    enable => $firewalld_enable,
  }
class { '::ssh::server':
  permit_root_login => $ssh_permit_root_login,
#  options           => $ssh_options_hash,
}
}
