#!/bin/bash
set -e

echo "Starting dotfiles installation..."

# Define important paths
DOTFILES_REPO_URL="https://github.com/conor/dotfiles.git"
PERSONAL_DIR="$HOME/Developer/personal"
DOTFILES_DIR="$PERSONAL_DIR/dotfiles"

# Create Developer/personal directory if it doesn't exist
if [ ! -d "$PERSONAL_DIR" ]; then
  echo "Creating $PERSONAL_DIR directory..."
  mkdir -p "$PERSONAL_DIR"
fi

# Clone the dotfiles repository if it doesn't exist
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Cloning dotfiles repository..."
  git clone "$DOTFILES_REPO_URL" "$DOTFILES_DIR"
else
  echo "Dotfiles repository already exists at $DOTFILES_DIR"
  echo "Pulling latest changes..."
  cd "$DOTFILES_DIR" && git pull
fi

# Move to the dotfiles directory for all following operations
cd "$DOTFILES_DIR"

# Install Homebrew if it isn't installed already
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed. Updating..."
  brew update
fi

# Add Homebrew to path if needed for this script session
if [[ ":$PATH:" != *":/opt/homebrew/bin:"* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install dependencies from Brewfile
echo "Installing dependencies from Brewfile..."
if [ -f "$DOTFILES_DIR/Brewfile" ]; then
  brew bundle --file="$DOTFILES_DIR/Brewfile"
else
  echo "Warning: Brewfile not found at $DOTFILES_DIR/Brewfile"
fi

# Check if fish shell is installed and set as default
if ! grep -q "fish" /etc/shells; then
  echo "Adding fish to /etc/shells..."
  echo "$(which fish)" | sudo tee -a /etc/shells
fi

# Change default shell to fish if not already set
if [[ "$SHELL" != *"fish"* ]]; then
  echo "Changing default shell to fish..."
  chsh -s "$(which fish)"
else
  echo "Fish shell is already the default."
fi

# Function to create symlinks
create_symlink() {
  local source_path="$1"
  local target_path="$2"

  if [ -e "$target_path" ] && [ ! -L "$target_path" ]; then
    echo "Backing up existing $target_path to ${target_path}.backup"
    mv "$target_path" "${target_path}.backup"
  fi

  if [ ! -L "$target_path" ]; then
    echo "Creating symlink for $target_path"
    mkdir -p "$(dirname "$target_path")"
    ln -sf "$source_path" "$target_path"
  else
    echo "Symlink for $target_path already exists"
  fi
}

# Set up fish configuration
echo "Setting up Fish configuration..."
# Define the fish configuration directory (do not create a new one)
FISH_CONFIG_DIR="$HOME/.config/fish"
# Backup existing fish config if it exists and is not a symlink
if [ -d "$FISH_CONFIG_DIR" ] && [ ! -L "$FISH_CONFIG_DIR" ]; then
  echo "Backing up existing fish config directory..."
  mv "$FISH_CONFIG_DIR" "${FISH_CONFIG_DIR}.backup"
fi

# Symlink the entire fish directory
create_symlink "$DOTFILES_DIR/fish" "$FISH_CONFIG_DIR"

# Symlink neovim files
echo "Setting up Neovim configuration..."
create_symlink "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# Symlink git files
echo "Setting up Git configuration..."
create_symlink "$DOTFILES_DIR/git/gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES_DIR/git/gitignore_global" "$HOME/.gitignore_global"

# Symlink ghostty files
echo "Setting up Ghostty configuration..."
create_symlink "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"

echo "Dotfiles installation complete! Some changes may require a restart to take effect."
echo "You may need to open a new terminal window for all changes to apply."
