#!/bin/bash

source ./print.sh

# If not on macOS, exit.
if [ "$(uname -s)" != "Darwin" ]; then
  echo "This script is only available for macOS! Exiting..."
	exit 0
fi

# Close any open System Settings panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Settings" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Run all the preferences files

for f in preferences/*.sh; do
  file_name=$(basename $f .sh)
  name=${file_name//-/ }  # replace '-' with ' '
  message="Setting $name preferences"
  task $message
  #sleep 3 && success $message || fail $message;
  bash "$f" && success $message || fail $message;
done
