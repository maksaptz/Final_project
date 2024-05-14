# -*- mode: ruby -*-
# vim: set ft=ruby :
#Path to HDD on host

Vagrant.configure(2) do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 1
  end

  config.vm.define "mysql" do |host|
    host.vm.box = "debian/bullseye64"
    host.vm.box_version = "11.20230615.1"
    host.vm.synced_folder '.', '/vagrant', disabled: true
    host.vm.hostname = "mysql"
    host.vm.network "private_network",
                     ip: "192.168.50.11",
                     adapter: 2
  end 

  config.vm.define "web" do |host|
    host.vm.box = "debian/bullseye64"
    host.vm.box_version = "11.20230615.1"
    host.vm.hostname = "web"
    host.vm.network "private_network",
                     ip: "192.168.50.10",
                     adapter: 2
    host.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/play.yml"
      ansible.inventory_path = "ansible/hosts"
      ansible.host_key_checking = "false"
      ansible.limit = "all"
    end              
  end

  # config.vm.define "replica" do |host|
  #   host.vm.box = "debian/bullseye64"
  #   host.vm.box_version = "11.20230615.1"
  #   host.vm.synced_folder '.', '/vagrant', disabled: true
  #   host.vm.hostname = "replica"
  #   host.vm.network "private_network",
  #                    ip: "192.168.50.12",
  #                    adapter: 2
  #   host.vm.provision "ansible" do |ansible|
  #     ansible.playbook = "ansible/play.yml"
  #     ansible.inventory_path = "ansible/hosts"
  #     ansible.host_key_checking = "false"
  #     ansible.limit = "all"
  #   end
  # end
# 
#  config.vm.define "backup" do |host|
#    host.vm.box = "debian/bullseye64"
#    host.vm.box_version = "11.20230615.1"
#    host.vm.hostname = "back"
#    host.vm.network "private_network",
#                     ip: "192.168.50.13",
#                    adapter: 2
#  end
#
  # config.vm.define "elk" do |host|
  #   config.vm.provider "virtualbox" do |v|
  #     v.memory = 6144
  #     v.cpus = 2
  #   end
  #   host.vm.box = "debian/bullseye64"
  #   host.vm.box_version = "11.20230615.1"
  #   host.vm.hostname = "elk"
  #   host.vm.network "private_network",
  #                   ip: "192.168.50.14",
  #                   adapter: 2
  #   host.vm.provision "ansible" do |ansible|host
  #     ansible.playbook = "ansible/play.yml"
  #     ansible.inventory_path = "ansible/hosts"
  #     ansible.host_key_checking = "false"
  #     ansible.limit = "all"
  #   end
  # end

#
  # config.vm.define "prometheus" do |host|
  #   host.vm.box = "debian/bullseye64"
  #   host.vm.box_version = "11.20230615.1"
  #   host.vm.hostname = "prometheus"
  #   host.vm.network "private_network",
  #                 ip: "192.168.50.15",
  #                 adapter: 2
  #   host.vm.network "forwarded_port", guest: 9090, host: 8080
  #   host.vm.network "forwarded_port", guest: 3000, host: 8081
  #   host.vm.provision "ansible" do |ansible|host
  #     ansible.playbook = "ansible/play.yml"
  #     ansible.inventory_path = "ansible/hosts"
  #     ansible.host_key_checking = "false"
  #     ansible.limit = "all"
  #   end
  # end
#
#  config.vm.define "alert" do |host|
#    host.vm.box = "debian/bullseye64"
#    host.vm.box_version = "11.20230615.1"
#    host.vm.hostname = "alert"
#    host.vm.network "private_network",
#                     ip: "192.168.50.16`",
#                     adapter: 2
#    host.vm.provision "ansible" do |ansible|
#      ansible.playbook = "ansible/play.yml"
#      ansible.inventory_path = "ansible/hosts"
#      ansible.host_key_checking = "false"
#      ansible.limit = "all"
#    end
#  end
end