Vagrant.configure("2") do |config|
  # Vagrant box
  config.vm.box = "ubuntu/xenial64"

  # Shared folders
  config.vm.synced_folder "sync/nvim", "/sync/nvim"
  config.vm.synced_folder "sync/dot-files", "/sync/dot-files"
  config.vm.synced_folder ENV["PROJECTS"], "/projects"
  
  # Provider
  config.vm.provider 'virtualbox' do |vb|
    vb.name = "Devagrant"
    vb.memory = 1024
    vb.cpus = 2

    vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000 ]
    vb.customize [ "modifyvm", :id, "--clipboard", "bidirectional" ]
  end

  # Provisions
  config.vm.provision "shell", path: 'provisions/sudo.sh', privileged: true
  config.vm.provision "shell", path: 'provisions/user.sh', privileged: false
  config.vm.provision "shell", path: 'provisions/symlink.sh', privileged: false
end

