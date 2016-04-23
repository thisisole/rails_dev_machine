class install_ruby {
  require install_postgres

  class{ 'rvm::rvmrc':
    max_time_flag => 20,  
    before  => Class['rvm'],
  }

  # rvm - http://rvm.io
  class { '::rvm': }

  rvm_system_ruby {
    'ruby-2.3.0':
      ensure      => 'present',
      default_use => true;
  }

  rvm_gem {
    'puppet':
      name         => 'puppet',
      ensure       => '4.4.1',
      ruby_version => 'ruby-2.3.0',
      require      => Rvm_system_ruby['ruby-2.3.0'];
    'bundler':
      name         => 'bundler',
      ruby_version => 'ruby-2.3.0',
      ensure       => latest,
      require      => Rvm_system_ruby['ruby-2.3.0'];
    'rails':
      name         => 'rails',
      ruby_version => 'ruby-2.3.0',
      ensure       => '5.0.0.beta3',
      require      => Rvm_system_ruby['ruby-2.3.0'];
    'ruby-2.3.0/pg':
      name         => 'pg',
      ruby_version => 'ruby-2.3.0',
      ensure       => '0.18.4',
      require      => Rvm_system_ruby['ruby-2.3.0'];
  }
}
