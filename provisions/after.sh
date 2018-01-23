#!/bin/bash

gemInstall(){
  GEM=$1
  echo "[Installing Gem] ${GEM}"
  gem install ${GEM} &> /dev/null
}

echo "[Provision] after.sh"

# Run last commands after the `sudo` and `user` installation
# is done. With a fresh `bash` ( '~/.bashrc' sourced ).

# Gems
gemInstall neovim

# Install NVIM Plugins
echo "[Installing] NVIM Plugins"
nvim -c PluginInstall -c qa! &> /dev/null

# Compile `command-t` NVIM Plugin
echo "[Compiling] NVM Plugin 'command-t'"
(
cd ${HOME}/.config/nvim/bundle/command-t/ruby/command-t/ext/command-t
ruby extconf.rb
make
)

# Install TMUX plugins :: Taken from -> (https://github.com/tmux-plugins/tpm/issues/6#issuecomment-54520698)

# start a server but don't attach to it
tmux start-server

# create a new session but don't attach to it either
tmux new-session -d

# install the plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh

# killing the server is not required, I guess
tmux kill-server

