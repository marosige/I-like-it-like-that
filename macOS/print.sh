#!/usr/bin/env bash

message () {
  printf "\r\033[0m  $1\n"
}

warn () {
  printf "\r\033[0;35m!\033[0m $1\n"
}

question () {
  printf "\r\033[0;33m?\033[0m $1\n"
}

task () {
  printf "\r\033[5;34m.\033[0m $1"
}

success () {
  printf "\r\033[2K\033[0;32m\xE2\x9C\x94\033[0m $1\n"
}

fail () {
  printf "\r\033[2K\033[0;31mx\033[0m $1\n"
  if [ "$1" = "-x" ]; then
    echo ''
    exit
  fi
}

confirm() {
  printf "\r\033[0;33m?\033[0m $1"
  read -r -p $'\033[0;1m [Y/n] \033[0m' response
  case "$response" in
      [yY][eE][sS]|[yY])
          true
          ;;
      *)
          false
          ;;
  esac
}

choose () {
  # todo make it yellow as the question text
  gum choose $@
}
