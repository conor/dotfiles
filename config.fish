# Aliases for Neovim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# Aliases for Git
alias gst="git status"
alias gco="git checkout"
alias glg="git log"
alias gca="git commit -a"
alias gcb="git checkout -b"
alias gbd="git branch -d"
alias gaa="git add ."
alias gm="git merge"
alias gr="git rebase"

# Config for Pure theme
set pure_symbol_prompt '→'

# Config for Neovim
set --export EDITOR "nvim -f"
set --export GIT_EDITOR "nvim -f"

# Setup direnv
# eval (direnv hook fish)
