#!/bin/bash
cat << EOF > /etc/environment
http_proxy=http://web-proxy.rose.hp.com:8088
https_proxy=http://web-proxy.rose.hp.com:8088
ftp_proxy=http://web-proxy.rose.hp.com:8088
HTTP_PROXY=http://web-proxy.rose.hp.com:8088
HTTPS_PROXY=http://web-proxy.rose.hp.com:8088
no_proxy="hp.com,rdlabs.hpecorp.net,localhost,127.0.0.1,10.0.0.0/16,169.254.169.254"

EOF

source /etc/environment

rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
sync
sleep 1
yum install -y puppet
#curl -s -k https://gitlab.com/jkday/bootstrap/repository/archive.tar.gz?ref=master | tar zxf - -C ~
#puppet apply --verbose --modulepath=~/bootstrap.git/modules ~/bootstrap.git/modules/bootstrap/tests/init.pp
puppet apply --verbose --modulepath=~/bootstrap/modules ~/bootstrap/modules/bootstrap/tests/init.pp
