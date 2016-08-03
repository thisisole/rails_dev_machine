class developer(String $user) {
  user {
    $user: 
      ensure     => present,
      password   => '$1$Etg2ExUZ$XB3UoP1zJFjSf7l9S0GM20',
      shell      => '/bin/bash',
      home       => "/home/${user}",
      managehome => true,
      system     => true,
      groups     => ['sudo'],
      comment    => 'default dev user'
  }

  # home direcory
  file { 
    "/home/${user}":
      ensure  => "directory",
      owner   => $user,
      group   => $user,
      mode    => '0700',
      require =>  [ User[$user] ],                      
  }
  ->
  file { 
    "/home/${user}/.ssh":
      ensure  => "directory",
      owner   => $user,
      group   => $user,
      mode    => '0700',
      require =>  [ User[$user] ],                      
  }

  class { 'git': }
  class { 'vim': }
}
