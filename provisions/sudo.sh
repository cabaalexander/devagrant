#!/bin/bash

apt-get update

# General stuffs
apt-get install -y tree
apt-get install -y git
apt-get install -y xclip
apt-get install -y tmux
apt-get install -y python3-pip


# Install NVIM
apt-get install -y software-properties-common
add-apt-repository -y ppa:neovim-ppa/unstable
apt-get update
apt-get install -y neovim

