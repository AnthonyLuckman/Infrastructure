# == Class: profile::server
#
# Performs initial configuration tasks for all Vagrant servers.
#
class profile::server {
  notify { 'Adding Server instance profile': }
  include profile::base
  include system::software
}