# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "galleryapp"
  config.vm.network :private_network, ip: "33.33.33.10"
  config.vm.network :forwarded_port, guest: 8080, host: 3000
  #config.ssh.timeout = 30
  
end
