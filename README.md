A Vagrant Box - CentOSx64, Ruby, PostgreSQL
==============================

This is another [Vagrant script](http://vagrantup.com), this time using a CentOS box to build a Ruby 1.9.3/PostgreSQL 8.4 set up for my introduction to programming class.

This build script, rather than using Chef, uses a basic Bash script to install RVM, ruby 1.9.3, and all the dependencies for native gem installation, so a pretty good all around basic Ruby box. Very easy to modify to suite your needs.

One note for set up, you will need Virtualbox and Vagrant installed, then if teh base box doesn't automatically install, you can install it via this command:

vagrant box add centOSx64 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.3-x86_64-v20130101.box

The /code folder maps to /home/vagrant (the folder you log in to) on the VM, so put your code in there and you are all set!