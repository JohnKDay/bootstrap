#!/bin/bash
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
sync
sleep 1
yum install -y puppet
curl -s -k https://myserver.extreme-limit.com/jkday/bootstrap/repository/archive.tar.gz?ref=master | tar zxf - -C ~
puppet apply --verbose --modulepath=~/bootstrap.git/modules ~/bootstrap.git/modules/bootstrap/tests/init.pp