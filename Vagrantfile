# vim: ft=ruby

Vagrant.configure("2") do |config|
  # Vagrant box
  config.vm.box = "ubuntu/xenial64"

  # Shared folders
  config.vm.synced_folder "./sync", "/sync", create: true
  
  # Provider
  config.vm.provider 'virtualbox' do |vb|
    vb.name = "Devagrant"
    vb.memory = 1024
    vb.cpus = 2
  end

  # Host only network
  config.vm.network "private_network", ip: "192.168.0.8"

  $script = <<-SCRIPT
  git clone https://gitlab.com/cabaalexander/dot-files.git

  cd dot-files

  git remote remove origin
  git remote add origin git@gitlab.com:cabaalexander/dot-files.git

  echo "[Updating APT]"
  sudo apt-get update &> /dev/null

  echo "[Installing] build-essentials"
  sudo apt-get install build-essential -y &> /dev/null

  make
  SCRIPT

  # Clone my dot-files repo and do the magic
  config.vm.provision "shell", inline: $script, privileged: false
end

