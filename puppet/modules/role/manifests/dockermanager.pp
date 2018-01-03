# == Class: role::dockermanager
#
# Configures a docker manager.
#
class role::dockermanager {
  include profile::base
  include profile::dockermanager
}
