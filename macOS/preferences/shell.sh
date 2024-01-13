#!/usr/bin/env bash

###############################################################################
# Shell
###############################################################################

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

info "Setting Shell Preferences"

# Add fish into shells if missing. (Homebrew bug)
if ! grep -wq "/usr/local/bin/fish" /etc/shells; then
    echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
fi

# Set fish as default shell for the current user
sudo chsh -s $(which fish)

# Download the onedark theme (https://github.com/rkbk60/onedark-fish)
#fisher rkbk60/onedark-fish
