#!/usr/bin/env bash
set -veuo pipefail

SCRIPT_DIR=$(perl -MCwd=realpath -le 'print realpath shift' "$0/..")

# Homebrew、miseのPATHを ~/.zshrc に追記
if ! grep -q 'export PATH="/opt/homebrew/bin:$PATH"' $HOME/.zshrc; then
    echo 'export PATH="/opt/homebrew/bin:$PATH"' >> $HOME/.zshrc
fi

if ! grep -q 'export PATH="$PATH:$HOME/.local/share/mise/installs/node/latest/bin"' $HOME/.zshrc; then
    echo 'export PATH="$PATH:$HOME/.local/share/mise/installs/node/latest/bin"' >> $HOME/.zshrc
fi

source $HOME/.zshrc

echo "現在の PATH:"
echo $PATH

#
# Homebrew
#
echo "Homebrewをインストールします..."

if ! which brew; then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
    echo "Homebrew のインストールに失敗しました。" >&2
    exit 1
  }
fi

echo "brew doctorを実行します..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 && brew doctor

echo "brew updateを実行します..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 && brew update --verbose

#
# Git
#
echo "Gitをインストールします..."
ln -sf $SCRIPT_DIR/git/.gitconfig $HOME/.gitconfig

#
# mise
#
echo "miseをインストールします..."
if [[ ! -e "$HOME/.local/bin/mise" ]]; then
    curl https://mise.run | sh
fi

#
# Node
#
echo "Nodeをインストールします..."
if ! which node; then
    $HOME/.local/bin/mise use --global node
fi

#
# zsh
#
echo "zshをインストールします..."
mkdir -p $HOME/.config/zsh
ln -sf $SCRIPT_DIR/zsh/zprofile $HOME/.zprofile
ln -sf $SCRIPT_DIR/zsh/zshenv $HOME/.zshenv
ln -sf $SCRIPT_DIR/zsh/zshrc $HOME/.zshrc

#
# Brewfile
#
echo "Brewfileをインストールします..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 && brew bundle --file $SCRIPT_DIR/brew/Brewfile --verbose
