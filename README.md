# Installation steps

## Download

1. Download/Clone the repo and rename to .config: `git clone git@github.com:conor/dotfiles.git .config`

## Homebrew

1. `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. `cd brew`
3. `brew bundle install`

## ZSH

1. `ln -s ~/.config/zsh/.zshenv ~/.zshenv`

## Git

1. `ln -s ~/.config/git/.gitconfig ~/.gitconfig`
2. `git config --global core.excludesfile ~/.config/git/.gitignore`

## CLI tools that can't be installed using brew

1. `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash`

## VS Code

1. `rm -rf ~/Library/Application\ Support/Code/User/keybindings.json`
2. `ln -s ~/.config/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json`
3. `rm -rf ~/Library/Application\ Support/Code/User/settings.json`
4. `ln -s ~/.config/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json`
5. `defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false`

## macOS UI

### Finder

1. `defaults write com.apple.finder FXPreferredViewStyle -string "clmv"`
