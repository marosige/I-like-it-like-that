#!/bin/sh
# This script will set my prefered macOS defaults
# Possibilities found here: https://macos-defaults.com/

# If not on macOS, exit.
if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

echo ""
echo "› Dock:"
echo "  › Set dock icon standard size to 32px"
defaults write com.apple.dock tilesize -int 32

echo "  › Set dock icon magnified size to 48px"
defaults write com.apple.dock largesize -int 48

echo "  › Set the minimize animation effect to scale"
defaults write com.apple.dock mineffect -string scale

echo "  › Set do not display recent apps in the dock"
defaults write com.apple.dock show-recents -bool false

echo "  › Scroll up on a Dock icon to show all Space's opened windows for an app, or open stack."
defaults write com.apple.dock scroll-to-open -bool true

echo "  › Set dock position to the bottom"
defaults write com.apple.dock orientation -string bottom
# Default value: 'bottom' Possible values: `bottom`, `left` and `right`

echo "  › Set display pinned apps in the dock (default)"
defaults write com.apple.dock static-only -bool false

echo "  › Set disable dock auto hide (default)"
defaults write com.apple.dock autohide -bool false


echo ""
echo "› Finder:"
echo "  › Set show file extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "  › Set show hidden files"
defaults write com.apple.finder AppleShowAllFiles -bool true

echo "  › Set default view style to column view"
defaults write com.apple.finder FXPreferredViewStyle -string clmv

echo "  › Show path bar"
defaults write com.apple.finder ShowPathbar -bool true

echo "  › Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

echo "  › Set keep folders on top (default)"
defaults write com.apple.finder _FXSortFoldersFirst -bool false

echo "  › Set changing file extension warning (default)"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool true

echo "  › Set sidebar icon size to 2 (default)"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2


echo ""
echo "› Miscellaneous:"
echo "  › Set fish as the default shell"
chsh -s $(which fish)

echo "  › Set tracking speed to max"
defaults write -g com.apple.trackpad.scaling -float 5.0

echo "  › Set repeat character while key held down"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "  › Use scroll gesture with the Ctrl (^) modifier key to zoom"
sudo defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
sudo defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

echo "  › Show the ~/Library folder"
chflags nohidden ~/Library

echo "  › Don't automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

echo "  › Avoid the creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "  › Disable the 'Are you sure you want to open this application?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "  › Disable thumbnail after taking a screenshot"
defaults write com.apple.screencapture show-thumbnail -bool false

echo "  › Show full website address in Safari"
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true


echo ""
echo "› Kill related apps"
for app in "Dock" "Finder" "Safari" ; do
	killall "$app" >/dev/null 2>&1
done
