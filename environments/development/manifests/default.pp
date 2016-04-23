node default {
  $user = 'ole'
  $databases = [development', 'test']

  class { 'developer':
    user => $user
  }

  class { 'git_clone': 
    user => $user
  }

  class { 'install_postgres':
    databases => $databases,
    user => $user
  }

  include 'install_ruby'
}

Exec {
  path => ['/usr/sbin', '/usr/bin', '/sbin', '/bin', '/usr/local/rvm/rubies/ruby-2.3.0/bin/']
}

class git_clone(String $user) {
  require developer

  exec {
     "cp /vagrant/known_hosts /home/${user}/.ssh/":
      user => $user   
  }
  ->
  exec {
    "cp /vagrant/my-private-key /home/${user}/.ssh/id_rsa":
      user => $user
  }
  ->
  exec {
    "chmod 700 /home/${user}/.ssh/id_rsa":
      user => $user
  }
  #->
  #exec {
  #  "git clone ssh://git@bitbucket.hencke.de:7999/auth/auth-service.git /home/${user}/auth-service":
  #    user => $user
  #}
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

