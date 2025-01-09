echo "Nodeをインストールします..."

if ! which node; then
    $HOME/.local/bin/mise use node@lts
fi

echo "Nodeをインストールしました。"
