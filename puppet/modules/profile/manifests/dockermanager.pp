# == Class: profile::dockermanager
#
# Adds docker management configuration.
#
class profile::dockermanager {
  include docker
  notify { 'Adding docker manager instance profile': }
  $ipaddr = lookup('network::ipaddr')
  docker::swarm {'cluster_manager':
    init           => true,
    advertise_addr => "$ipaddr",
    listen_addr    => "$ipaddr",
  }
}