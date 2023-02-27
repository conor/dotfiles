# Installation steps
## Download
Download/Clone the repo and rename to .config

## ZSH

1. `ln -s ~/.config/zsh/.zshenv ~/.zshenv`

## Git

1. `ln -s ~/.config/git/.gitconfig ~/.gitconfig`
2. `git config --global core.excludesfile ~/.config/git/.gitignore`

## VS Code
1. `rm -rf ~/Library/Application\ Support/Code/User/keybindings.json`
2. `ln -s ~/.config/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json`
3. `rm -rf ~/Library/Application\ Support/Code/User/settings.json`
4. `ln -s ~/.config/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json`