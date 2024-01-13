#!/usr/bin/env bash

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

info "Starting the installation process"
bash install.sh
info "Setting preferences"
bash preferences.sh
info "Telling what to do next"
bash todo.sh
