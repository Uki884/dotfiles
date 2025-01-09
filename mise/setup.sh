#!/usr/bin/env bash

echo "miseをインストールします..."

if ! grep -Fxq 'eval "$(~/.local/bin/mise activate zsh)"' "$HOME/.zshrc"; then
    echo 'eval "$(~/.local/bin/mise activate zsh)"' >> "$HOME/.zshrc"
    echo "miseのPATHを追加しました。"
    source "$HOME/.zshrc"
else
    echo "既に 'eval \"$(~/.local/bin/mise activate zsh)\"' が .zshrc に存在します。"
fi

if [[ ! -e "$HOME/.local/bin/mise" ]]; then
    curl https://mise.run | sh
fi

source $SCRIPT_DIR/mise/node.sh