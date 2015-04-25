# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME=geoffgarside
#ZSH_THEME=itchy
#ZSH_THEME=jreese
ZSH_THEME=lambda
#ZSH_THEME=lukerandall
#ZSH_THEME=maran
#ZSH_THEME=mikeh
#ZSH_THEME=miloshadzic
#ZSH_THEME=mortalscumbag
#ZSH_THEME=norm
#ZSH_THEME=obraun
#ZSH_THEME=sonicradish
#ZSH_THEME=suvash
#ZSH_THEME=terminalparty
#ZSH_THEME=theunraveler
#ZSH_THEME=tjkirch
#ZSH_THEME=tjkirch_mod
#ZSH_THEME=wedisagree
#ZSH_THEME=xiong-chiamiov-plus
#ZSH_THEME=nanotech
#ZSH_THEME=mortalscumbag

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# cap-aa() { cap production tail:access | _filter_ajax | _filter_assets | _filter_server | _filter_blog | _filter_admin | _awka }
# cap-a()  { cap production tail:access }
# cap-r()  { cap production tail:rails }
# _filter_ajax()   { grep -Ev -e 'GET /(stock|loading|time_sale)' -e 'GET /products/.*/stock' -e 'POST /product_browsing_histories' }
# _filter_assets() { grep -Ev -e 'GET /(assets|fonts|favicon)' }
# _filter_server() { grep -Ev -e 'GET /(robots|server-status|nginx_status)' -e 'POST /cart' -e 'OPTIONS' }
# _filter_blog()   { grep -Ev -e '(GET|POST) /(blog|faq)' }
# _filter_admin()  { grep -Ev -e '(GET|POST) /admin' }
# _filter_all()     { _filter_ajax | _filter_assets | _filter_server | _filter_blog | _filter_admin }
# _awka() { awk '{print $5,$6,$7,$8,$9,$10,$NF}'}

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git)
plugins=()

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/fukajun/bin:$PATH

# tmux window number
PROMPT+='$([ -n "$TMUX" ] && tmux display -p "[😋 #I]") '

# ctrl - u behavior
bindkey \^U backward-kill-line

# PGSQL
export PGDATA=/usr/local/var/postgres

# Custom command and alias
source ~/.commands
#export PATH=/usr/local/sbin:/usr/local/heroku/bin:/Users/fukajun/.rvm/gems/ruby-2.0.0-p247/bin:/Users/fukajun/.rvm/gems/ruby-2.0.0-p247@global/bin:/Users/fukajun/.rvm/rubies/ruby-2.0.0-p247/bin:/Users/fukajun/.rvm/bin:/Users/fukajun/bin:/Users/fukajun/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export GOROOT=/usr/local/Cellar/go/1.1.2/libexec
export GOPATH=$HOME/goprojects
export PATH=$PATH:$GOPATH/bin

# peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# node
if [[ -f ~/.nodebrew/nodebrew ]]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  nodebrew use v0.10
fi

# bundle
export BUNDLER_EDITOR=vim
