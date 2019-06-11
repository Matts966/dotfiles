peco_history() { 
  declare l=$(HISTTIMEFORMAT=  history | LC_ALL=C sort -r |  awk '{for(i=2;i<NF;i++){printf("%s%s",$i,OFS=" ")}print $NF}'   |  peco); 
  READLINE_LINE=$l;
  READLINE_POINT=${#l}; 
};
bind -x '"\C-r": peco_history'

