#!/bin/bash

### Hoew to
# Log tasks:
#   message="Task description"
#   task $message
#   command && success $message || fail $message;

message () {
  printf "\r\033[0m  $*\n"
}

title () {
  printf "\r\033[0;96m>\033[0m $*\n"
}

warn () {
  printf "\r\033[0;35m!\033[0m $*\n"
}

question () {
  printf "\r\033[0;33m?\033[0m $*\n"
}

task () {
  printf "\r\033[0;94m…\033[0m $*"
}

# Task doesn't have a \n at the end, because it should be overwritten with the next line: success or fail
# But sometimes the task message should be still visible, so it can be closed up! Also reset the color.
close () {
  printf "\n"
}

success () {
  printf "\r\033[2K\033[0;32m\xE2\x9C\x94\033[0m $*\n"
}

fail () {
  printf "\r\033[2K\033[0;31mx\033[0m $*\n"
}

confirm() {
  printf "\r\033[0;33m?\033[0m $*"
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
