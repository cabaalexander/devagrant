#!/bin/bash

echo "[Provision] sudo.sh"

# Imports
. /vagrant/sync/bin/utils.sh

# Set TimeZone to America/Santo_Domingo
echo "[Setting Timezone]"
timedatectl set-timezone America/Santo_Domingo

updateAPT

# General stuffs
installApp build-essential
installApp tree
installApp git
installApp tmux
installApp python3-pip


# Install NVIM
installApp software-properties-common
add-apt-repository -y ppa:neovim-ppa/unstable

updateAPT

installApp neovim

