#!/usr/bin/env bash

cd $IGNITION_MAC
source ./print.sh

title "Setting my preferred system configuration:"

# If not on macOS, exit.
if [ "$(uname -s)" != "Darwin" ]; then
  echo "This script is only available for macOS! Exiting..."
	exit 1
fi

# Close any open System Settings panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Settings" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Get an empty log file
log_file="$IGNITION_ROOT/ignition.preferences.log"
rm "$log_file" &> /dev/null

error=false

# Run all the preferences scripts
for script in preferences/*.sh; do
  # Get the name of the preference script
  full_name=$(basename $script)
  file_name=$(basename $script .sh)
  name=${file_name//-/ }  # replace '-' with ' '

  # Message describing the current script
  message="Setting $name preferences"

  # Print a task message with it
  task $message

  # Run the preference script, redirecting standard output and error
  # Change the task message to success or fail
  # Add the sripts name to the log. Mark if it has errors
  if output=$(bash $script 2>&1); then
    success $message
    echo "$full_name" >> $log_file
  else
    error=true
    fail $message
    echo -e "!!!! ERROR  !!!!\n$full_name" >> $log_file
  fi

  # Check if the he script is not empty before appending to the log file
  [ -n "$output" ] && echo "$output" >> "$log_file"
  # Close every preferences script with an empty line in the log
  echo "" >> "$log_file"
done

# Let the user know where to find the log if there was an error
if $error; then
  # Use readlink to get the full path
  full_path=$(readlink -f "$log_file")
  # Print the clickable full path
  warn "Check log for error messages: file://$full_path"
fi
