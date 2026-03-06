#!/usr/bin/env bash
set -e

echo "==> Updating Homebrew"
brew update

echo "==> Installing Brew dependencies"
brew bundle --file=./Brewfile

echo "==> Installing VS Code extensions"
if command -v code >/dev/null 2>&1; then
  cat ./vscode-extensions.txt | xargs -n 1 code --install-extension
else
  echo "VS Code CLI not found. In VS Code run:"
  echo "Cmd+Shift+P -> 'Shell Command: Install code command in PATH'"
fi

echo "==> Bootstrap complete."
