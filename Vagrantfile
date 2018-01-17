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

    vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000 ]
  end

  # Provisions
  config.vm.provision "shell", path: 'provisions/sudo.sh', privileged: true
  config.vm.provision "shell", path: 'provisions/symlink.sh', privileged: false
  config.vm.provision "shell", path: 'provisions/cpssh.sh', privileged: false
  config.vm.provision "shell", path: 'provisions/user.sh', privileged: false
  config.vm.provision "shell", path: 'provisions/after.sh', privileged: false
end

