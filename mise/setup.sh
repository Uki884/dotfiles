#!/usr/bin/env bash

echo "miseをインストールします..."

if [[ ! -e "$HOME/.local/bin/mise" ]]; then
    curl https://mise.run | sh
fi

source $SCRIPT_DIR/mise/node.sh