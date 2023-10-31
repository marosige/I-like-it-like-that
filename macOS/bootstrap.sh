#!/bin/bash

# To run do: curl https://example.com/bootstrap.sh | bash && source ~/.profile
#
# This script will:
# * install Homebrew - https://brew.sh/
# * install git - https://git-scm.com/download/mac
# * install Mac App Store CLI - https://github.com/mas-cli/mas
# * install gum - https://github.com/charmbracelet/gum
# * sparse checkout the macOS part of this repository into ~/.dotfiles
# * run install.sh from this repo

function is_command_exists () {
    type "$1" &> /dev/null
}

# Clean prompt
clear

echo "Welcome to Gergő's macOS daily driver setup!"
echo "This script will install a bunch of applications and change a lot of settings."
echo "It is an irreversible process, use at your own risk!"
read -p "Do you want to continue? [Y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]] ; then
  echo "Installing dependencies..."
  if ! is_command_exists brew ; then /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" ; fi
  if ! is_command_exists git ; then brew install git ; fi
  if ! is_command_exists mas ; then brew install mas ; fi
  if ! is_command_exists gum ; then brew install gum ; fi

  echo "Sparse cloning the macOS part of the repository..."
  git clone --no-checkout https://github.com/marosige/I-like-it-like-that ~/.dotfiles
  git -C ~/.dotfiles sparse-checkout init --cone
  git -C ~/.dotfiles sparse-checkout set macOS/ dotfiles/
  git -C ~/.dotfiles checkout main

  echo "Starting the install script..."
  source ~/.dotfiles/macOS/install.sh

else
    echo "Installation cancelled, exiting..."
    exit
fi
