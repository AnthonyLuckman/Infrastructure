# == Class: profile::dockermanager
#
# Adds docker management configuration.
#
class profile::dockermanager {
  notify { 'Adding docker manager instance profile': }
  class {'docker':
  } ->
  docker::swarm {'cluster_manager':
    init           => true,
    advertise_addr => lookup('network::ipaddr'),
    listen_addr    => lookup('network::ipaddr'),
  }
}