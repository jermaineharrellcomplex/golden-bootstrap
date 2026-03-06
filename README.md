# golden-bootstrap

Bootstrap repository for setting up my macOS development environment.

## What this installs

- Homebrew packages and casks from `Brewfile`
- VS Code extensions from `vscode-extensions.txt`

Note: the list of utilities may change over time. The `Brewfile` is the source of truth.

## Files

- `install.sh` - clones or updates the repo, then runs bootstrap
- `bootstrap.sh` - installs Homebrew dependencies and VS Code extensions
- `Brewfile` - package and app definitions
- `vscode-extensions.txt` - VS Code extension list

## New machine setup

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/jermaineharrellcomplex/golden-bootstrap/main/install.sh)
