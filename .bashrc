alias be="bundle exec"
alias gti='git'
source ~/.commands

alias c=change-repo
change-repo() {
  output1=$(ghq list -p)
  output2=$(find $HOME/Dropbox/fukajun -maxdepth 2 | grep '.git$' | sed 's/.git$//')
  select=$(echo "$output1\n$output2"  | peco)
  if [ -z "$select" ]; then
    return
  fi
  cd $select
}

alias t=change-tmux
change-tmux() {
  cnt=$(ps -ef | grep tmux | grep -c -v grep)
  if [ $cnt -eq 0 ]; then
    echo "No session"
    return
  fi
  if [ "$TMUX" != "" ]; then
    echo "Already in session"
    return
  fi
  session=$(tmux list-session | peco)
  if [ -z "$session" ]; then
    return
  fi
  session_id=$(echo $session | awk 'BEGIN{FS=":"}{print $1}')
  tmux attach-session -t $session_id
}

alias pb=peco-bundle-open
peco-bundle-open() {
  select=$(bundle list | sed -e 's/^ *\* *//g' | peco)
  select_gem=$(echo $select | awk 'BEGIN{FS=" "}{print $1}')
  echo $select_gem
  if [ -z "$select_gem" ]; then
    return
  fi
  echo $select_gem
  bundle open $select_gem
}

alias h=peco-cmd-history
peco-cmd-history() {
  select=$(history | cut -d ' ' -f 5-  | sort -u | peco)
  if [ "$select" == "" ]; then
    return
  fi
  echo $select
  echo $select >&1
}
