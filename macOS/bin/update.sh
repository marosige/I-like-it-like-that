#!/bin/bash

# If not on macOS, exit.
if [ "$(uname -s)" != "Darwin" ]; then
  echo "This script is only available for macOS! Exiting..."
	exit 0
fi

# Upgrade homebrew packages
brew update
brew upgrade

# Update Mac App Store applications
mas upgrade

# Update macOS
softwareupdate --install --all #--restart
