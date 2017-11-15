# == Class: environment::groups
#
# Performs user set up including ssh-keys.
#
class system::groups {
  notify { 'Adding groups...': }

  group { 'docker':
    ensure => 'present',
    gid    => '502',
  }
}