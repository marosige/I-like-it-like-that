#!/bin/bash

###############################################################################
# Desktop
###############################################################################

## Window Manager

# Click wallpaper to reveal desktop
# Always: true
# Only in Stage Manager: false
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

## Things on desktop

# Icons on desktop
# Show: true
# Hide: false
defaults write com.apple.finder CreateDesktop -bool true

# Hard disks on desktop
# Show: true
# Hide: false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

# External disks on desktop
# Show: true
# Hide: false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# Removable media (CDs, DVDs and iPods) on desktop
# Show: true
# Hide: false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Connected servers on desktop
# Show: true
# Hide: false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

## Hot Corners
# Corner location in wvous-*-corner:
# top left: tl
# top right: tr
# bottom left: bl
# bottom right: br

# Hot corner options
# No Option: 0
# Mission Control: 2
# Show application windows: 3
# Desktop: 4
# Start screen saver: 5
# Disable screen saver: 6
# Dashboard: 7
# Put display to sleep: 10
# Launchpad: 11
# Notification Center: 12
# Lock Screen: 13
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-br-corner -int 0

# Modifiers to activate hot corner (key must be held)
# No Modifier: 0
# Shift Key: 131072
# Control Key: 262144
# Option Key: 524288
# Command Key: 1048576
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0
defaults write com.apple.dock wvous-br-modifier -int 0

# Restart finder & dock to apply changes
killall Finder
killall Dock
