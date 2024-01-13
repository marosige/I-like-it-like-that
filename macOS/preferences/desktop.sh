#!/usr/bin/env bash

###############################################################################
# Desktop
###############################################################################

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

info "Setting Desktop Preferences"

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
# wvous-*-corner:
# tl: top left
# tr: top right
# bl: top left
# br: bottom right

# Disable hot corners
# 0: No Option
# 2: Mission Control
# 3: Show application windows
# 4: Desktop
# 5: Start screen saver
# 6: Disable screen saver
# 7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-br-corner -int 0

# Disable hot corner modifiers (to activate hot corner a key must be held)
# 0: No Modifier
# 131072: Shift Key
# 262144: Control Key
# 524288: Option Key
# 1048576: Command Key
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0
defaults write com.apple.dock wvous-br-modifier -int 0

# Restart finder & dock to apply changes
killall Finder
killall Dock
