#!/bin/bash

###############################################################################
# Dock
###############################################################################

## Dock preferences

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

## Dock items

# Clear the dock
dockutil --remove all --no-restart

# Sleep 1 second, because quickly calling dockutil can cause issues
sleep 1

# Add persistent-apps
dockutil --add '' --type small-spacer --section apps --no-restart
dockutil --add '/Applications/Google Chrome.app' --no-restart
dockutil --add '/Applications/Spotify.app' --no-restart
dockutil --add '' --type small-spacer --section apps --no-restart
dockutil --add '/Applications/Messenger.app' --no-restart
dockutil --add '/System/Applications/Messages.app' --no-restart
dockutil --add '/Applications/WhatsApp.app' --no-restart
dockutil --add '' --type small-spacer --section apps --no-restart
dockutil --add '/System/Applications/Calendar.app' --no-restart
dockutil --add '/System/Applications/Reminders.app' --no-restart
dockutil --add '/System/Applications/Notes.app' --no-restart
dockutil --add '/Applications/1Password.app' --no-restart
dockutil --add '/System/Applications/Utilities/Screenshot.app' --no-restart
dockutil --add '' --type small-spacer --section apps --no-restart
dockutil --add '/Applications/Slack.app' --no-restart
dockutil --add '/Users/'$(id -un)'/Applications/Chrome Apps.localized/Google Meet.app/' --no-restart
dockutil --add '' --type small-spacer --section apps --no-restart
#dockutil --add '/System/Applications/Utilities/Terminal.app' --no-restart
dockutil --add '/Applications/kitty.app' --no-restart
dockutil --add '/Applications/GitKraken.app' --no-restart
dockutil --add '/Applications/Atom.app' --no-restart
dockutil --add '/Applications/Android Studio.app' --no-restart
dockutil --add '/Applications/Charles.app' --no-restart
dockutil --add '/System/Applications/QuickTime Player.app' --no-restart
dockutil --add '' --type small-spacer --section apps --no-restart

# Add persistent-others
dockutil --add '~/Downloads' --view fan --display stack --sort dateadded --no-restart

# Sleep 1 second, because quickly calling dockutil can cause issues
sleep 1

# Restart dock to apply changes
killall Dock
