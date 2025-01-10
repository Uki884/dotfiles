#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

echo "Macの設定を行います..."

# Show bluetooth in the menu bar
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true

# Avoid creating `.DS_Store` files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Set initial key repeat rate
defaults write -g InitialKeyRepeat -int 11

# Set keyboard repeat rate
defaults write -g KeyRepeat -int 1

defaults write com.apple.mouse.tapBehavior -int 1

# Disable automatic spelling correction
defaults write NSAutomaticSpellingCorrectionEnabled -bool false

# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool YES

# Show all file extensions
defaults write AppleShowAllExtensions -bool true

# Sort folders first in Finder
defaults write com.apple.finder _FXSortFoldersFirst -bool true
