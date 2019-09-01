# Start tmux session if the terminal is iTerm.
if [[ $TERM_PROGRAM = "iTerm.app" ]]; then
  if [[ -z "$TMUX" ]]; then
    if [[ $(tmux lsc) ]]; then
      echo "There is already a tmux client, so open default client."
    elif tmux has-session 2>/dev/null; then
      exec tmux attach
    else
      exec tmux
    fi
  fi
fi

alias quit='exit'
alias rain='rainbowstream'
alias texshop='open -a TexShop'
alias jn='jupyter notebook'
alias git='hub'
alias less='less -qR'
alias dev_appserver.py='~/google-cloud-sdk/bin/dev_appserver.py'
alias xcode='open -a Xcode'
alias ghc='ghc -Wall'
alias st='stree'
alias commit='commit --allow-empty'
alias t='tmux'
alias ll='ls -l'
alias github='open -a Github\ Desktop'
alias gh='open -a Github\ Desktop'
alias vi='vim'
alias c='clear'

export LANG=ja_JP.UTF-8

ssh-add &> /dev/null
#alias javac='if $(echo $PWD | grep "/Users/masahiromatsui/Dropbox/infoScience/javaDesignPattern/" > /dev/null); then javac -encoding SJIS -Xlint:deprecation; else javac; fi'

export PATH="$HOME/.roswell/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

source ~/.peco_history.sh
source ~/.todoist_functions.sh

HISTSIZE=50000

