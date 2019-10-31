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

# Config for Pure theme
set pure_symbol_prompt '→'

# Config for Neovim
set --export EDITOR "nvim -f"
set --export GIT_EDITOR "nvim -f"

# Setup direnv
# eval (direnv hook fish)

# Setup rbenv
# status --is-interactive; and source (rbenv init -|psub)

# Setup n-install
set -x N_PREFIX "$HOME/n"    # equivalent of export N_PREFIX="$HOME/n";

if not contains -- $N_PREFIX/bin $PATH
  set PATH $PATH $N_PREFIX/bin
end
