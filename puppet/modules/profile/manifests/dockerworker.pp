# == Class: profile::dockerworker
#
# Includes docker worker configuration.
#
class profile::dockerworker {
  include docker

  notify { 'Adding docker worker instance profile': }

  docker::swarm {'cluster_worker':
    join           => true,
    advertise_addr => lookup('network::ipaddr'),
    listen_addr    => lookup('network::ipaddr'),
    manager_ip     => lookup('network::server'),
    token          => lookup('docker::token')
  }
}