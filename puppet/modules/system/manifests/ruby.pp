# == Class: system::ruby
#
# Performs software set up for Ruby and Gems.
#
class system::ruby {
  notify { 'Setting up ruby software...': }

  class { '::ruby':
    gems_version => 'latest',
    rubygems_package => 'bolt'
  }
}