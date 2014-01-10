# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias be="bundle exec"
alias tbe="RAILS_ENV=test bundle exec"
alias dbe="RAILS_ENV=development bundle exec"
alias pr="hub pull-request -h"
function gitpr(){
  user=$1
  branch_name=$2
  git push origin ${branch_name}
  hub pull-request -h ${user}:${branch_name}
}
cap-aa() { cap production tail:access | _filter_ajax | _filter_assets | _filter_server | _filter_blog | _filter_admin | _awka }
cap-a()  { cap production tail:access }
cap-r()  { cap production tail:rails }
_filter_ajax()   { grep -Ev -e 'GET /(stock|loading|time_sale)' -e 'GET /products/.*/stock' -e 'POST /product_browsing_histories' }
_filter_assets() { grep -Ev -e 'GET /(assets|fonts|favicon)' }
_filter_server() { grep -Ev -e 'GET /(robots|server-status|nginx_status)' -e 'POST /cart' -e 'OPTIONS' }
_filter_blog()   { grep -Ev -e '(GET|POST) /(blog|faq)' }
_filter_admin()  { grep -Ev -e '(GET|POST) /admin' }
_filter_all()     { _filter_ajax | _filter_assets | _filter_server | _filter_blog | _filter_admin }
_awka() { awk '{print $5,$6,$7,$8,$9,$10,$NF}'}

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/Users/fukajun/.rvm/gems/ruby-2.0.0-p247/bin:/Users/fukajun/.rvm/gems/ruby-2.0.0-p247@global/bin:/Users/fukajun/.rvm/rubies/ruby-2.0.0-p247/bin:/Users/fukajun/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

# tmux window number
PROMPT+='$([ -n "$TMUX" ] && tmux display -p "[😋 #I]") '

# ctrl - u behavior
bindkey \^U backward-kill-line
