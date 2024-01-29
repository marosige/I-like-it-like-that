#!/usr/bin/env bash

cd $IGNITION_MAC
source ./print.sh

title "Installing my preferred enviroment:"

# If not on macOS, exit.
if [ "$(uname -s)" != "Darwin" ]; then
  echo "This script is only available for macOS! Exiting..."
	exit 1
fi

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Get an empty log file
log_file="$IGNITION_ROOT/ignition.installers.log"
rm "$log_file" &> /dev/null

INSTALLERS=(
  update              # update macOS
  directory-structure # create directories
  dotfiles            # link the dotfiles
  enviroment          # add enviromental variables
  homebrew            # install software
)

# Sources all the preference files
function source_installers {
  declare -a files=("${!1}")
  for file in "${files[@]}"; do
    file="${2}${file}.sh"
    [ -r "$file" ] && [ -f "$file" ] && source $file $log_file
  done;
}

source_installers INSTALLERS[@] "installers/"
