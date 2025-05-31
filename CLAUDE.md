# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that provides automated setup for a complete development environment. The repository contains configuration files for Neovim, Fish shell, Git, Ghostty terminal, and package management via Homebrew.

## Key Commands

### Installation and Setup
- `./install.sh` - Full automated setup (installs Homebrew, packages, sets shell, creates symlinks)
- `brew bundle --file=Brewfile` - Install/update packages from Brewfile
- `brew bundle dump --file=Brewfile --force` - Update Brewfile with currently installed packages

### Testing Configuration
- Test Fish shell: `fish -c "echo 'Fish is working'"` 
- Test Neovim: `nvim --headless -c 'qall'` to verify config loads
- Test symlinks: Check `ls -la ~/.config/` for proper symlink creation

## Architecture

### Directory Structure
- `fish/` - Complete Fish shell configuration (config, functions, completions)
- `nvim/` - Neovim configuration with Kickstart.nvim base and custom plugins
- `git/` - Git configuration with 1Password SSH signing enabled
- `ghostty/` - Terminal emulator configuration  
- `mise/` - Development tool version manager configuration
- `opencode/` - OpenCode AI coding assistant configuration
- `Brewfile` - Homebrew package definitions (CLI tools, GUI apps, fonts, VSCode extensions)
- `install.sh` - Idempotent installation script

### Configuration Management
All configurations use symlinks to `~/.config/` directories. The install script:
1. Backs up existing configs before replacement
2. Creates directory structure at `~/Developer/personal/`
3. Can be run multiple times safely (idempotent)
4. Handles Homebrew installation and package management
5. Sets Fish as default shell

### Key Tools Configured
- **Neovim**: IDE setup with Copilot, TypeScript tools, Git integration
- **Fish Shell**: Modern shell with Starship prompt
- **Mise**: Replaces version managers like nvm, rbenv (configured in `mise/config.toml`)
- **Git**: Uses 1Password for SSH signing, main branch as default
- **Ghostty**: Fast terminal emulator
- **OpenCode**: AI coding assistant with Claude 4 Sonnet integration

## Development Notes

When modifying configurations:
- Test changes before committing by running the install script in a VM or container
- Update Brewfile when adding new tools: `brew bundle dump --file=Brewfile --force`
- Fish functions go in `fish/functions/`, completions in `fish/completions/`
- Neovim plugins are managed via lazy.nvim, custom plugins in `nvim/lua/custom/plugins/`