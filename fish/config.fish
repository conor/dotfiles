eval "$(/opt/homebrew/bin/brew shellenv)"
starship init fish | source

# Initialize mise (Dev tool version manager)
if command -v mise >/dev/null
    mise activate fish | source
else
    echo "Warning: mise is not installed. Run 'brew bundle' to install it."
end