#!/bin/bash
# vim:set ft=sh:ts=2:sw=2:st=2

CUR_PATH=$(cd "$(dirname "$0")"; pwd)
VIMFILES=$(cd "$(dirname "$CUR_PATH")"; pwd)

__vim__help() {
  cat <<-help

  Usage: vimfiles [options] [COMMAND] [config]

  Commands:
    vimfiles install            install vimfiles
    vimfiles initmodules        init submodules
    vimfiles updatemodules      update submodules

help
}

__vim__main() {
  case $1 in
    -i | install ) __vim__install ;;
    -im | initmodules ) __vim__initmodules ;;
    -um | updatemodules ) __vim__updatemodules ;;
    -h | help | * ) __vim__help ;;
  esac
}

__vim__install() {
  $CUR_PATH/install.sh
}

__vim__initmodules() {
  (cd $VIMFILES \
    && $CUR_PATH/initmodules.sh)
}

__vim__updatemodules() {
  (cd $VIMFILES \
    && $CUR_PATH/updatemodules.sh)
}

__vim__main "$@"
