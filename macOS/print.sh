#!/usr/bin/env bash

### Hoew to
# Log tasks:
#   message="Task description"
#   task $message
#   command && success $message || fail $message;


# Define ANSI escape codes
BLINKING_BLUE='\e[5;34m'

DEFAULT='\e[0m'
DEFAULT_BOLD='\e[0;1m'
BRIGHT_CYAN='\e[0;96m'
BRIGHT_CYAN_BOLD='\e[0;1;96m'
MAGENTA_BOLD='\e[0;1;35m'
YELLOW_BOLD='\e[0;1;33m'
BRIGHT_BLUE='\e[0;94m'
BRIGHT_BLUE_BOLD='\e[0;1;94m'
BRIGHT_BLUE_BLINKING='\e[5;34m'
GREEN='\e[0;32m'
RED='\e[0;31m'

CLEAR_LINE='\e[2K'

HEAVY_CHECK_MARK='\xE2\x9C\x94'

message () {
  printf "\r${DEFAULT}. %s\n" "$*"
}

title () {
  printf "\r${BRIGHT_CYAN_BOLD}>${DEFAULT_BOLD} %s${DEFAULT}\n" "$*"
}

warn () {
  printf "\r${MAGENTA_BOLD}!${DEFAULT_BOLD} %s${DEFAULT}\n" "$*"
}

info () {
  printf "\r${BRIGHT_BLUE_BOLD}!${DEFAULT_BOLD} %s${DEFAULT}\n" "$*"
}

question () {
  printf "\r${YELLOW_BOLD}?${DEFAULT_BOLD} %s${DEFAULT}\n" "$*"
}

# Task doesn't have a \n at the end.
# It should be overwritten with the next line, like a success/fail message
task () {
  printf "\r${BRIGHT_BLUE_BLINKING}…${DEFAULT} %s" "$*"
}

success () {
  printf "\r${CLEAR_LINE}${GREEN}${HEAVY_CHECK_MARK}${DEFAULT} %s\n" "$*"
}

fail () {
  printf "\r${CLEAR_LINE}${RED}x${DEFAULT} %s\n" "$*"
}

confirm() {
  printf "\r\e[0;33m?$DEFAULT %s" "$*"
  read -r -p $'\e[0;1m [Y/n] \e[0m' response
  case "$response" in
      [yY][eE][sS]|[yY])
          true
          ;;
      *)
          false
          ;;
  esac
}

choose () {
  # todo make it yellow as the question text
  gum choose $@
}
