#!/usr/bin/env bash

# Download .env.sh if IGNITION_MAC is not set or is empty
if [ -z "${IGNITION_MAC+x}" ]; then
  source <(curl -s https://raw.githubusercontent.com/marosige/I-like-it-like-that/main/dotfiles/env/.env.sh)
fi

cd $IGNITION_MAC
source ./print.sh

# Read the script parameters
auto_accept=false
auto_ignite=false
auto_update=false

while getopts ":yiuh" opt; do
  case $opt in
    y)
      auto_accept=true
      ;;
    i)
      auto_ignite=true
      ;;
    u)
      auto_update=true
      ;;
    h)
      title "Usage: $0 [-y] [-i]"
      message "Options:"
      message "  -y: Auto-accept without prompting."
      message "  -i: Run ignition without showing the menu."
      message "  -i: Run update without showing the menu."
      exit 0
      ;;
    \?)
      fail "Invalid option: -$OPTARG. Use -h for help." >&2
      exit 1
      ;;
  esac
done

print_warning () {
  message "This script is designed to set up your environment by performing the following actions:"
  message " 1. Installing various applications and tools."
  message " 2. Configuring system settings and preferences."
  info "Please be aware that running this script will modify your system and may affect your existing configurations."
  message "Ensure you have reviewed the script and understand the changes it will make before proceeding: https://github.com/marosige/ignition"
  warn "IMPORTANT: Backup any important configurations or data before running this script."
  bold "It is an irreversible process. Once the setup is complete, reverting the changes may be challenging."
  confirm "Do you want to continue?"
}

exit_if_not_accepted () {
  if [ "$auto_accept" = false ]; then
    if ! print_warning ; then
      fail "Setup aborted. No changes have been made."
      exit 1
    fi
  fi
}

ignite () {
  exit_if_not_accepted
  bash $IGNITION_MAC/install.sh
  bash $IGNITION_MAC/preferences.sh
  success "Task finished! Reboot your computer to finalize the setup!"
}

title "Welcome to Gergő's macOS daily driver setup!"

# If auto install, do not show the menu
if [ "$auto_ignite" = true ]; then
  ignite
  exit 0
fi

# If auto update, do not show the menu
if [ "$auto_update" = true ]; then
  bash $IGNITION_MAC/tools/update.sh
  exit 0
fi

# Show the menu
menu () {
  question "What do you want to do?"
  options=( "Install & Set preferences" "Install process" "Set preferences" "Update" "Uninstall all formulae not listed in the Brewfile" "Exit")
  choice=$(gum choose "${options[@]}")
  case "$choice" in
    "${options[0]}" )
    ignite
    ;;
    "${options[1]}" )
    exit_if_not_accepted
    bash $IGNITION_MAC/install.sh
    ;;
    "${options[2]}" )
    exit_if_not_accepted
    bash $IGNITION_MAC/preferences.sh
    ;;
    "${options[3]}" )
    bash $IGNITION_MAC/tools/update.sh
    ;;
    "${options[4]}" )
    task="Uninstall all formulae not listed in the Brewfile"
    task $task
    brew update > /dev/null 2>&1
    cleanup_output=$(brew bundle cleanup --file=$BREWFILE | sed '$d')
    if [ -z "$cleanup_output" ]; then
      success $task
      message "Nothing to uninstall"
    else
      clear_line  # Remove the task message
      echo "$cleanup_output" | while IFS= read -r line; do
        [[ $line == *":" ]] && warn "$line" || list "$line"
      done
      if confirm "Do you want to proceed with the cleanup?"; then
        task $task
        brew bundle cleanup --force --file=$BREWFILE > /dev/null 2>&1 &&
          success $task ||
          fail $task
      else
        success "Cleanup aborted. No changes have been made."
      fi
    fi
    ;;
    "${options[5]}" )
    success "Exiting"
    exit 0
    ;;
  esac
  menu
}

menu
