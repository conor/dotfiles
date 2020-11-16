# Aliases for Neovim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# Aliases for Git
alias gst="git status"
alias gco="git checkout"
alias glg="git log"
alias gcm="git commit -m"
alias gca="git commit -am"
alias gcb="git checkout -b"
alias gbd="git branch -d"
alias gaa="git add ."
alias gm="git merge"
alias gr="git rebase"
alias gps="git push"
alias gpl="git pull"

# Config for Neovim
set --export EDITOR "nvim -f"
set --export GIT_EDITOR "nvim -f"

# Configure fisher to use fishfile
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
