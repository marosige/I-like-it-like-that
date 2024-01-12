#!/usr/bin/env bash

###############################################################################
# Finder
###############################################################################

# Set show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Set show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Set default view style to column view
defaults write com.apple.finder FXPreferredViewStyle -string clmv

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Set keep folders on top (default)
defaults write com.apple.finder _FXSortFoldersFirst -bool false

# Set changing file extension warning (default)
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool true

# Set sidebar icon size to 2 (default)
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Search scope
# This Mac       : `SCev`
# Current Folder : `SCcf`
# Previous Scope : `SCsp`
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid writing of .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Restart finder to apply changes
killall Finder
