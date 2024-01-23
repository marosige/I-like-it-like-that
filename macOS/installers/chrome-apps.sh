#!/bin/bash
# This script will open chrome apps to install

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

info "Opening Chrome Apps"

chrome_open() {
  /usr/bin/open -a "/Applications/Google Chrome.app" $1
}

echo ""
echo "› Chrome Apps:"
echo "  › 1Password chrome plugin"
chrome_open "https://chrome.google.com/webstore/detail/1password-%E2%80%93-password-mana/aeblfdkhhhdcdjpifhhbdiojplfjncoa"

echo "  › Google Meet progressive web app"
chrome_open "https://support.google.com/meet/answer/10708569?hl=en"

echo "  › FileZilla application"
chrome_open "https://filezilla-project.org/download.php?platform=osx"

echo "  › 8BitDo Firmware Updater"
chrome_open "https://support.8bitdo.com/firmware-updater.html"
