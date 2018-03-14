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
installApp software-properties-common

# Add repositories
add-apt-repository -y ppa:neovim-ppa/unstable
add-apt-repository -y ppa:ultradvorka/ppa

updateAPT

# After repositories are added
installApp neovim
installApp hh

