#!/bin/bash
CUR_PATH=$(cd "$(dirname "$0")"; pwd)
VIMFILES=$(cd "$(dirname "$CUR_PATH")"; pwd)

rm -rf ~/.vim
ln -sf $VIMFILES ~/.vim
ln -sf $VIMFILES/vimrc ~/.vimrc
ln -sf $VIMFILES/gvimrc ~/.gvimrc

(cd $VIMFILES \
  && $CUR_PATH/initmodules.sh \
  && $CUR_PATH/updatemodules.sh)
