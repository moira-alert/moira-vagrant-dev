# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "puppetlabs/centos-7.2-64-nocm"
  # config.vm.box_url = "http://atlas.hashicorp.com/centos/boxes/7"
  # config.vm.box_download_insecure = true
  config.vm.hostname = "moira-dev"

  config.vm.network "forwarded_port", guest: 80, host: 8888
  config.vm.network "forwarded_port", guest: 6379, host: 16379

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant","1"]
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "moira.yml"
    ansible.provisioning_path = "/vagrant/ansible"
    ansible.verbose  = false
    ansible.install  = true
    ansible.inventory_path = "/vagrant/inventory"
    ansible.limit = "app"
  end
end
