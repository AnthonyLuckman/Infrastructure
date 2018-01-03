# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
VAGRANTFILE_API_VERSION = "2"
VAGRANT_BOX = "ubuntu/xenial64"
VAGRANT_BOX_MEMORY = "1024"
VIRTUAL_BOX_NAME = "linsvr01"

# nfs is disabled on windows automatically
NFS_ENABLED = true
NFS_MOUNT_OPTIONS  = ["proto=tcp", "vers=3", "actimeo=2", "nolock"]
NFS_EXPORT_OPTIONS = ["async", "rw", "no_subtree_check", "all_squash"]

# only change these lines if you know what you do
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  nfs_enabled = NFS_ENABLED && RbConfig::CONFIG['host_os'] =~ /linux/
  mount_options = nfs_enabled ? NFS_MOUNT_OPTIONS  : []
  export_options = nfs_enabled ? NFS_EXPORT_OPTIONS : []
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = VAGRANT_BOX
  config.vm.hostname = VIRTUAL_BOX_NAME + ".dev"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  #config.vm.network "public_network"

  config.vm.network "public_network",  ip: "192.168.30.1", :netmask => "255.255.255.224"
  #config.vm.network "public_network", type: "dhcp", bridge: "eth0"
  #config.vm.network "private_network", ip: "192.168.40.1"



  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  #config.vm.synced_folder "../data", "/vagrant_data"

  # nfs example
  config.vm.synced_folder ".", "/vagrant", :nfs => nfs_enabled, :mount_options => mount_options, :linux__nfs_options =>  export_options
  # forward ssh requests for public keys
  config.ssh.forward_agent = true
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "VirtualBox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = VAGRANT_BOX_MEMORY
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
  config.vm.provision :shell, :path => 'scripts/bootstrap.sh'
  config.vm.provision :puppet do |puppet|
    #puppet.options = "--verbose --debug"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "site.pp"
    puppet.module_path = "puppet/modules"
    puppet.hiera_config_path = "puppet/hiera.yaml"
  end
end