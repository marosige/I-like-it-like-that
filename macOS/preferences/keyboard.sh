#!/usr/bin/env bash

###############################################################################
# Keyboard
###############################################################################

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
sudo cp Ukelele/en_hu.keylayout /Library/Keyboard\ Layouts/
