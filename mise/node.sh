echo "Nodeをインストールします..."

if ! which node; then
    $HOME/.local/bin/mise use --global node
fi
