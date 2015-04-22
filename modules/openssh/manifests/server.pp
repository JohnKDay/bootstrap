# Class: openssh::server
#
# This module manages openssh server
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class openssh::server (
  $ensure                 = $openssh::params::ensure,
  $enable                 = $openssh::params::enable,
  $server_configfile      = $openssh::params::server_configfile,
  $service_name           = $openssh::params::service_name,
  $loglevel               = $openssh::params::loglevel,
  $port                   = $openssh::params::port,
  $protocol               = $openssh::params::protocol,
  $permitrootlogin        = $openssh::params::permitrootlogin,
  $passwordauthentication = $openssh::params::passwordauthentication,
  $challengeresponseauthentication = $openssh::params::challengeresponseauthentication,
  $x11forwarding          = $openssh::params::x11forwarding,
  $usedns                 = $openssh::params::usedns,
  $usepam                 = $openssh::params::usepam,
  $banner                 = $openssh::params::banner,
  $clientaliveinterval    = $openssh::params::clientaliveinterval,
  $clientalivecountmax    = $openssh::params::clientalivecountmax,
  $maxauthtries           = $openssh::params::maxauthtries) inherits openssh::params {
  require openssh::install

  file { $server_configfile:
    ensure  => 'present',
    content => template('openssh/sshd_config.erb'),
    notify  => Service["${service_name}"]
  }

  service { "${service_name}":
    ensure  => $ensure,
    enable  => $enable,
    require => File["${server_configfile}"]
  }
}
