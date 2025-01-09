#!/usr/bin/env bash

echo "zshをインストールします..."

mkdir -p $HOME/.config/zsh

ln -sf $SCRIPT_DIR/zsh/zprofile $HOME/.zprofile
ln -sf $SCRIPT_DIR/zsh/zshenv $HOME/.zshenv
ln -sf $SCRIPT_DIR/zsh/zshrc $HOME/.zshrc

echo "zshを有効化します..."
source $HOME/.zshrc
