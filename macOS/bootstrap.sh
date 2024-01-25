#!/usr/bin/env bash

# This script will:
# * install Homebrew - https://brew.sh/
# * install git - https://git-scm.com/download/mac
# * sparse checkout the macOS part of this repository into ~/bin/ignition
# * run install.sh from this repo

source <(curl -s https://raw.githubusercontent.com/marosige/I-like-it-like-that/main/macOS/print.sh)

function is_command_exists () {
    type "$1" &> /dev/null
}

# If not on macOS, exit.
if [ "$(uname -s)" != "Darwin" ]; then
  echo "This script is only available for macOS! Exiting..."
	exit 0
fi

echo "Welcome to Gergő's macOS daily driver setup!"
echo "This script will install a bunch of applications and change a lot of settings."
echo "It is an irreversible process, use at your own risk!"
read -p "Do you want to continue? [Y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]] ; then
  echo "Installing dependencies..."
  if ! is_command_exists brew ; then /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" ; fi
  if ! is_command_exists git ; then brew install git ; fi

  folder=~/.ignition

  echo "Sparse cloning the macOS part of the repository..."
  git clone --no-checkout https://github.com/marosige/I-like-it-like-that $folder
  git -C $folder sparse-checkout init --cone
  git -C $folder sparse-checkout set macOS/ dotfiles/
  git -C $folder checkout main

  echo "Starting the install script..."
  source $folder/macOS/ignition.sh

else
    echo "Installation cancelled, exiting..."
    exit
fi
