#!/usr/bin/env bash

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

title "Setting my preferred system configuration:"

# Get an empty log file
log_file="ignition.log"
rm "$log_file"

error=false

# Run all the preferences files
for script in preferences/*.sh; do
  # Get the name of the preference script
  file_name=$(basename $script .sh)
  name=${file_name//-/ }  # replace '-' with ' '

  # Message describing the current script
  message="Setting $name preferences"

  # Print a task message with it
  task $message

  # Run the preference script, redirecting standard output and error
  # Change the task message to success or fail
  if output=$(bash $script 2>&1); then
    success $message
    echo "$message:" >> $log_file
  else
    error=true
    fail $message
    echo "!! ERROR $message !!" >> $log_file
  fi

  # Add the script output to the log
  echo "$output" >> $log_file

done

# Let the user know where to find the log if there was an error
if $error; then
  # Use readlink to get the full path
  full_path=$(readlink -f "$log_file")
  # Print the clickable full path
  warn "Check log for error messages: file://$full_path"
fi
