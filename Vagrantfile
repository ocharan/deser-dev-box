# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box 	= 'ubuntu/bionic64' # 18.04 LTS Oficial
  config.vm.hostname = 'deser-dev-box'

  # Provision box
  config.vm.provision :shell, privileged: false, run: 'once', path: 'provision/zsh_setup.sh', keep_color: true
  config.vm.provision :shell, privileged: false, run: 'once', 
    path: "provision/box_setup.zsh",
    keep_color: true, 
    env: {
      "LC_ALL"   => "en_US.UTF-8",
      "LANG"     => "en_US.UTF-8",
      "LANGUAGE" => "en_US.UTF-8",
    }

  config.vm.provider 'virtualbox' do |v|
    v.memory = ENV.fetch('DESER_DEV_BOX_RAM', 2048).to_i
    v.cpus   = ENV.fetch('DESER_DEV_BOX_CPUS', 2).to_i
  end
end