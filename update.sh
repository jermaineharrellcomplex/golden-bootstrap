#!/usr/bin/env bash
brew bundle dump --force
cp Brewfile ~/golden-bootstrap/Brewfile
code --list-extensions > ~/golden-bootstrap/vscode-extensions.txt
echo "Golden repo updated."
