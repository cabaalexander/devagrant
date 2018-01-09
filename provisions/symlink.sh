#!/bin/bash

echo "[Provision] symlink.sh"

lnDir(){
  local SOURCE=$1
  local TARGET=$2

  if [ -z ${TARGET} ]
  then
    echo "[Error] Missing Target"
    return 1
  fi

  # This normalizes the local path i.e. `./some-directory`
  local SOURCE_ABS_PATH=$(cd ${SOURCE} 2> /dev/null; pwd)

  # If no `SOURCE_ABS_PATH` return
  if [ "${PWD}" = "${SOURCE_ABS_PATH}" ]
  then
    echo "[Error] Source not a valid path"
    return 1
  fi

  # Just the name of the source directory
  local SOURCE_BASENAME=$(basename ${SOURCE})
  local TARGET_ABS_PATH=${TARGET}${SOURCE_BASENAME}


  # This removes the directory to avoid `ln` overwrite error
  [ -d ${TARGET_ABS_PATH} ] && rm -rf ${TARGET_ABS_PATH}

  # Aaaaand... Action!
  ln -sfv ${SOURCE_ABS_PATH} ${TARGET}
}

# Dot files

DIR_PATH=/vagrant/sync/dot-files
FILE_NAMES=$(ls ${DIR_PATH})

for FILE_NAME in ${FILE_NAMES}
do
  ABSOLUTE_FILE_PATH=${DIR_PATH}/$FILE_NAME

  if [ -f $ABSOLUTE_FILE_PATH ]
  then
    ln -sfv ${ABSOLUTE_FILE_PATH} ${HOME}/.${FILE_NAME}
  fi
done

# Symlink to the '~/config/nvim' directory (Special case)

## If no '~/.config' directory create it (Just in this case)
CONFIG_PATH=${HOME}/.config
[ ! -d ${CONFIG_PATH} ] && mkdir -pv ${CONFIG_PATH}

# Directory symlinks
lnDir /vagrant/sync/nvim/ ${CONFIG_PATH}/
lnDir /vagrant/sync/bin/ ${HOME}/

# Copy ssh (Copy instead of `ln` because of permision)
cp -rf /vagrant/config/.ssh/ ${HOME}/
chmod 400 ~/.ssh/id_rsa*

# Basic settings for VIM (Not neovim)
# This needs to be at the bottom becase is a symlink of a symlink ¯\_(ツ)_/¯
ln -sfv ${CONFIG_PATH}/nvim/plugins/settings.vim ${HOME}/.vimrc

