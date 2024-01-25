#!/usr/bin/env bash

###############################################################################
# Homebrew
###############################################################################

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

info "Installing Homebrew Applications"

# Install Homebrew if not installed - brew.sh
if ! hash brew 2>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure we are using the latest Homebrew
brew update

# Upgrade existing packages
brew upgrade

# Install CLI tools & GUI applications
brew bundle

# Remove outdated versions from the cellar including casks
brew cleanup
