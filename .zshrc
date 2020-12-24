function peco-history-selection() {
    BUFFER=`history -n 1 | sort | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

function peco-grep() {
    FILE_LINE=$(grep -rni ".*" * | awk '!a[$0]++' | peco)
    FILE=$(cut -d':' -f1 <<<$FILE_LINE)
    LINE=$(cut -d':' -f2 <<<$FILE_LINE)
    echo $FILE | xargs -o vim +$LINE
}
zle -N peco-grep
bindkey '^f' peco-grep

function peco-find() {
    FILE=`find . | peco`
    echo $FILE | xargs -o vim
}
zle -N peco-find
bindkey '^o' peco-find
