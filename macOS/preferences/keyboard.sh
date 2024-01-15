#!/usr/bin/env bash

###############################################################################
# Keyboard
###############################################################################

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

info "Setting Keyboard Preferences"

# Key repeat

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

## Custom keyboard layout setup

# Install my keyboard layout
sudo cp keyboard/en_hu.keylayout /Library/Keyboard\ Layouts/

# Enable the input menu in the menu bar
defaults write com.apple.TextInputMenu visible -bool true

# Add an additional input source to the list of input sources: en_hu
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>1111</integer><key>KeyboardLayout Name</key><string>en_hu</string></dict>'
