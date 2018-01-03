# == Class: role::dockermanager
#
# Configures a docker worker
#
class role::dockerworker {
  include profile::base
  include profile::dockerworker
}
