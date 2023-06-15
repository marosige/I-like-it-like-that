#!/bin/bash

readonly DIALOG_WIDTH=78
readonly DIALOG_HEIGHT=25
readonly DIALOG_HEIGHT_SMALL=10
readonly MENU_LIST_HEIGHT=16

function is_command_exists () {
    type "$1" &> /dev/null
}

function check_and_install_dependency() {
  local apps=""
  if ! is_command_exists brew ; then message+="• homebrew\n" ; fi
  if ! is_command_exists dialog ; then message+="• dialog\n" ; fi
  if ! is_command_exists mas ; then message+="• mac app store CLI\n" ; fi
  if [ -z "$apps" ]; then return ; fi

  echo "In ordert to work, this script will install:\n$apps"
  read -p "Do you want to continue? [Y/n] " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]] ; then
    if ! is_command_exists brew ; then /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" ; fi
    if ! is_command_exists dialog ; then brew install dialog ; fi
    if ! is_command_exists mas ; then brew install mas ; fi
  else
      echo "Installation cancelled, exiting..."
      exit
  fi
}

function menu_install() {
  local choises=$(dialog --title "Install apps" --checklist "Select the app to install" $DIALOG_HEIGHT $DIALOG_WIDTH $MENU_LIST_HEIGHT \
    # Security
    "1Password" "1Password" ON \
    # Developer Tools
    "fish" "fish" ON \
    "git" "Git" ON \
    "gitkraken" "GitKraken" ON \
    "github" "GitHub" ON \
    "atom" "Atom" ON \
    "android-studio" "Android Studio" ON \
    "apktool" "Apktool" ON \
    "charles" "Charles Proxy" ON \
    "nordlayer" "NordLayer" ON \
    "nordvpn" "NordVPN" ON \
    "tunnelblick" "Tunnelblick" ON \
    # Messaging
    "messenger" "Facebook Messenger" ON \
    "messenger" "WhatsApp" ON \
    "slack" "Slack" ON \
    "discord" "Discord" ON \
    "zoom" "Zoom" ON \
    "skype" "Skype" ON \
    # File Management
    "mc" "mc" ON \
    "the-unarchiver" "The Unarchiver" ON \
    "android-file-transfer" "Android File Transfer" ON \
    # Web Browser
    "google-chrome" "Google Chrome" ON \
    # Media
    "spotify" "Spotify" ON \
    "vlc" "VLC" ON \
    "gimp" "GIMP" ON \
    "audacity" "Audacity" ON \
    "408981434" "iMovie" ON \
    # Utilities
    "appcleaner" "AppCleaner" ON \
    "balenaetcher" "balenaEtcher" ON \
    "sweet-home3d" "Sweet Home 3D" ON \
    "logi-options-plus" "Logi Options+" ON \
    "441258766" "Magnet" ON \
    "937984704" "Amphetamine" ON \
    "neofetch" "neofetch" ON 3>&1 1>&2 2>&3)
    if [ -n "$choises" ]; then
      for choice in $choises; do
        case "$choice" in
          # Security
          1password) brew install --cask 1password ;;
          # Developer Tools
          fish) brew install fish ;;
          git) brew install  git ;;
          gitkraken) brew install --cask gitkraken ;;
          github) brew install --cask github ;;
          atom) brew install --cask atom ;;
          android-studio) brew install --cask android-studio ;;
          apktool) brew install apktool ;;
          charles) brew install --cask charles ;;
          nordlayer) brew install --cask nordlayer ;;
          nordvpn) brew install --cask nordvpn ;;
          tunnelblick) brew install --cask tunnelblick ;;
          # Messaging
          messenger) brew install --cask messenger ;;
          whatsapp) brew install --cask whatsapp ;;
          slack) brew install --cask slack ;;
          discord) brew install --cask discord ;;
          zoom) brew install --cask zoom ;;
          skype) brew install --cask skype ;;
          # File Management
          mc) brew install mc ;;
          the-unarchiver) brew install --cask the-unarchiver ;;
          android-file-transfer) brew install --cask android-file-transfer ;;
          # Web Browser
          google-chrome) brew install --cask google-chrome ;;
          # Media
          spotify) brew install --cask spotify ;;
          vlc) brew install --cask vlc ;;
          gimp) brew install --cask gimp ;;
          audacity) brew install --cask audacity ;;
          408981434) mas install 408981434 ;; # iMovie
          # Utilities
          appcleaner) brew install --cask appcleaner ;;
          balenaetcher) brew install --cask balenaetcher ;;
          sweet-home3d) brew install --cask sweet-home3d ;;
          441258766) mas install 441258766 ;; # Magnet
          937984704) mas install 937984704 ;; # Amphetamine
          neofetch) brew install --cask neofetch ;;
        esac
      done
      dialog --title "Install apps" --msgbox "App(s) installed!" $DIALOG_HEIGHT_SMALL $DIALOG_WIDTH
    fi
    menu_main
}

function menu_download() {
  chrome_open() {
    /usr/bin/open -a "/Applications/Google Chrome.app" $1
  }

  local selected=$(dialog --title "Manual app downloads" --menu "Select the app to open download page (requires chrome)" $DIALOG_HEIGHT $DIALOG_WIDTH $MENU_LIST_HEIGHT \
    "1password" "1Password chrome plugin" \
    "meet" "Google Meet progressive web app" \
    "filezilla" "FileZilla application" \
    "back" "Back to main menu" 3>&1 1>&2 2>&3)
  case $selected in
    1password) chrome_open "https://chrome.google.com/webstore/detail/1password-%E2%80%93-password-mana/aeblfdkhhhdcdjpifhhbdiojplfjncoa" ; menu_download ;;
    meet) chrome_open "https://support.google.com/meet/answer/10708569?hl=en" ; menu_download ;;
    filezilla) chrome_open "https://filezilla-project.org/download.php?platform=osx" ; menu_download ;;
    back|"") menu_main ;;
  esac
}

# Setting possibilities found here:
#   https://macos-defaults.com/
function menu_preferences() {
  configure_dock() {
    local choises=$(dialog --title "Configure dock" --checklist "The selected preference changes will take effect\nmove: arrows | toggle: space | save: enter" $DIALOG_HEIGHT $DIALOG_WIDTH $MENU_LIST_HEIGHT \
      "1" "Set dock icon standard size to 32px" ON \
      "2" "Set dock icon magnified size 48px" ON \
      "3" "Set the minimize animation effect to scale" ON \
      "4" "Set do not display recent apps in the dock" ON \
      "5" "Set display pinned apps in the dock (default)" ON \
      "6" "Set dock position to the bottom (default)" ON \
      "7" "Set disable dock auto hide (default)" ON 3>&1 1>&2 2>&3)
    if [ -n "$choises" ]; then
      for choice in $choises; do
        case "$choice" in
          1) defaults write com.apple.dock tilesize -int 32 ;;
          2) defaults write com.apple.dock largesize -int 48 ;;
          3) defaults write com.apple.dock mineffect -string "scale" ;;
          4) defaults write com.apple.dock show-recents -bool "false" ;;
          5) defaults write com.apple.dock orientation -string "bottom" ;;
          6) defaults write com.apple.dock static-only -bool "false" ;;
          7) defaults write com.apple.dock autohide -bool "false" ;;
        esac
      done
      # Reset dock, so the changes will take effect
      killall Dock
    fi
  }

  configure_finder() {
    local choises=$(dialog --title "Configure finder" --checklist "The selected preference changes will take effect\nmove: arrows | toggle: space | save: enter" $DIALOG_HEIGHT $DIALOG_WIDTH $MENU_LIST_HEIGHT \
      "1" "Set show file extensions" ON \
      "2" "Set show hidden files" ON \
      "3" "Set default view style to column view" ON \
      "4" "Set keep folders on top (default)" ON \
      "5" "Set changing file extension warning (default)" ON \
      "6" "Set sidebar icon size to 2 (default)" ON 3>&1 1>&2 2>&3)
    if [ -n "$choises" ]; then
      for choice in $choises; do
        case "$choice" in
          1) defaults write NSGlobalDomain AppleShowAllExtensions -bool "true" ;;
          2) defaults write com.apple.finder AppleShowAllFiles -bool "true" ;;
          3) defaults write com.apple.finder FXPreferredViewStyle -string "clmv" ;;
          4) defaults write com.apple.finder _FXSortFoldersFirst -bool "false" ;;
          5) defaults write com.apple.finder FXEnableExtensionChangeWarning -bool "true" ;;
          6) defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2 ;;
        esac
      done
      # Reset finder, so the changes will take effect
      killall Finder
    fi
  }

  local choises=$(dialog --title "Preferences" --checklist "The selected preference changes will take effect\nmove: arrows | toggle: space | save: enter" $DIALOG_HEIGHT $DIALOG_WIDTH $MENU_LIST_HEIGHT \
    "fish" "Set fish as the default shell" ON \
    "mouse" "Set tracking speed to max" ON \
    "repeat" "Set repeat character while key held down" ON \
    "dock" "Configure dock to my likings" ON \
    "finder" "Configure finder to my likings" ON 3>&1 1>&2 2>&3)
  if [ -n "$choises" ]; then
    for choice in $choises; do
      case "$choice" in
        fish) chsh -s $(which fish) ;;
        mouse) defaults write -g com.apple.trackpad.scaling -float 3.0 ;;
        repeat) defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false" ;;
        dock) configure_dock ;;
        finder) configure_finder ;;
      esac
    done
    dialog --title "Preferences" --msgbox "Preference(s) changed!" $DIALOG_HEIGHT_SMALL $DIALOG_WIDTH
  fi
  menu_main
}

function menu_main() {
  local selected=$(dialog --title "Daily Driver macOS" --menu "Welcome to my mac OS daily driver setup tool!" $DIALOG_HEIGHT $DIALOG_WIDTH $MENU_LIST_HEIGHT \
    "install" "Install apps" \
    "download" "Manual app downloads (requires chrome)" \
    "preferences" "Set your preferences" \
    "exit" "Exit from mac OS daily driver setup tool" 3>&1 1>&2 2>&3)
  case $selected in
    install) menu_install ;;
    download) menu_download ;;
    preferences) menu_preferences ;;
    exit|"") clear ; exit ;;
  esac
}

check_and_install_dependency
menu_main
