# golden-bootstrap

Bootstrap repository for setting up my macOS development environment.

This repository installs command-line tools, applications, and VS Code extensions required for my development workflow.

---

## What this installs

### Homebrew Packages

Packages and applications listed in `Brewfile`, such as:

- git
- node
- python
- ffmpeg
- tmux
- awscli
- terraform
- docker
- Visual Studio Code
- additional development utilities

Note: The list of utilities may change over time as tools are added, removed, or updated. 
The authoritative list of installed packages is defined in the Brewfile.

Installed using:

brew bundle

---

### VS Code Extensions

Extensions listed in:

vscode-extensions.txt

Installed automatically by `bootstrap.sh`.

---

## Files in this repository

bootstrap.sh              Main setup script
Brewfile                  Homebrew packages and applications
vscode-extensions.txt     VS Code extensions list
update.sh                 Helper script for repo updates
.gitignore                Git ignore rules
README.md                 Documentation

---

## Setup on a New Machine

Clone the repository:

git clone https://github.com/jermaineharrellcomplex/golden-bootstrap.git
cd golden-bootstrap

Run the bootstrap script:

./bootstrap.sh

This will:

1. Update Homebrew
2. Install packages from the Brewfile
3. Install VS Code extensions
4. Configure the development environment

---

## Updating an Existing Machine

If the repository already exists on a machine:

cd ~/golden-bootstrap
git pull
./bootstrap.sh

This pulls the latest repository updates and installs any new dependencies.

---

## Updating This Repository

After modifying bootstrap files:

git add .
git commit -m "Describe change"
git push

---

## Requirements

macOS with:

- Git
- Apple Command Line Tools

If Git is missing, macOS will prompt to install it when running:

git --version

---

## Notes

This repository is designed to quickly recreate my development environment on any macOS machine.
