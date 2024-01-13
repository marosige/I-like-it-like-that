#!/usr/bin/env bash

###############################################################################
# Keyboard
###############################################################################

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

info "Setting Keyboard Preferences"

# Enable character repeat while key held down
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set key repeat rate (minimum 1)
# Off: 300000
# Slow: 120
# Fast: 2
defaults write NSGlobalDomain KeyRepeat -int 2

# Set delay until repeat (in milliseconds)
# Long: 120
# Short: 15
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Install my keyboard layout
sudo cp keyboard/en_hu.keylayout /Library/Keyboard\ Layouts/

# Set my keyboard layout
