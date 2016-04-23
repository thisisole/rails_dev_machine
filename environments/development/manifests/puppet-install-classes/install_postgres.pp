class install_postgres(Array $databases, String $user) {
  $password = 'thisismypassword'

  require developer

  class { 
    'postgresql::globals':
      manage_package_repo => true,
      version             => '9.5',
      encoding            => 'UTF-8',
      locale              => 'en_US.UTF-8',
  }->
  class { 
    'postgresql::server': 
      ip_mask_deny_postgres_user => '0.0.0.0/32',
      ip_mask_allow_all_users    => '0.0.0.0/0',
      listen_addresses           => '*',
      ipv4acls                   => ['hostssl all johndoe 192.168.0.0/24 cert'],
      postgres_password          => $password,
  }

  class { 'postgresql::lib::devel': }

  class { 'postgresql::client': }

  postgresql::server::role { 
    $user:
      password_hash => postgresql_password($user, $password),
      superuser     => true,
  }

  postgresql::server::db {
    $databases:
      user     => $user,
      password => postgresql_password($user, $password);
  }

  $databases.each |Integer $index, String $value| { 
    postgresql::server::database_grant { 
      $value:
        privilege => 'ALL',
        db        => $value,
        role      => $user;
    }
  }

  $databases.each |Integer $index, String $value| { 
    postgresql::server::extension {
      $value:
        database  => $value,
        extension => 'uuid-ossp';
    } 
  }
}
