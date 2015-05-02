# Alias
alias be="bundle exec"

export TERM=xterm-256color
# For ghq
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

# For rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# For bundle open
export EDITOR=vim
export BUNDLE_EDITOR=vim
export VISUAL=vim

# LS color
export LSCOLORS='gxfxcxdxbxGxDxabagacad'

# Load bashrc
test -r ~/.bashrc && . ~/.bashrc
# Load secret
test -r ~/.secret && . ~/.secret


