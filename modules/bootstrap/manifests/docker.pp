# == Class: bootstrap::docker
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

class bootstrap::docker (
  $docker_source = 'https://experimental.docker.com/builds/Linux/x86_64/docker-latest',
  $curl_option   = '--insecure',
  $docker_enable = $::bootstrap::params::docker_enable,
  $docker_ensure=$::bootstrap::params::docker_ensure) inherits ::bootstrap::params {
  yumrepo { 'extras':
    ensure     => 'present',
    descr      => 'CentOS-$releasever - Extras',
    gpgcheck   => '1',
    enabled    => '1',
    gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7',
    mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras&infra=$infra',
  }

  package { 'docker':
    ensure  => installed,
    require => Yumrepo['extras'],
    notify  => File['/usr/bin/docker'],
  }

  file { '/var/staging': ensure => directory, }

  class { 'staging':
    path      => '/var/staging',
    owner     => '0',
    group     => '0',
    exec_path => '/bin:/usr/bin',
  }

  staging::file { 'docker':
    curl_option => '--insecure',
    source      => $docker_source,
    subdir      => '',
    require     => [
      File['/var/staging'],
      Class['staging'],
      ]
  }

  file { '/usr/bin/docker':
    ensure  => 'present',
    source  => 'file:///var/staging/docker',
    mode    => '0755',
    require => [
      Staging::File['docker'],
      Package['docker'],
      ]
  }

  service { 'docker':
    ensure => $docker_ensure,
    enable => $docker_enable,
    require => [
      File['/usr/bin/docker']
    ]
  }


}
