#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(perl -MCwd=realpath -le 'print realpath shift' "$0/..")

#
# Mac Settings
#
source $SCRIPT_DIR/mac/setup.sh

#
# zsh
#
source $SCRIPT_DIR/zsh/setup.sh

#
# Git
#
source $SCRIPT_DIR/git/setup.sh

#
# Homebrew
#
source $SCRIPT_DIR/brew/setup.sh

#
# mise
#
source $SCRIPT_DIR/mise/setup.sh

source $HOME/.zshrc

echo "インストールが完了しました。"

