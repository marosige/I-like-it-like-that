#!/bin/bash

###############################################################################
# Menu bar
###############################################################################

# Show battery percentage
defaults write com.apple.controlcenter BatteryShowPercentage -bool true

# Show bluetooth icon
defaults write com.apple.controlcenter Bluetooth -int 18

# Show volume icon
defaults write com.apple.controlcenter Sound -int 18

# Hide text input menu
defaults write com.apple.TextInputMenu visible -bool false
