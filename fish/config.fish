eval "$(/opt/homebrew/bin/brew shellenv)"

# Initialize starship prompt
if command -v starship >/dev/null
    starship init fish | source
else
    echo "Warning: starship is not installed. Run 'brew bundle' to install it."
end

# Initialize mise (Dev tool version manager)
if command -v mise >/dev/null
    mise activate fish | source
else
    echo "Warning: mise is not installed. Run 'brew bundle' to install it."
end
# Set default editor to Neovim
set -gx EDITOR nvim

alias claude="/Users/cw/.claude/local/claude"

# pnpm
set -gx PNPM_HOME "/Users/cw/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
