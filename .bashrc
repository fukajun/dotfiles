
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH
alias be='bundle exec'
alias gti='git'

# Brew install bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  source `brew --prefix`/etc/bash_completion
fi
