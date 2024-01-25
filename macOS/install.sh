#!/usr/bin/env bash

source ./print.sh

title "Installing my preferred enviroment:"

# If not on macOS, exit.
if [ "$(uname -s)" != "Darwin" ]; then
  echo "This script is only available for macOS! Exiting..."
	exit 0
fi

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Get an empty log file
log_file="ignition.installers.log"
rm "$log_file" &> /dev/null

error=false

## Softwareupdate
message="Checking for macOS updates"
task $message
# List all available updates to a variable
update_output=$(sudo softwareupdate --list)
# Check the exit status of the previous command
if [ $? -eq 0 ]; then
    # The command was successful
    echo -e "$message\n$update_output" >> $log_file

    # Check if there are any lines containing "No new software available."
    if echo "$update_output" | grep -q "No new software available."; then
        success "$message: System is up-to-date!"
    else
        success "$message: Software Update found!"

        message="Downloading the update"
        task "$message"
        if output=$(sudo softwareupdate -ia --verbose 2>&1); then
          # Filter the output to show only "Downloaded" or "Failed" lines
          filtered_output=$(echo "$output" | grep -E "Downloaded|Failed")
          success $filtered_output
          info "Don't forget to reboot your system to install the update!"
        else
          # Filter the output to show only "Downloaded" or "Failed" lines
          filtered_output=$(echo "$output" | grep -E "Downloaded|Failed")
          fail $filtered_output
        fi
        echo -e "$message\n$output" >> $log_file
    fi
else
    # The command failed
    fail $message
    echo -e "!!!! ERROR  !!!!\n$message\n$update_output" >> $log_file
fi

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

#source_installers INSTALLERS[@] "installers/"
