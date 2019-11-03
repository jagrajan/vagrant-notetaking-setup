# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/bionic64"

  config.vm.synced_folder "./", "/host"

  cpus = "1"
  memory = "1024" #MB
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--cpus", cpus, "--memory", memory]
    vb.customize ["modifyvm", :id, "--uartmode1", "disconnected"]
  end

  config.vm.provision "chef_solo" do |chef|
    chef.arguments = "--chef-license accept"
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe 'notetaking'
  end

end
