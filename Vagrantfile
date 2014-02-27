# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64-docker"
  config.vm.box_url = "http://192.168.2.31/vagrant/boxes/ubuntu-12.04-docker.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 9200, host: 9200

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      build_essential: {
        compiletime: true
      }
    }

    chef.run_list = [
      'build-essential',
      'golang',
    ]
  end
end
