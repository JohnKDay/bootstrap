# == Class: bootstrap::jkday
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
  
  $jkday_key = 'putyourkeyhere'

  group { "unixusers":
    ensure     => "present",
    forcelocal => true,
    gid        => '666',
  }

  user { 'jkday':
    ensure           => 'present',
    gid              => '666',
    home             => '/home/jkday',
    password         => 'iluvcatsndolphins',
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/bash',
    uid              => '666',
    forcelocal       => true,
    managehome       => true,
  }

  ssh_authorized_key { 'jkday':
    ensure    => "present",
    require => [ User["jkday"] ],
    key => $jkday_key,
    type => "ssh-rsa",
    user => "jkday"
  }

}
