if type brew &>/dev/null; then
  fpath+=("$(brew --prefix)/share/zsh/site-functions")
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi