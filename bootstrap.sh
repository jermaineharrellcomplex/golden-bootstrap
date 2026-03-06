#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Checking for Homebrew"
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "==> Configuring Homebrew environment"

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  BREW_LINE='eval "$(/opt/homebrew/bin/brew shellenv)"'
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
  BREW_LINE='eval "$(/usr/local/bin/brew shellenv)"'
else
  echo "Homebrew installed but brew binary not found."
  exit 1
fi

SHELL_PROFILE="$HOME/.zprofile"

if ! grep -Fq "$BREW_LINE" "$SHELL_PROFILE" 2>/dev/null; then
  echo "==> Adding Homebrew to shell profile"
  echo "$BREW_LINE" >> "$SHELL_PROFILE"
fi

echo "==> Updating Homebrew"
brew update

echo "==> Installing Brew dependencies"
brew bundle --file="$REPO_DIR/Brewfile"

echo "==> Installing VS Code extensions"
if command -v code >/dev/null 2>&1; then
  xargs -n 1 code --install-extension < "$REPO_DIR/vscode-extensions.txt"
else
  echo "VS Code CLI not found. In VS Code run:"
  echo "Cmd+Shift+P -> 'Shell Command: Install code command in PATH'"
fi

echo "==> Bootstrap complete."
echo "==> Open a new terminal or run: source ~/.zprofile"