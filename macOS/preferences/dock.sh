#!/usr/bin/env bash

###############################################################################
# Dock
###############################################################################

# Set dock icon standard size to 32px
defaults write com.apple.dock tilesize -int 32

# Set dock icon magnified size to 48px
defaults write com.apple.dock largesize -int 48

# Enable dock magnification
defaults write com.apple.dock magnification -bool true

# Lock the Dock size (disable the arrows to change it easily)
defaults write com.apple.dock size-immutable -bool true

# Set the minimize animation effect to scale
defaults write com.apple.dock mineffect -string scale

# Set do not display recent apps in the dock
defaults write com.apple.dock show-recents -bool false

# Scroll up on a Dock icon to show all Space's opened windows for an app.
defaults write com.apple.dock scroll-to-open -bool true

# Set dock position to the bottom
defaults write com.apple.dock orientation -string bottom

# Set display pinned apps in the dock (default)
defaults write com.apple.dock static-only -bool false

# Set disable dock auto hide (default)
defaults write com.apple.dock autohide -bool false

# Restart dock to apply changes
killall Dock
