Vagrant.configure("2") do |config|
  # Vagrant box
  config.vm.box = "ubuntu/xenial64"

  # Shared folders
  config.vm.synced_folder "./data", "/data", create: true
  
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

  ./install-it.sh
  SCRIPT

  # Clone my dot-files repo and do the magic
  config.vm.provision "shell", inline: $script, privileged: false
end

