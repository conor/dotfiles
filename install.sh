#!/usr/bin/env bash

# Exit script immediately if any command returns a non-zero status
set -e


###############################################################################
# Utility functions
###############################################################################

# Create Symlinks
link_to() {
  if [ ! -e "$2" ]; then
    if [ ! -e "$1" ]; then
			echo ""
      echo "WARNING: cannot link $1 because it does not exist"
    else
      ln -s "$1" "$2"
      echo "Linked $2"
    fi
  fi
}

#
link_dotfile() {
  link_to $(pwd)/$1 ~/.$1
}

link_config() {
  link_to $(pwd)/$2 ~/.config/$1/$2
}

###############################################################################
# Preparation
###############################################################################

# Run in setup folder
cd -P "$(dirname "${BASH_SOURCE}")"

# Become superuser
sudo -v

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Keep-alive: update existing `sudo` time stamp until `.install.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Installation
###############################################################################

echo "Hello $(whoami)! Let's get you set up."

# Set the colorscheme of terminal
bash -c  "$(curl -sLo- https://git.io/vQgMr)"

# Set up my work directory
echo ""
echo "Creating ~/dev"
mkdir -p ~/dev
touch ~/dev/.metadata_never_index

echo ""
echo "Linking dotfiles… "
# link_dotfile config
# link_dotfile atom
mkdir -p ~/.config/nvim
mkdir -p ~/.config/atom
mkdir -p ~/.config/fish
link_config nvim init.vim
link_config atom keymap.cson
link_config atom github.cson
link_config atom config.cson
link_config fish fishfile
link_config fish config.fish
link_dotfile gitconfig
link_dotfile tmux.conf

echo ""
echo "Updating macOS…"
sudo softwareupdate -i -a

if [[ "$(xcode-select -p)" == "" ]]; then
  echo "Installing Xcode…"
  xcode-select --install
else
  echo "Xcode already installed."
fi

if ! command -v brew > /dev/null 2>&1; then
  echo "Installing homebrew… "
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew analytics off
else
  echo "Homebrew already installed."
fi

if ! [ -x "$(command -v n)" ]; then
  curl -L https://git.io/n-install | bash
  echo 'n-install and n are now installed'
else
  echo 'n is already installed'
fi

echo "Installing tools, mac app store, and other apps via Homebrew…"
brew update
brew tap homebrew/bundle
brew bundle
brew upgrade
brew cleanup

echo "Installing Neovim python dependencies…"
pip install --upgrade pip
pip3 install --upgrade pip
pip3 install --user --upgrade neovim
pip install --user --upgrade neovim

# Vim plug
if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
  printf "\nInstalling vim-plug"
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
nvim +PlugInstall +PlugUpgrade +PlugUpdate +PlugClean! +UpdateRemotePlugins +qall

if ! grep -q "fish" /etc/shells; then
  printf "\nChanging shell to Fish"
  echo /usr/local/bin/fish | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/fish

  printf "\nInstall Fisher"
  curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
else
  printf "\nFish shell and Fisher already installed"
fi

# Install or update Tuple.app
curl -L https://git.io/tuple-install | bash


# apm install --packages-file atom-package-list.txt
# apm list --installed --bare > atom-package-list.txt

echo ""
echo ""
echo "Complete. Ready to code."
echo "Important: Run fisher to load fish plugins."
echo "Important: Run rbenv init."
