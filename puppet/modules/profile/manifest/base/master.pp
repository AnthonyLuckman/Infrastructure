class profile::base::master (
  String $ssh = '22',
) {

  class { 'base':
    configure_firewall => true,
    port               => $ssh,
  }
  class screen {

    package { 'screen':
      ensure => 'installed',
    }
    file { '/home/ubuntu/helloworld.txt':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0777',
      source  => 'puppet:///vagrant/files/helloworld.txt',
    }
  }
}
