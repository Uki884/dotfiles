#!/usr/bin/env bash
set -veuo pipefail

SCRIPT_DIR=$(perl -MCwd=realpath -le 'print realpath shift' "$0/..")

#
# zsh
#
/bin/rm -fr $HOME/.config/zsh
/bin/rm -f $HOME/.zshrc
/bin/rm -f $HOME/.zshenv
/bin/rm -f $HOME/.zprofile

#
# mise
#
if which mise; then
    mise implode -y
fi

#
# Git
#
/bin/rm -f $HOME/.gitconfig
/bin/rm -f $HOME/.gitignore_global

#
# Homebrew
#
if which brew; then
    echo 'Y' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
fi
[[ -e /opt/homebrew ]] && sudo /bin/rm -fr /opt/homebrew

#
# General
#
/bin/rm -fr $HOME/.cache