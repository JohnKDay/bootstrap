# bootstrap

Bootstrap is a simple "puppet apply" module that performs machine setup and user configuration for docker.

### Current list of puppet functions 
  - Create user jkday with password and public key access and sudo access
  - Install the latest puppet repos in /etc/yum.repos.d
  - Install a default list of rpm packages
  - Perform "yum update" against installed packages
  - Install Docker rpm and then overlay latest rpm binary from docker.com
   - https://get.docker.com/builds/Linux/x86_64/docker-latest
  - Install `tmux` rpm package and install custom /etc/tmux.conf file
  - Reconfigure sshd to **"PermitRootLogin without-password"**
  - Configure NTP
  - Configure timezone
  - Disable *selinux*
  - Disable *firewalld*

### Installation

Bootstrap is simply run by issuing the following command:


```sh
$ curl -s -k https://myserver.extreme-limit.com/jkday/bootstrap/raw/master/bootbootstrap.sh | bash
```
Reboot and the machine is ready to go with docker.
