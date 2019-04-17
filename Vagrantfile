# vim: ft=ruby:ts=2:sw=2

def fordward(vagrant_config = "", port_list = [])
  port_list.each do |port|
    vagrant_config.vm.network "forwarded_port", guest: port, host: port
  end
end

Vagrant.configure("2") do |config|
  # Vagrant box
  config.vm.box = "archlinux/archlinux"

  # Shared folders
  config.vm.synced_folder "./sync", "/sync", create: true

  # Provider
  config.vm.provider 'virtualbox' do |vb|
    vb.name = "Devagrant"
    vb.memory = 1024
    vb.cpus = 2
  end

  # Hostname
  config.vm.hostname = "Devagrant"

  # Host only network
  config.vm.network "public_network", bridge: [
    "en0: Wi-Fi (Wireless)",
  ]

  # Fordward ports
  common_ports = [
    80,
    3000,
    4000,
    5000,
    8000,
    35035
  ]

  fordward(config, 8080..8090)
  fordward(config, common_ports)

  # Provisioning
  $script = <<-SCRIPT
  # Adding mirror list `Santo_Domingo` near(ish)
  sudo cp -f /vagrant/config/etc-pacman-d-mirrorlist /etc/pacman.d/mirrorlist

  echo "[Updating PKM]"
  sudo pacman --noconfirm -Syu
  sudo pacman --noconfirm -S base-devel git vim
  sudo ln -sf /usr/share/zoneinfo/America/Santo_Domingo /etc/localtime

  git clone https://github.com/cabaalexander/dotfiles.git

  cd dotfiles

  git remote remove origin
  git remote add origin git@github.com:cabaalexander/dotfiles.git

  make && PASSWORD="vagrant" make install
  SCRIPT

  # Clone my dotfiles repo and do the magic
  config.vm.provision "shell", inline: $script, privileged: false
end
