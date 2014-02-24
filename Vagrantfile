# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      build_essential: {
        compiletime: true
      },
      docker: {
        version: '0.8.1'
      }
    }

    chef.run_list = [
      'build-essential',
      'docker',
    ]
  end
end
