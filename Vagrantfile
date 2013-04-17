Vagrant::Config.run do |config|
  # Setup the box
  # NOTE: To install the box, type in to a console window
  # "vagrant box add centOSx64 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.3-x86_64-v20130101.box"
  # or
  # "vagrant add box centOSx64 /path/to/CentOS-6.3-x86_64-v20130101.box"
  # This only needs to be done once per developer machine
  config.vm.box = "centOSx64"
  # Forward guest port 80 to host port 4567 (ruby)
  config.vm.forward_port 3000, 8080
  # Forward guest port 80 to host port 4567 (postgresql)
  config.vm.forward_port 5432, 8081
  # Forward guest port 22 to host port 2222 (ssh)
  #config.vm.forward_port 22, 2222
  #set the shared folder for the code we will run
  config.vm.share_folder "dev-box", "/home/vagrant", "./code"
  # set it up so we can install stuff via symlinks
  config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/dev-box", "1"]
  
  #set our provisioner to set up the box for us
  config.vm.provision :shell, :path => "setup.sh"
end