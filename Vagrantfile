# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  web_ip = "192.168.56.10"
  db_ip  = "192.168.56.20"
  db_forward_port = 3307
  db_mysql_port = 3306

  # Machine Web (Ubuntu)
  config.vm.define "web-server" do |web|
    web.vm.box = "ubuntu/jammy64"
    web.vm.hostname = "web-server"
    web.vm.network "public_network", bridge: "auto"
    web.vm.network "private_network", ip: web_ip
    web.vm.synced_folder "./website", "/var/www/html", create: true
    web.vm.provision "shell", path: "scripts/provision-web-ubuntu.sh"
    web.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 4
    
    end
  end

  # Machine Database (CentOS)
  config.vm.define "db-server" do |db|
    db.vm.box = "centos/stream9"
    db.vm.hostname = "db-server"
    db.vm.network "private_network", ip: db_ip
    db.vm.network "forwarded_port", guest: db_mysql_port, host: db_forward_port, auto_correct: true
    db.vm.provision "shell", path: "scripts/provision-db-centos.sh"
    db.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
  end
end
