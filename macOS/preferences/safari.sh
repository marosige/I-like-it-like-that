#!/usr/bin/env bash

###############################################################################
# Safari
###############################################################################

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

info "Setting Safari Preferences"

# Show full website address in Safari
# On: true
# Off: False
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
