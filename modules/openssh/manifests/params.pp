# Class: openssh::params
#
# This module is inherited for params
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class openssh::params {
  $enable = true
  $ensure = 'running'
  $banner = 'none'
  $loglevel = 'info'
  $port = '22'
  $protocol = '2'
  $permitrootlogin = 'without-password'
  $passwordauthentication = 'yes'
  $challengeresponseauthentication = 'no'
  $x11forwarding = 'yes'
  $usedns = 'yes'
  $usepam = 'yes'
  $clientaliveinterval = '0'
  $clientalivecountmax = '3'
  $maxauthtries = '4'

  $client_pkg = $osfamily ? {
    default => 'openssh-clients',
  }

  $server_pkg = $osfamily ? {
    default => 'openssh-server',
  }

  $service_name = $osfamily ? {
    Debian  => 'openssh',
    default => 'sshd',
  }

  $server_configfile = $osfamily ? {
    default => '/etc/ssh/sshd_config',
  }

  $client_configfile = $osfamily ? {
    default => '/etc/ssh/ssh_config',
  } }