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

echo ""
echo "Linking dotfiles… "
link_dotfile gitconfig

mkdir -p ~/.config/nvim
link_config nvim init.vim

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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew analytics off
else
  echo "Homebrew already installed."
fi

echo "Installing tools, mac app store, and other apps via Homebrew…"
brew update
brew tap homebrew/bundle
brew bundle
brew upgrade
brew cleanup

# TODO Neovim and Fish installation
# Vim plug
if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
  printf "\nInstalling vim-plug"
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
nvim +PlugInstall +PlugUpgrade +PlugUpdate +PlugClean! +UpdateRemotePlugins +qall


echo ""
echo ""
echo "Complete. Ready to code."
echo "Important: Run fisher to load fish plugins."
echo "touch ~/Documents/*/.metadata_never_index to stop spotlight indexing node_modules, etc…"
