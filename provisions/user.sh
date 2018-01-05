#!/bin/bash

echo "[Provision] user.sh"

# nvm
echo "[NVM] Installing"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash &> /dev/null
echo "[NVM] Finished"

# VIM Vundle package manager
VUNDLE_PATH=${HOME}/.config/nvim/bundle/Vundle.vim
[ ! -d ${VUNDLE_PATH} ]                                                   \
  && git clone https://github.com/VundleVim/Vundle.vim.git ${VUNDLE_PATH} \
  || echo "Vundle already cloned"

# tmux package manager
TMUX_PATH=${HOME}/.tmux/plugins/tpm
[ ! -f ${TMUX_PATH} ]                                           \
  && git clone https://github.com/tmux-plugins/tpm ${TMUX_PATH} \
  || echo "Vundle already cloned"

