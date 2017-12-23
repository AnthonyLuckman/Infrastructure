# == Class: service::ntp
#
# Performs service set up for Network Time Protocol.
#
class service::ntp {
  notify { 'Setting up ntp service...': }
}