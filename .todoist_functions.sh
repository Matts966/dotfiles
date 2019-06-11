select_items_command="todoist --namespace --project-namespace list | peco | cut -d ' ' -f 1 | tr '\n' ' '"

function insert-in-buffer () {
    if [ -n "$1" ]; then
        local new_left=""
        if [ -n "$LBUFFER" ]; then
            new_left="${new_left}${LBUFFER} "
        fi
        if [ -n "$2" ]; then
            new_left="${new_left}${2} "
        fi
        new_left="${new_left}$1"
        READLINE_LINE=$new_left
        READLINE_POINT=${#new_left}
    fi
}

# todoist find item
function peco-todoist-item () {
    local SELECTED_ITEMS="$(eval ${select_items_command})"
    insert-in-buffer $SELECTED_ITEMS
}

bind -x '"\C-tt": "peco-todoist-item"'

# todoist find project
function peco-todoist-project () {
    local SELECTED_PROJECT="$(todoist --project-namespace projects | peco | head -n1 | cut -d ' ' -f 1)"
    insert-in-buffer "${SELECTED_PROJECT}" "-P"
}

bind -x '"\C-tp": peco-todoist-project'

# todoist find labels
function peco-todoist-labels () {
    local SELECTED_LABELS="$(todoist labels | peco | cut -d ' ' -f 1 | tr '\n' ',' | sed -e 's/,$//')"
    insert-in-buffer "${SELECTED_LABELS}" "-L"
}

bind -x '"\C-tl": peco-todoist-labels'

# todoist select date
function peco-todoist-date () {
    date -v 1d &>/dev/null
    if [ $? -eq 0 ]; then
        # BSD date option
        OPTION="-v+#d"
    else
        # GNU date option
        OPTION="-d # day"
    fi

    local SELECTED_DATE="$(seq 0 30 | xargs -I# date $OPTION '+%d/%m/%Y %a' | peco | cut -d ' ' -f 1)"
    insert-in-buffer "'${SELECTED_DATE}'" "-d"
}

bind -x '"\C-td": peco-todoist-date'

function todoist-exec-with-select-task () {
    if [ -n "$2" ]; then
        READLINE_LINE="todoist $1 $(echo "$2" | tr '\n' ' ')"
        READLINE_POINT=$#BUFFER
    fi
}

# todoist close
function peco-todoist-close() {
    local SELECTED_ITEMS="$(eval ${select_items_command})"
    todoist-exec-with-select-task close $SELECTED_ITEMS
}

bind -x '"\C-tc": peco-todoist-close'

# todoist delete
function peco-todoist-delete() {
    local SELECTED_ITEMS="$(eval ${select_items_command})"
    todoist-exec-with-select-task delete $SELECTED_ITEMS
}

bind -x '"\C-tk": peco-todoist-delete'

# todoist open
function peco-todoist-open() {
    local SELECTED_ITEMS="$(eval ${select_items_command})"
    todoist-exec-with-select-task "show --browse" $SELECTED_ITEMS
}

bind -x '"\C-to": peco-todoist-open'
