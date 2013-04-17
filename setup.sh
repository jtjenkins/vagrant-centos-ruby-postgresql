#!/bin/bash
mkdir /db
yum -y groupinstall "Development Tools"
yum -y install expect openssl-devel libxml2 glibc gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel httpd nano postgresql-devel curl-devel httpd-devel apr-devel apr-util postgresql
curl -L https://get.rvm.io | bash -s stable --autolibs=3 --ruby
source /usr/local/rvm/scripts/rvm
gem install bundler

chmod -R 0777 /usr/local/rvm

su vagrant

source /usr/local/rvm/scripts/rvm
echo "Installation Complete. You should have a working copy in /var/www/html of your local /code folder"
exit