# vim: ft=ruby:ts=2:sw=2
require 'yaml'

def set_shared_directories(vagrant_config = "")
  file_path = 'config/shared_folders.conf'

  unless File.file?(file_path)
    puts "Not '" + file_path + "' found"
    return
  end

  shared_folders = YAML.load_file(file_path)

  shared_folders["paths"].each do |path|
    host_path = path
    vagrant_path = "/home/vagrant/sync-".concat(File.basename(path))

    if File.exists?(path)
      vagrant_config.vm.synced_folder host_path, vagrant_path, create: true
    end
  end
end

def fordward(vagrant_config = "", port_list = [])
  port_list.each do |port|
    vagrant_config.vm.network "forwarded_port", guest: port, host: port
  end
end

Vagrant.configure("2") do |config|
  # Vagrant box
  config.vm.box = "terrywang/archlinux"

  # Shared folders
  config.vm.synced_folder "./sync", "/sync", create: true
  set_shared_directories(config)

  # # Use this in case of no internet connection ¯\\_(ツ)_/¯
  # config.vm.provider :virtualbox do |vb|
  #   vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  # end

  # Provider
  config.vm.provider 'virtualbox' do |vb|
    vb.name = "Devagrant"
    vb.memory = 1024
    vb.cpus = 2
  end

  # Hostname
  config.vm.hostname = "Devagrant"

  # Host only network
  config.vm.network :public_network, bridge: [
    "en0: Wi-Fi (Wireless)"
  ]

  # Fordward ports
  common_ports = [
    3000,
    4000,
    5000,
    8000,
    35035
  ]

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

  make && make install
  SCRIPT

  # Clone my dotfiles repo and do the magic
  config.vm.provision "shell", env: {"PASSWORD" => "vagrant"}, inline: $script, privileged: false
end
