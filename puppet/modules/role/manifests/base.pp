# == Class: role::base
#
# must be assigned to every machine, including workstations. It manages basic policies,
# and uses some conditional logic to include OS-specific profiles as needed.
#
class role::base {
  include profile::base
}
