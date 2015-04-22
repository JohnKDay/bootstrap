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
  
  $jkday_key = 'AAAAB3NzaC1yc2EAAAABJQAAAQEAjZ3KXggO4DFvP7tFbYm5v/s3+RCEganz4002txThzAtAQJ4dHIEI36X62GATO1RyPiJg9W5H398y7nXjGPdWDFXqKXACRdT4f6uAJX1vnySiX2lsnltYGDp1cjpRJl5yB7yvvrgGJaOOmoW9Th//zIlzpgklzgoOp/eAUGXgAs2OIMo0hK4TNgjJFJ3k+g5d7QSgiGKlyZm1/x7vR2PD055vkuzjDQ00Bj90ZFD3Gto52shdqZp2HYrBWR36Etpg7Vtcg3d3oO7LeAyU///OGVWLnTen6mpJaX+/QC23fhvN+XK/Zq/0yG+WFedFyVssj/NssB4xFi4OOx9yYgP/KQ=='

  group { "unixusers":
    ensure     => "present",
    forcelocal => true,
    gid        => '666',
  }

  user { 'jkday':
    ensure           => 'present',
    gid              => '666',
    home             => '/home/jkday',
    password         => '$6$CYWhDla/$kDwAXU84D41/pEaTeOPIfoG.Nx4ZmAp7aEluuKvbVJsExNgm6a1IMTMs30mdT1PN9oue0Ne6uStcMJmYH2XuT.',
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/bash',
    uid              => '666',
    forcelocal       => true,
    managehome       => true,
  }

  sudo::conf { 'jkday':
    priority => 10,
    content  => "jkday ALL=(ALL) NOPASSWD: ALL",
  }

  ssh_authorized_key { 'jkday':
    ensure    => "present",
    require => [ User["jkday"] ],
    key => $jkday_key,
    type => "ssh-rsa",
    user => "jkday"
  }

}
