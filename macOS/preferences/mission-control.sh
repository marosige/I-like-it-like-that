#!/usr/bin/env bash

###############################################################################
# Mission Control
###############################################################################

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

info "Setting Mission Control Preferences"

# Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# When switching to an application, switch to a Space with open windows for the application
defaults write NSGlobalDomain AppleSpacesSwitchOnActivate -bool true

# Displays have seperate Spaces
defaults write com.apple.spaces spans-displays -bool false
