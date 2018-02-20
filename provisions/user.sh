#!/bin/bash

echo "[Provision] user.sh"

# NVM
echo "[Installing] NVM"
(
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
) &> /dev/null

# Refresh $PATH env variable
source ${HOME}/.profile

# Install node v9.5.0
echo "[Installing] node v9.5.0"
(
nvm i 9.5
) &> /dev/null

# Ruby
echo "[Installing] Ruby"
(
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby
) &> /dev/null

# TMUX package manager
TMUX_PATH=${HOME}/.tmux/plugins/tpm
[ ! -f ${TMUX_PATH} ]                                           \
  && git clone https://github.com/tmux-plugins/tpm ${TMUX_PATH} \
  || echo "[Vundle already cloned]"

