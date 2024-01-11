#!/usr/bin/env bash

###############################################################################
# Screenshot
###############################################################################

# Disable thumbnail after taking a screenshot
defaults write com.apple.screencapture show-thumbnail -bool false

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"
