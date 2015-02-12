#!/bin/bash

VAGRANTLOG="~/vagrant.log"

yum -y update
yum -y install httpd
rum -rf /var/www/html
ln -fs /vagrant /var/www/html
service httpd start
chkconfig httpd on

echo >> $VAGRANTLOG
echo "Apache httpd" >> $VAGRANTLOG
echo chkconfig --list httpd >> $VAGRANTLOG
