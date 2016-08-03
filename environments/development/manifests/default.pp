node default {
  $user = 'ole'
  $databases = ['development', 'test']

  class { 'developer':
    user => $user
  }

  class { 'configure_vim': 
    user => $user
  }

  class { 'install_postgres':
    databases => $databases,
    user => $user
  }

}

Exec {
  path => ['/usr/sbin', '/usr/bin', '/sbin', '/bin', '/usr/local/rvm/rubies/ruby-2.3.0/bin/']
}

class configure_vim(String $user) {
  require developer

  exec { "install vim plugins":
      command => "sh /vagrant/vim/configure_vim.sh",
      user => $user   
  }
  ->
  exec { "copy vimrc":
      command => "cp /vagrant/vim/.vimrc /home/${user}/.vimrc",
      user => $user
  }
}

stage { 'preinstall':
  before => Stage['main']
}

class apt_get_update {
  exec { 'apt-get -y update': }
}

class { 'apt_get_update':
  stage => preinstall
}

