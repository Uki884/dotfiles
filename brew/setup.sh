#!/usr/bin/env bash

set +e

echo "Homebrewをインストールします..."

# Homebrew、miseのPATHを ~/.zshrc に追記
if ! grep -q 'export PATH="/opt/homebrew/bin:$PATH"' $HOME/.zshrc; then
    echo 'export PATH="/opt/homebrew/bin:$PATH"' >> $HOME/.zshrc
    echo "HomebrewのPATHを追加しました。"
fi

# ~/.zshrc を読み込んで反映
source $HOME/.zshrc

# Homebrew のインストール
if ! which brew >/dev/null 2>&1; then
  echo "Homebrewをインストール中..."
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
    echo "Homebrew のインストールに失敗しました。" >&2
    exit 1
  }
else
  echo "Homebrewはすでにインストールされています。"
fi

# Homebrew のヘルスチェック
echo "brew doctorを実行します..."
if which brew >/dev/null 2>&1; then
  brew doctor || {
    echo "brew doctor でエラーが発生しました。" >&2
    exit 1
  }
fi

# Homebrew のアップデート
echo "brew updateを実行します..."
brew update --verbose || {
    echo "brew update に失敗しました。" >&2
    exit 1
}

# Brewfile の処理
echo "Brewfileをインストールします..."
if [ -f "$SCRIPT_DIR/brew/Brewfile" ]; then
  if ! brew bundle --file "$SCRIPT_DIR/brew/Brewfile" --verbose 2>>"$SCRIPT_DIR/brew_error.log"; then
    echo "Brewfile のインストールに失敗しましたが、処理を続行します。ログ: $SCRIPT_DIR/brew_error.log" >&2
  fi
else
  echo "Brewfile が見つかりません。スキップします。"
fi

echo "Homebrewのセットアップが完了しました。"