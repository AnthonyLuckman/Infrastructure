# == Class: profile::base
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class profile::base {
  notify { 'Adding base instance profile': }
  #include system::filesystem
  #include system::firewall
  include system::software
  include system::groups
  include system::users

  file {
    '/home/ubuntu/.bashrc':
      owner => 'ubuntu',
      group => 'ubuntu',
      mode  => '0644',
      source => 'puppet:///modules/profile/helloworld.txt';
  }
}
