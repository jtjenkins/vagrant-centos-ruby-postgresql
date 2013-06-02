#!/bin/bash
mkdir /app
chmod 0777 /app
yum -y groupinstall "Development Tools"
wget http://ftp.osuosl.org/pub/fedora-epel/6/i386/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm
yum -y install expect openssl-devel libxml2 glibc gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel httpd nano postgresql postgresql-server postgresql-contrib postgresql-devel curl-devel httpd-devel apr-devel apr-util
curl -L https://get.rvm.io | bash -s stable --autolibs=3 --ruby
source /usr/local/rvm/scripts/rvm
rvm install 1.9.3
rvm use 1.9.3
gem install bundler

adduser postgres

echo -e "vagrant\nvagrant" | (passwd postgres --stdin)
su postgres

echo -e "exit\n"

chmod -R 0777 /usr/local/rvm

echo "Installation Complete. You should have a working copy in /home/vagrant of your local /code folder. If you're going to be using PostgreSQL, run initdb -D /app/db -W -A md5 -U postgres and put in a password for the postgres user."
exit