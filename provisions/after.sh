#!/bin/bash

echo "[Provision] after.sh"

# Run last commands after the `sudo` and `user` installation
# is done. With a fresh `bash` ( '~/.bashrc' sourced ).

# Install NVIM Plugins
echo "[NVIM] Installing Plugins"
nvim -c PluginInstall -c qa! &> /dev/null
echo "[NVIM] Plugin Installed"

# Install TMUX plugins :: Taken from -> (https://github.com/tmux-plugins/tpm/issues/6#issuecomment-54520698)

# start a server but don't attach to it
tmux start-server

# create a new session but don't attach to it either
tmux new-session -d

# install the plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh

# killing the server is not required, I guess
tmux kill-server

