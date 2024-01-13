#!/usr/bin/env bash

###############################################################################
# Displays
###############################################################################

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

info "Setting Displays Preferences"

# Automatically adjust brightness
defaults write com.apple.BezelServices dAuto -bool true
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool true

# Subpixel font rendering on non-Apple LCDs
# 0 : Disabled
# 1 : Minimal
# 2 : Medium
# 3 : Smoother
# 4 : Strong
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

# Show mirroring options in the menu bar when available
defaults write com.apple.airplay showInMenuBarIfPresent -bool true
