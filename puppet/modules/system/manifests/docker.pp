# == Class: environment::docker
#
# Performs software set up for Docker.
#
class system::docker {
  notify { 'Setting up docker software...': }
  include 'docker'

}
