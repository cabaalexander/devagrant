#!/bin/bash

echo -e "\n[Provision] symlink.sh\n"

# Imports
. /vagrant/sync/bin/normalizepath.sh
. /vagrant/sync/bin/lndotfiles.sh
. /vagrant/sync/bin/lndir.sh

# If no '~/.config' directory create it (Just in this case)
CONFIG_PATH=${HOME}/.config
[ ! -d ${CONFIG_PATH} ] && mkdir -pv ${CONFIG_PATH}

# Dot files
lnDotFiles /vagrant/sync/dot-files
lnDotFiles /vagrant/config/dot-files

# Directory symlinks
lnDir /vagrant/sync/nvim/ ${CONFIG_PATH}/
lnDir /vagrant/sync/bin/ ${HOME}/

# Basic settings for VIM (Not neovim)
# This needs to be at the bottom becase is a symlink of a symlink ¯\_(ツ)_/¯
ln -sfv ${CONFIG_PATH}/nvim/plugins/settings.vim ${HOME}/.vimrc

