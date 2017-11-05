class accounts {
  include groups

  $rootgroup = $osfamily ? {
    'Debian'  => 'sudo',
    'RedHat'  => 'wheel',
    default   => warning('This distribution is not supported by the Accounts module'),
  }

  user { 'anthony':
    ensure      => present,
    home        => '/home/anthony',
    shell       => '/bin/bash',
    managehome  => true,
    gid         => 'anthony',
    groups      => "$rootgroup",
  }

}