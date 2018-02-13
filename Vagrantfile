Vagrant.configure("2") do |config|
  # Vagrant box
  config.vm.box = "ubuntu/xenial64"

  # Shared folders
  config.vm.synced_folder ENV["PROJECTS"], "/projects"
  
  # Provider
  config.vm.provider 'virtualbox' do |vb|
    vb.name = "Devagrant"
    vb.memory = 1024
    vb.cpus = 2
  end

  # Host only network
  config.vm.network "private_network", ip: "192.168.0.8"

  # Provisions
  config.vm.provision "shell", path: 'provisions/sudo.sh', privileged: true
  config.vm.provision "shell", path: 'provisions/symlink.sh', privileged: false
  config.vm.provision "shell", path: 'provisions/cpssh.sh', privileged: false
  config.vm.provision "shell", path: 'provisions/user.sh', privileged: false
  config.vm.provision "shell", path: 'provisions/after.sh', privileged: false
end

