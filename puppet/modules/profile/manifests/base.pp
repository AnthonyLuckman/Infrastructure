# == Class: profile::base
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class profile::base {
  notify { 'Adding base instance profile': }
#  include environment::filesystem
#  include environment::firewall
  include system::software
  include system::groups
  include system::users
  include system::docker

  file {
    '/home/ubuntu/.bashrc':
      owner => 'ubuntu',
      group => 'ubuntu',
      mode  => '0644',
      source => 'puppet:///modules/profile/helloworld.txt';
  }
}
