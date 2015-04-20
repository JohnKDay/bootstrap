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
class bootstrap::params {
  $packagelist      = [
    'net-snmp-utils',
    'man-db',
    'man-pages',
    'mailx',
    'lsof',
    'tmpwatch',
    'wget',
    'curl',
    'tree',
    'sysstat',
    'bind-utils',
    'nmap-ncat']
  $ntpservers       = [
    'ntp1.ntp.com',
    'ntp2.ntp.com']
  $ntprestrict      = ['127.0.0.1']
  $selinux_mode     = 'disabled'
  $sudo_purge       = false
  $sudo_replace     = false
  $firewalld_enable = false
  $firewalld_ensure = 'stopped'
}
