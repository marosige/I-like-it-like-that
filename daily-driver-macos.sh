#!/bin/bash

chrome_open() {
  /usr/bin/open -a "/Applications/Google Chrome.app" $1
}

install_software() {
  # Check if Homebrew is installed
  which -s brew
  if [[ $? != 0 ]] ; then
      # If not, install Homebrew
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Install mas for Mac App Store CLI
  brew install mas

  # Security
  brew install --cask 1password

  # Developer Tools
  brew install fish
  brew install git
  brew install --cask gitkraken
  brew install --cask github
  brew install --cask atom
  brew install --cask android-studio
  brew install apktool
  brew install --cask charles # Charles Proxy
  brew install --cask nordlayer
  brew install --cask nordvpn
  brew install --cask tunnelblick

  # Messaging
  brew install --cask messenger # Facebook Messenger
  brew install --cask whatsapp
  brew install --cask slack
  brew install --cask discord
  brew install --cask zoom
  brew install --cask skype

  # File Management
  brew install mc
  brew install --cask the-unarchiver
  brew install --cask android-file-transfer
  # TODO FileZilla

  # Web Browser
  brew install --cask google-chrome

  # Media
  brew install --cask spotify
  brew install --cask vlc
  brew install --cask gimp
  brew install --cask audacity
  mas install 408981434  # iMovie

  # Utilities
  brew install --cask appcleaner
  brew install --cask balenaetcher
  brew install --cask sweet-home3d
  brew install --cask logi-options-plus
  brew install neofetch
  mas install 441258766  # Magnet
  mas install 937984704  # Amphetamine
}

configure_dock() {
  # Set dock position to the bottom (default value: bottom)
  defaults write com.apple.dock orientation -string "bottom"

  # Set dock icon standard size in px (default value: 48)
  defaults write com.apple.dock tilesize -int 32

  # Set dock icon magnified size in px (default value: 128)
  defaults write com.apple.dock largesize -int 48

  # Disable dock auto hide (default value: false)
  defaults write com.apple.dock autohide -bool "false"

  # Set the minimize animation effect (default value: genie)
  defaults write com.apple.dock mineffect -string "scale"

  # Show apps pinned to the dock (default value: false)
  defaults write com.apple.dock static-only -bool "false"

  # Do not display recent apps in the Dock (default value: true)
  defaults write com.apple.dock show-recents -bool "false"

  # Reset the dock, so the changes will take effect
  killall Dock

  # Add empty spacer to dock
  # defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock

  # Add chrome to dock
  # defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

}

configure_finder() {
  # Show file extensions (default value: false)
  defaults write NSGlobalDomain AppleShowAllExtensions -bool "true"

  # Show hidden files (default value: false)
  defaults write com.apple.finder AppleShowAllFiles -bool "true"

  # Default view style (default value: icnv (Icon view))
  defaults write com.apple.finder FXPreferredViewStyle -string "clmv" # Column view

  # Keep folders on top (default value: false)
  defaults write com.apple.finder _FXSortFoldersFirst -bool "false"

  # Changing file extension warning (default value: true)
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool "true"

  # Set sidebar icon size (default value: 2)
  defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

  # Reset finder, so the changes will take effect
  killall Finder
}

apply_settings() {
  # Setting possibilities found here:
  #   https://macos-defaults.com/

  # Set fish as the default shell
  chsh -s $(which fish)

  # Mouse tracking speed (3.0 is the GUI settings maximum)
  defaults write -g com.apple.trackpad.scaling -float 5.0

  # Repeat character while key held down (default value: true (show character accents menu))
  defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"

  # Configure the dock to my likings
  configure_dock

  # Configure finder to my likings
  configure_finder
}

open_websites() {
  # 1Password chrome plugin
  chrome_open "https://chrome.google.com/webstore/detail/1password-%E2%80%93-password-mana/aeblfdkhhhdcdjpifhhbdiojplfjncoa"
  # Google Meet Progressive Web App
  chrome_open "https://support.google.com/meet/answer/10708569?hl=en"
  # FIleZilla download page
  chrome_open "https://filezilla-project.org/download.php?platform=osx"
}

echo "This script will install a bunch of software and change some settings"
read -p "Do you want to continue? [Y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    install_software
    apply_settings
    open_websites
    echo "Your mac is now configured!"
    echo "There are open tabs in your Chrome browser where you can get additional features without cli!"
else
    echo "Installation cancelled."
fi
