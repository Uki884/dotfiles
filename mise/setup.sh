#!/usr/bin/env bash

echo "miseをインストールします..."

if ! grep -q 'export PATH="$PATH:$HOME/.local/share/mise/installs/node/latest/bin"' $HOME/.zshrc; then
    echo 'export PATH="$PATH:$HOME/.local/share/mise/installs/node/latest/bin"' >> $HOME/.zshrc
    echo "miseのPATHを追加しました。"
    source $HOME/.zshrc
fi

if [[ ! -e "$HOME/.local/bin/mise" ]]; then
    curl https://mise.run | sh
fi

source $SCRIPT_DIR/mise/node.sh