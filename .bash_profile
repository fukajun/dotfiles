
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm//scripts/rvm" # Load RVM into a shell session *as a function*
alias be="bundle exec"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
 . $(brew --prefix)/etc/bash_completion
fi
