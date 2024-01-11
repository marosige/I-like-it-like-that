#!/usr/bin/env bash

###############################################################################
# Shells
###############################################################################

# Add fish into shells if missing. (Homebrew bug)
if ! grep -wq "/usr/local/bin/fish" /etc/shells; then
    echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
fi

# Set default shell for the current user
sudo chsh -s $(which fish)

# Download the onedark theme (https://github.com/rkbk60/onedark-fish)
#fisher rkbk60/onedark-fish
