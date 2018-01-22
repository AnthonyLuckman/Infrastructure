# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
VAGRANTFILE_API_VERSION = "2"
VAGRANT_BOX = "ubuntu/xenial64"
VAGRANT_BOX_MEMORY = "1024"
VIRTUAL_BOX_NAME = "LINSVR01"

# nfs is disabled on windows automatically
NFS_ENABLED = true
NFS_MOUNT_OPTIONS  = ["proto=tcp", "vers=3", "actimeo=2", "nolock"]
NFS_EXPORT_OPTIONS = ["async", "rw", "no_subtree_check", "all_squash"]


NUMBER_OF_WORKERS = 1
INSTANCES = []
(1..NUMBER_OF_WORKERS).each do |n|
  INSTANCES.push({:name => "LINWKR0#{n}", :ip => "192.168.40.#{n+1}"})
end

# only change these lines if you know what you do
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  nfs_enabled = NFS_ENABLED && RbConfig::CONFIG['host_os'] =~ /linux/
  mount_options = nfs_enabled ? NFS_MOUNT_OPTIONS  : []
  export_options = nfs_enabled ? NFS_EXPORT_OPTIONS : []
  config.vm.box = VAGRANT_BOX
  config.vm.hostname = VIRTUAL_BOX_NAME + ".dev"

  config.vm.synced_folder ".", "/vagrant", :nfs => nfs_enabled, :mount_options => mount_options, :linux__nfs_options =>  export_options
  config.ssh.forward_agent = true

  config.vm.provider "VirtualBox" do |vb|
    vb.gui = true
    vb.memory = VAGRANT_BOX_MEMORY
  end

  config.vm.define VIRTUAL_BOX_NAME do |manager|
    manager.vm.box = VAGRANT_BOX
    manager.vm.hostname = VIRTUAL_BOX_NAME + ".dev"
    #manager.vm.network "public_network",  ip: "192.168.30.1", :netmask => "255.255.255.224"
    manager.vm.network "private_network", ip: "192.168.40.1",
    virtualbox__intnet: "internal"
    manager.vm.provision :shell, :path => 'scripts/bootstrap.sh'
    manager.vm.provision :puppet do |puppet|
      puppet.options = "--verbose --debug"
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "site.pp"
      puppet.module_path = "puppet/modules"
      puppet.hiera_config_path = "puppet/hiera.yaml"
    end
    manager.vm.provision :shell, :inline  => "sed -i \"s/docker::token: .*/docker::token: $(sudo docker swarm join-token -q worker)/\" /vagrant/puppet/data/common.yaml"
  end

  #Set Up Workers
  INSTANCES.each do |instance|
    config.vm.define instance[:name] do |i|
      i.vm.box = VAGRANT_BOX
      i.vm.hostname = instance[:name] + ".dev"
      #i.vm.network "public_network"
      i.vm.network "private_network", ip: "#{instance[:ip]}",
      virtualbox__intnet: "internal"
      i.vm.provision :shell, :path => 'scripts/bootstrap.sh'
      i.vm.provision :puppet do |puppet|
        puppet.options = "--verbose --debug"
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file = "site.pp"
        puppet.module_path = "puppet/modules"
        puppet.hiera_config_path = "puppet/hiera.yaml"
      end
    end
  end

end