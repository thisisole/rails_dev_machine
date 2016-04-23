# -*- mode: ruby -*-
Vagrant.configure(2) do |config|
  config.vm.box = "puppetlabs/debian-8.2-64-puppet"
  
  # provider config
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end

  # forwarded ports
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  # installing modules
  config.vm.provision "shell", :inline => <<-SHELL
    #modules
    puppet module install puppetlabs-apt --environmentpath /tmp/vagrant-puppet/environments/
    puppet module install puppetlabs-git --environmentpath /tmp/vagrant-puppet/environments/
    puppet module install saz-vim --environmentpath /tmp/vagrant-puppet/environments/
    puppet module install maestrodev-rvm --environmentpath /tmp/vagrant-puppet/environments/
    puppet module install golja-gnupg --environmentpath /tmp/vagrant-puppet/environments/
    puppet module install puppetlabs-postgresql --environmentpath /tmp/vagrant-puppet/environments/
    puppet module install puppetlabs-concat --environmentpath /tmp/vagrant-puppet/environments/
  SHELL

  config.vm.provision 'puppet' do |puppet|
    puppet.environment = 'development'
    puppet.environment_path = 'environments'
  end
end
