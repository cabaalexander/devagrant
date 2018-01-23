#!/bin/bash

echo "[Provision] cpssh.sh"

SSH_PATH=${HOME}/.ssh

# Clean id_rsa keys
rm -rfv ${SSH_PATH}/id_rsa*

# Copy ssh keys on the vagrant config folder to ~/.ssh
cp -rfv /vagrant/config/ssh/* ${SSH_PATH}

# Only readable by you
chmod -v 400 ${SSH_PATH}/id_rsa

# Readable for others too
chmod -v 644 ${SSH_PATH}/id_rsa.pub

