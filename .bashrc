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

export LANG=ja_JP.UTF-8

ssh-add &> /dev/null
alias javac='if $(echo $PWD | grep "/Users/masahiromatsui/Dropbox/infoScience/javaDesignPattern/" > /dev/null); then javac -encoding SJIS -Xlint:deprecation; else javac; fi'

export PATH="$HOME/.roswell/bin:$PATH"
