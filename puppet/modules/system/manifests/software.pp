# == Class: environment::software
#
# Performs software set up such as NTP MOTD CRON.
#
class system::software {
  notify { 'Adding software...': }
  include system::ntp
}