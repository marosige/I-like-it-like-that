#!/usr/bin/env bash

message () {
  printf "  $1\n"
}

warn () {
  printf "\r\033[1;35m!\033[0;1m $1\n"
}

question () {
  printf "\r\033[1;33m?\033[0;1m $1\n"
}

task () {
  printf "\r\033[1;34m.\033[0;1m $1"
}

success () {
  printf "\r\033[2K\033[1;32m\xE2\x9C\x94\033[0;1m $1\n"
}

fail () {
  printf "\r\033[2K\033[1;31mx\033[0;1m $1\n"
}

confirm() {
  printf "\r\033[1;33m? \033[0;1m$1\033[0m"
  read -r -p " [Y/n] " response
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
