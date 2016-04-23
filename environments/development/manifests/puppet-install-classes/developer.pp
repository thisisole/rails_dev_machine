class developer(String $user) {
  user {
    $user: 
      ensure     => present,
      password   => 'thisismypassword',
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
