#!/usr/bin/env bash

###############################################################################
# Screenshot
###############################################################################

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

info "Setting Screenshot Preferences"

# Disable thumbnail after taking a screenshot
defaults write com.apple.screencapture show-thumbnail -bool false

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"
