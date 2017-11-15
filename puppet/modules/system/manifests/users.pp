# == Class: environment::users
#
# Performs user set up including ssh-keys.
#
class system::users{
  notify { 'Adding users...': }

  user { 'anthony':
    ensure => present,
    comment => 'Anthony Luckman',
    home => '/home/anthony',
    groups => 'docker',
    managehome => true
  }

  ssh_authorized_key { 'anthony_ssh':
    user => 'anthony',
    type => 'rsa',
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC0mfp5hRk2HQi8HiTNW8zNFgW5ng0BuXSTDFHTBsF+qBxRmkkzigMH0jrV1a0q52/zY1yfjcu/fAo3LuiIKx0BQdP9Hg6DlZc1EsHdRkNKx+wcbeJufjqL8V/lypdzcytroEwAxY16y/7BxcZXwYFKkArFioc5GUPV21meCJbGuTAZthYQFJJvSW1F80np9xyRpM9fjrYyUwfN0/iNjZ94Tph/GV5Zf8DGikEWPWqAQDBbeVvPpt5E1U689i8ydO/kiASI5ypKL0hiqYy0oi+a5fCfTaPlPQnRp4p51W956BKb4+kGI8KY/9iNBpJt74DFigLkOeV8quQ/2QtqxyOh',
  }

}