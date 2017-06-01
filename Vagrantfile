# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "centos/7"
  config.vm.box_check_update    = false

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.define "rancher-master", primary: true do |node|
    node.vm.hostname  = "rancher-master"
    node.vm.network "private_network", ip: "192.168.65.210", nm_controlled: "yes"

    node.vm.provider "virtualbox" do |vb|
      vb.name         = "rancher-master"
    end

    node.vm.provision :shell, path: "./rancher-master.sh"
  end

  for i in 1..1
    config.vm.define "rancher-node#{i}" do |node|
      node.vm.hostname = "rancher-node#{i}"
      node.vm.network "private_network", ip: "192.168.65.#{i + 210}", nm_controlled: "yes"

      node.vm.provider "virtualbox" do |vb|
        vb.name       = "rancher-node#{i}"
      end

      node.vm.provision :shell, path: "./rancher-node.sh"
    end
  end
end
