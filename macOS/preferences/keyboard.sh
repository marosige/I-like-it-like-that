#!/bin/bash

###############################################################################
# Keyboard
###############################################################################

# Full Keyboard Access
# In windows and dialogs, press Tab to move keyboard focus between:
# 1 : Text boxes and lists only
# 3 : All controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 1

# Use F1, F2, etc. keys as standard function keys
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool false

# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

## Autocorrect

# Correct spelling automatically: off
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Continuously check spelling in (most) text views: off
defaults write NSGlobalDomain NSAllowContinuousSpellChecking -bool false

# Automatic capitalization: off
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Use automatic period substitution: off
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Use smart dashes: off
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Use smart quotes: off
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Set Double and Single quotes
defaults write NSGlobalDomain NSUserQuotesArray -array '"\""' '"\""' '"'\''"' '"'\''"'

## Backlight

# Adjust keyboard brightness in low light
defaults write com.apple.BezelServices kDim -bool true
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool true

# Dim keyboard after idle time (in seconds)
dim_timeout=300
defaults write com.apple.BezelServices kDimTime -int $dim_timeout
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Keyboard Dim Time" -int $dim_timeout

## Key repeat

# Enable character repeat while key held down
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set key repeat rate (minimum 1)
# Off: 300000
# Slow: 120
# Fast: 2
defaults write NSGlobalDomain KeyRepeat -int 2

# Set delay until repeat (in milliseconds)
# Long: 120
# Short: 15
defaults write NSGlobalDomain InitialKeyRepeat -int 15

## Custom keyboard layout setup

# Delete the default layouts (US)
defaults delete com.apple.HIToolbox AppleEnabledInputSources

# Add an additional input source to the list of input sources: en_hu
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>1111</integer><key>KeyboardLayout Name</key><string>en_hu</string></dict>'
