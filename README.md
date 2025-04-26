# Dotfiles

This repository contains my personal dotfiles for setting up a new development environment quickly and consistently.

## What's Included

- Neovim configuration
- Git configuration
- Fish shell setup
- Ghostty terminal configuration
- Homebrew package management (via Brewfile)

## Quick Install

To install these dotfiles on a new system, run the following command:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/conor/dotfiles/main/install.sh)"
```

This will:

- Create the directory structure `$HOME/Developer/personal`
- Clone this repository to `$HOME/Developer/personal/dotfiles`
- Install Homebrew if not already installed
- Install packages from the Brewfile
- Set Fish shell as the default shell
- Configure Homebrew in Fish shell
- Symlink all configuration files to their appropriate locations

## Manual Installation

If you prefer to install manually:

1. Clone the repository:

   ```bash
   mkdir -p ~/Developer/personal
   git clone https://github.com/conor/dotfiles.git ~/Developer/personal/dotfiles
   ```

2. Run the install script:
   ```bash
   cd ~/Developer/personal/dotfiles
   ./install.sh
   ```

## Features

- **Idempotent**: The installation script can be run multiple times without causing issues
- **Backup**: Any existing configuration files will be backed up before being replaced
- **Modular**: Configuration is organized by application

## Customization

Feel free to fork this repository and customize it to your needs. The directory structure is designed to be intuitive and easy to modify.

## License

This project is open source and available under the [MIT License](LICENSE).
