# == Class: bootstrap::repos
#
# Full description
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
#  class { example:
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
class bootstrap::jkday {
  
  yumrepo { 'puppetlabs-products':
    ensure   => 'present',
    baseurl  => 'http://yum.puppetlabs.com/el/6/products/$basearch',
    descr    => 'Puppet Labs Products El 6 - $basearch',
    enabled  => '1',
    gpgcheck => '0',
  }

  yumrepo { 'puppetlabs-deps':
    ensure   => 'present',
    baseurl  => 'http://yum.puppetlabs.com/el/6/dependencies/$basearch',
    descr    => 'Puppet Labs Dependencies El 6 - $basearch',
    enabled  => '1',
    gpgcheck => '0',
  }

  $puppet_pkgs = [ 'puppetlabs-release', 'puppet' ]

  package { 'puppetlabs-release':
    ensure  => 'latest',
    require => [
      Yumrepo['puppetlabs-products'],
      Yumrepo['puppetlabs-deps'],
    ],
  }


}
