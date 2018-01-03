#!/bin/bash

# Dot files

DIR_PATH=/sync/dot-files
FILE_PATHS=$(ls ${DIR_PATH})

for FILE_NAME in ${FILE_PATHS}
do
  ABSOLUTE_FILE_PATH=${DIR_PATH}/$FILE_NAME

  if [ -f $ABSOLUTE_FILE_PATH ]
  then
    ln -sfv ${ABSOLUTE_FILE_PATH} ${HOME}/.${FILE_NAME}
  fi
done

# nvim
ln -sfv /sync/nvim/ ${HOME}/.config/

# Basic settings for VIM (Not neovim)
ln -sfv ${HOME}/.config/nvim/plugins/settings.vim ${HOME}/.vimrc

