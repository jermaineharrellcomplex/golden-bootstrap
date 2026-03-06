#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/jermaineharrellcomplex/golden-bootstrap.git"
TARGET_DIR="$HOME/golden-bootstrap"

echo "==> Checking for Git"
if ! command -v git >/dev/null 2>&1; then
  echo "Git not found. macOS should prompt you to install Command Line Tools."
  xcode-select --install || true
  echo "After Git is installed, run this command again."
  exit 1
fi

if [[ -d "$TARGET_DIR/.git" ]]; then
  echo "==> Repo already exists. Pulling latest changes..."
  git -C "$TARGET_DIR" pull --ff-only
else
  echo "==> Cloning golden-bootstrap..."
  git clone "$REPO_URL" "$TARGET_DIR"
fi

echo "==> Running bootstrap..."
bash "$TARGET_DIR/bootstrap.sh"