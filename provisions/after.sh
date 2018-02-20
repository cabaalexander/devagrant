#!/bin/bash

echo "[Provision] after.sh"

# Imports
. /vagrant/sync/bin/utils.sh

# Gems
gemInstall neovim

# pip Install
pipInstall neovim

# Install NVIM Plugins
echo "[Installing] NVIM Plugins"
nvim -c PlugInstall -c qa! &> /dev/null

# Install TMUX plugins :: Taken from -> (https://github.com/tmux-plugins/tpm/issues/6#issuecomment-54520698)

# start a server but don't attach to it
tmux start-server

# create a new session but don't attach to it either
tmux new-session -d

# install the plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh

# killing the server is not required, I guess
tmux kill-server

