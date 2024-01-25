#!/usr/bin/env bash

# If not on macOS, exit.
if [ "$(uname -s)" != "Darwin" ]; then
  echo "This script is only available for macOS! Exiting..."
	exit 0
fi

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install all available updates
sudo softwareupdate -ia --verbose

INSTALLERS=(
  directory-structure # directory_structure __must__ be first
  dotfiles # Dotfiles __must__ be installed before Homebrew
  homebrew # Homebrew __must__ be installed before other tools
)

# Sources all the preference files
function source_installers {
  declare -a files=("${!1}")
  for file in "${files[@]}"; do
    file="${2}${file}.sh"
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
  done;
}

source_installers INSTALLERS[@] "installers/"
