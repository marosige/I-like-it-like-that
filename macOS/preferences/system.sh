#!/usr/bin/env bash

###############################################################################
# System
###############################################################################

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

info "Setting System Preferences"

# Set computer name
sudo scutil --set ComputerName "Gengar"
sudo scutil --set LocalHostName "Gengar"
