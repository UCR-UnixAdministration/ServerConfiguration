#!/bin/bash

VAGRANTLOG=~/vagrant.log
touch $VAGRANTLOG

# update
yum -y update

# mount fix 1 ====== This sucked. ==============================================
# yum install kernel-devel-2.6.32-431.el6.x86_64  # MT: rebuild virtualbox addons
# sudo /etc/init.d/vboxadd setup                  # yum update rebuilds the kernel so we need to do this
# mount fix 2
# sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
# mount fix 3 ========================================== 4 hours later... ======
yum install -y gcc* kernel-devel epel-release
# mount fix: I disabled mounting /vagrant in the VagrantFile

# apache
yum -y install httpd

# apache services -- [ON]
#rm -rf /var/www/html                      # change webroot to vagrant folder
#ln -fs /vagrant /var/www/html             # ^
service httpd restart
chkconfig httpd on

# log apache service
echo >> $VAGRANTLOG
echo "Apache httpd" | tee $VAGRANTLOG
chkconfig --list httpd | tee $VAGRANTLOG
