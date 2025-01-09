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