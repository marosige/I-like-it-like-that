#!/usr/bin/env bash

###############################################################################
# Trackpad
###############################################################################

# Tracking Speed
# 0: Slow
# 3: Fast
# 5: Max
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 5.0

# Haptic feedback
# 0: Light
# 1: Medium
# 2: Firm
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0
