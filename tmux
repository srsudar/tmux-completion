# START tmux completion
# This file is in the public domain
# See: http://www.debian-administration.org/articles/317 for how to write more.
# Usage: Put "source bash_completion_tmux.sh" into your .bashrc
#
# The original version was modified to include support for things beyond simple
# commands. This can be found at:
# https://github.com/srsudar/tmux-completion
_tmux() {
    local cur prev opts onePrev target_commands
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    onePrev="${COMP_WORDS[COMP_CWORD - 1]}"
    target_commands=("attach-session" "has-session" "kill-session" "list-clients" "lock-session"
        "rename-session" "switch-client" "last-window" "list-windows" "next-window" "previous-window"
        "set-hook" "show-hooks" "set-environment" "show-environment" "attach" "a")

    if [ "$COMP_CWORD" -ge 2 ]; then
        # Maybe we want to list available windows. We're going to assume this is
        # defined as: [ls | list-session] -t .
        local windowCommands currentSessions
        windowCommands=("ls", "list-sessions")

        prev="${COMP_WORDS[COMP_CWORD - 2]}"
        if [[ " ${array[@]} " =~ " ${prev} " ]]; then
            if [ "$onePrev" = "-t" ]; then
            # We get a list of all the names.
            # We're assuming this output is in the form:
            # name: some other crap
            # We'll get this by using cut--use ":" as a delimiter, and print the
            # first column.
            # If there are no sessions, we expect the following message on stderr:
            # failed to connect to server: Connection refused
            # In this case we'll return an empty list.
            # NB: Since the failed to connect message is displayed on stderr, we
            # need to pipe both stdout and stderr to cut. Therefore we are piping
            # with |& rather than just |.
            currentSessions=$(tmux ls |& cut -d : -f 1)
            if [[ "${currentSessions[0]}" == "no server running"* ]] || [[ "${currentSessions[0]}" == "error connecting to"* ]]; then
                # we don't want to display any options, so clear the array.
                currentSessions=$( )
            fi
            COMPREPLY=($(compgen -W "${currentSessions}" -- ${cur}))
            return 0
            fi
        fi
    fi

    opts=" \
    attach-session \
    bind-key \
    break-pane \
    capture-pane \
    choose-client \
    choose-session \
    choose-window \
    clear-history \
    clock-mode \
    command-prompt \
    confirm-before \
    copy-buffer \
    copy-mode \
    delete-buffer \
    detach-client \
    display-message \
    display-panes \
    down-pane \
    find-window \
    has-session \
    if-shell \
    join-pane \
    kill-pane \
    kill-server \
    kill-session \
    kill-window \
    last-window \
    link-window \
    list-buffers \
    list-clients \
    list-commands \
    list-keys \
    list-panes \
    list-sessions \
    list-windows \
    load-buffer \
    lock-client \
    lock-server \
    lock-session \
    move-window \
    new-session \
    new-window \
    next-layout \
    next-window \
    paste-buffer \
    pipe-pane \
    previous-layout \
    previous-window \
    refresh-client \
    rename-session \
    rename-window \
    resize-pane \
    respawn-window \
    rotate-window \
    run-shell \
    save-buffer \
    select-layout \
    select-pane \
    select-prompt \
    select-window \
    send-keys \
    send-prefix \
    server-info \
    set-buffer \
    set-environment \
    set-option \
    set-window-option \
    show-buffer \
    show-environment \
    show-messages \
    show-options \
    show-window-options \
    source-file \
    split-window \
    start-server \
    suspend-client \
    swap-pane \
    swap-window \
    switch-client \
    unbind-key \
    unlink-window \
    up-pane"

    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
    return 0

}
complete -F _tmux tmux

# END tmux completion
