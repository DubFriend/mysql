# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Base Box
  config.vm.box = "ubuntu/trusty64"

  # Hostname
  config.vm.hostname = "mysql-container"

  # Provisioning
  config.vm.provision :shell, path: "vagrant-bootstrap.sh"

  # Since we mount the dir using NFS we need a private network
  config.vm.network :private_network, ip: "172.17.9.100"

  # Sync folder to local machine
  config.vm.synced_folder ".", "/opt/mysql", {:mount_options => ['dmode=777','fmode=777']}
  # Limitate the resources used by chimpdev
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = 4096
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "70"]
  end

end
