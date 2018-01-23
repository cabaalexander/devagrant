#!/bin/bash

echo "[Provision] sudo.sh"

# This is to install apps without showing a bunch stuffs on the stdout
install-app(){
  local APP=$1

  echo "[Installing] ${APP}"
  apt-get install -y ${APP} &> /dev/null
}

updateAPT(){
  echo "[Updating APT]"
  apt-get update &> /dev/null
}

updateAPT

# General stuffs
install-app tree
install-app git
install-app tmux
install-app python3-pip


# Install NVIM
install-app software-properties-common
add-apt-repository -y ppa:neovim-ppa/unstable

updateAPT

install-app neovim

