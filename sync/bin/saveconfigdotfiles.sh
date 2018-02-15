#!/bin/bash

main(){
  CONFIG_DOT_FILES=$(ls /vagrant/config/dot-files)
  ROOT_FILES=$(ls -a ${HOME})

  for FILE in ${CONFIG_DOT_FILES}
  do
    EXISTS=$(echo ${ROOT_FILES} | grep "${FILE}")
    if [ -n "${EXISTS}" ]
    then
      cp -vf ${HOME}/.${FILE} /vagrant/config/dot-files/${FILE}
    fi
  done
}

main

