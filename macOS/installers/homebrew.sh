#!/usr/bin/env bash

###############################################################################
# Homebrew
###############################################################################

# Install Homebrew if not installed - brew.sh
if ! hash brew 2>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Make sure we are using the latest Homebrew
brew update

# Upgrade existing packages
brew upgrade

# Install CLI tools & GUI applications
brew bundle --file=installers/homebrew/Brewfile

# Remove outdated versions from the cellar including casks
brew cleanup && brew prune
