node default {
  $user = 'ole'
  $databases = ['development', 'test']

  class { 'developer':
    user => $user
  }

#currently not working :-(
#  class { 'configure_vim': 
#    user => $user
#  }

  class { 'install_postgres':
    databases => $databases,
    user => $user
  }

  include 'install_ruby'
}

Exec {
  path => ['/usr/sbin', '/usr/bin', '/sbin', '/bin', '/usr/local/rvm/rubies/ruby-2.3.0/bin/']
}

class configure_vim(String $user) {
  require developer

  exec {
     "sh /vagrant/vim/configure_vim.sh":
      user => $user   
  }
  ->
  exec {
    "cp /vagrant/vim/.vimrc /home/${user}/.vimrc":
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

