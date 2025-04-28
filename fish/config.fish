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