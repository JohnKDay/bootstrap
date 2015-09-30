# == Class: bootstrap::root
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
class bootstrap::root {
  
  $root_key1 = 'AAAAB3NzaC1yc2EAAAABJQAAAQEAjZ3KXggO4DFvP7tFbYm5v/s3+RCEganz4002txThzAtAQJ4dHIEI36X62GATO1RyPiJg9W5H398y7nXjGPdWDFXqKXACRdT4f6uAJX1vnySiX2lsnltYGDp1cjpRJl5yB7yvvrgGJaOOmoW9Th//zIlzpgklzgoOp/eAUGXgAs2OIMo0hK4TNgjJFJ3k+g5d7QSgiGKlyZm1/x7vR2PD055vkuzjDQ00Bj90ZFD3Gto52shdqZp2HYrBWR36Etpg7Vtcg3d3oO7LeAyU///OGVWLnTen6mpJaX+/QC23fhvN+XK/Zq/0yG+WFedFyVssj/NssB4xFi4OOx9yYgP/KQ=='
  $root_key2 = 'AAAAB3NzaC1yc2EAAAABJQAAAQEAyv5iKAtYRXv0TsWT35j2EWDNcMeo8tFhD+2hoGUxKwK0lQz1QZv2wjx+fJc6Bd0V6ZVpZFsJIfhkOzwv800MWv8dlWx0IXFYTu83ef9N1fCaEeFdA4I9BIIIl3ZKBktb/PihaywM82jQm687CetxZZ3bl8JYPRGgFhx/kUmQrWhde923/iYLI1p3AgCa7HGPvDBGEiWvkwHeQeGdRJq1inT7ooURALYxoazQ9KEmuVMAZ4R7aVRukGdPYOFaXNjcrf0zGctruvwQSttemEaDYOxwz648juZx7Nfy5GBQc5Hta+kUFTVC8Ia7PtTl3pOea5SNtbHEpshumnFFu4U0xw=='
  $root_key3 = 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCXZLdIK6MbFZBC6OltxBYmRgARSdmmNsiu96Bs9JE3QPAelTKdXrvhrF813ixJblp0bbjLv86/EUQqpn7eY8hhdlExE0sWJcfJOXsdLkBxVBbOn3dgzjCbazX6MEBu1NCaHm6wsqGhtqVbIVtO50CNMMmFa7JmVur4LIWDZP7veV8/QlK9v5kP+UKXz7Lf3jS1KLrEUjrlL+V3VliVbWT5MgdgxLmCZTLIAuHd82JT4ZVgZk92nY9Y1USq17gAZVEu2pcRNHtJrvwkITrrJIjpSt3ldyjHzZYl5cSiUiFCQj+6EqiqradqLTnkwGyPDbG7V55jyUYX2uEmNIQyZhjP'

  sudo::conf { 'root':
    priority => 10,
    content  => "root ALL=(ALL) NOPASSWD: ALL",
  }

  ssh_authorized_key { 'root2':
    ensure    => "present",
    key => $root_key2,
    type => "ssh-rsa",
    user => "root"
  }
  ssh_authorized_key { 'root3':
    ensure    => "present",
    key => $root_key3,
    type => "ssh-rsa",
    user => "root"
  }
  ssh_authorized_key { 'root1':
    ensure    => "present",
    key => $root_key1,
    type => "ssh-rsa",
    user => "root"
  }

}
