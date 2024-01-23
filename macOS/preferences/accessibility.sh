#!/bin/bash

###############################################################################
# Accessibility
###############################################################################

# Shake mouse cursor to locate
defaults write CGDisableCursorLocationMagnification -bool true

## Zoom

# Enable temporary zoom (Hold down ⌃⌥ to zoom when needed)
sudo defaults write com.apple.universalaccess closeViewPressOnReleaseOff -bool false

# Zoom using scroll gesture with the Ctrl (^) modifier key
sudo defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
sudo defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# Smooth Zoomed Images
sudo defaults write com.apple.universalaccess closeViewSmoothImages -bool false

# Follow the keyboard focus while zoomed
sudo defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

# Zoom Style
# Fullscreen: 0
# Picture-in-picture: 1
sudo defaults write com.apple.universalaccess closeViewZoomMode -int 0
