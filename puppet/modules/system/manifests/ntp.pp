# == Class: system::ntp
#
# Performs software set up for Network Time Protocol.
#
class system::ntp {
  notify { 'Setting up ntp software...': }

  class { '::ntp':
    servers => lookup('ntp::servers'),
    service_ensure => 'running',
    service_enable => true,
  }
}