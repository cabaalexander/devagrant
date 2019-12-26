#!/bin/bash

mkdir -p ${HOME}/.ssh
cp -v /vagrant/config/id_* ${HOME}/.ssh

chmod 400 ${HOME}/.ssh/id_rsa

