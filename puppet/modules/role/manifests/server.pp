# == Class: role::server
#
# must be assigned to every machine that provides a service over the network. It makes
# sure ops can log into the machine, and configures things like timekeeping, firewalls,
# logging, and monitoring
#
class role::server {
  include profile::server
}