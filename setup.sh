#!/bin/bash
mkdir /db
yum -y groupinstall "Development Tools"
yum -y install expect openssl-devel libxml2 glibc gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel httpd nano postgresql-devel curl-devel httpd-devel apr-devel apr-util
wget http://ftp.osuosl.org/pub/fedora-epel/6/i386/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm
curl -L https://get.rvm.io | bash -s stable --autolibs=3 --ruby
source /usr/local/rvm/scripts/rvm
rvm install 1.9.3
rvm use 1.9.3
gem install bundler

#install postgres
rpm -Uvh http://yum.pgrpms.org/9.1/redhat/rhel-6-x86_64/pgdg-centos91-9.1-4.noarch.rpm
yum install postgresql91-server.x86_64
adduser postgres

su postgres
echo -e "vagrant\nvagrant" | (passwd --stdin)

#initialize the cluster with admin user "postgres" (-U postgres), prompting to enter a password (-W), setting the password to md5 (-A md5):
initdb -D /db -W -A md5 -U postgres

echo -e "exit\n"

chmod -R 0777 /usr/local/rvm

echo "Installation Complete. You should have a working copy in /home/vagrant of your local /code folder"
exit