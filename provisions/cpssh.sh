#!/bin/bash

echo "[Provision] cpssh.sh"

main(){
  CONFIG_SSH=/vagrant/config/ssh/*
  SSH_PATH=${HOME}/.ssh

  if [ ! -d "${CONFIG_SSH}" ]
  then
    echo "[No './config/ssh/' found]"
    return 0
  fi

  # Clean id_rsa keys
  rm -rfv ${SSH_PATH}/id_rsa*

  # Copy ssh keys on the vagrant config folder to ~/.ssh
  cp -rfv ${CONFIG_SSH} ${SSH_PATH}

  # Only readable by you
  chmod -v 400 ${SSH_PATH}/id_rsa

  # Readable for others too
  chmod -v 644 ${SSH_PATH}/id_rsa.pub
}

main

