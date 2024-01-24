#!/bin/bash

###############################################################################
# Trackpad
###############################################################################

# Disable "natural" scrolling
#defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Tap to click for this user and for the login screen
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
#defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
#defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Map bottom right corner to right-click
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
#defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
#defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Tracking Speed
# 0: Slow
# 3: Fast
# 5: Max
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 4.5

# Haptic feedback
# 0: Light
# 1: Medium
# 2: Firm
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0

# Enable back and forward navigation with two finger horizontal scrolls. (e.g. in web browsers)
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true
