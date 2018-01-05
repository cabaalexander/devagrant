#!/bin/bash

echo "[Provision] symlink.sh"

# Dot files

DIR_PATH=/vagrant/sync/dot-files
FILE_NAMES=$(ls ${DIR_PATH})

for FILE_NAME in ${FILE_NAMES}
do
  ABSOLUTE_FILE_PATH=${DIR_PATH}/$FILE_NAME

  if [ -f $ABSOLUTE_FILE_PATH ]
  then
    ln -sfv ${ABSOLUTE_FILE_PATH} ${HOME}/.${FILE_NAME}
  fi
done

# Symlink to the '~/config/nvim' directory (Special case)

## If no '~/.config' directory create it
CONFIG_PATH=${HOME}/.config
[ ! -d ${CONFIG_PATH} ] && mkdir -pv ${CONFIG_PATH}

## If '~/.config/nvim' directory remove it to avoid `ln` overwrite error
NVIM_CONFIG_PATH=${CONFIG_PATH}/nvm

## Then create the symlink
[ -d ${NVIM_CONFIG_PATH} ] && rm -rfv ${NVIM_CONFIG_PATH}
ln -sfv /vagrant/sync/nvim/ ${HOME}/.config/

# Symlink to the '~/bin' directory (Special case)

## If '~/bin' directory remove it to avoid `ln` overwrite error
BIN_PATH=${HOME}/bin
[ -d ${BIN_PATH} ] && rm -rfv ${BIN_PATH}

## Then create the symlink
ln -sfv /vagrant/sync/bin/ ${HOME}/

# Basic settings for VIM (Not neovim)
ln -sfv ${HOME}/.config/nvim/plugins/settings.vim ${HOME}/.vimrc

