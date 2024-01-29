#!/usr/bin/env bash

# This script will:
# * install Homebrew - https://brew.sh/
# * install git - https://git-scm.com/download/mac
# * sparse checkout the macOS part of this repository into ~/bin/ignition
# * run ignition.sh from this repo

source <(curl -s https://raw.githubusercontent.com/marosige/I-like-it-like-that/main/macOS/print.sh)
source <(curl -s https://raw.githubusercontent.com/marosige/I-like-it-like-that/main/dotfiles/env/.env.sh)

function is_command_exists () {
    type "$1" &> /dev/null
}

# If not on macOS, exit.
if [ "$(uname -s)" != "Darwin" ]; then
  fail "This script is only available for macOS! Exiting..."
	exit 1
fi

# Get an empty log file
log_file="$IGNITION_ROOT/ignition.bootstrap.log"
rm "$log_file" &> /dev/null
exit=0

if [ -d "$IGNITION_ROOT/.git" ]; then
  cd $IGNITION_MAC
  task="Updating ignition"
  task $task
  git pull >> $log_file 2>&1 && success $task || fail $task
  bash ignition.sh
else
  title "Welcome to Gergő's macOS daily driver setup!"
  message "This script is designed to set up your environment by performing the following actions:"
  message "1. Downloading Ignition into $IGNITION_ROOT"
  message "2. Installing various applications and tools."
  message "3. Configuring system settings and preferences."
  info "Please be aware that running this script will modify your system and may affect your existing configurations."
  message "Ensure you have reviewed the script and understand the changes it will make before proceeding: https://github.com/marosige/ignition"
  warn "IMPORTANT: Backup any important configurations or data before running this script."
  bold "It is an irreversible process. Once the setup is complete, reverting the changes may be challenging."
  if confirm "Do you want to continue?" ; then
    t "Installing dependencies."
    if ! is_command_exists brew ; then /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" ; fi
    if ! is_command_exists git ; then brew install git ; fi

    t "Sparse cloning the macOS part of the repository."
    git clone --no-checkout https://github.com/marosige/I-like-it-like-that $IGNITION_ROOT  >> $log_file 2>&1
    git -C $IGNITION_ROOT sparse-checkout init --cone  >> $log_file 2>&1
    git -C $IGNITION_ROOT sparse-checkout set macOS/ dotfiles/  >> $log_file 2>&1
    git -C $IGNITION_ROOT checkout main  >> $log_file 2>&1

    t "Starting the setup process."
    cd $IGNITION_MAC
    bash ignition.sh -y
  else
      fail "Setup aborted. No changes have been made."
  fi
fi
