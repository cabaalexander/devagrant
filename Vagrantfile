# vim: ft=ruby

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
  config.vm.hostname = "Devagrant-HOST"

  # Host only network
  config.vm.network "public_network", :bridge => "wlan0"

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

  make && make install
  SCRIPT

  # Clone my dotfiles repo and do the magic
  config.vm.provision "shell", inline: $script, privileged: false
end

