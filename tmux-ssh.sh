#!/bin/bash
# ssh-multi
# D.Kovalov
# Based on http://linuxpixies.blogspot.jp/2011/06/tmux-copy-mode-and-how-to-control.html

# a script to ssh multiple servers over multiple tmux panes

DEFAULT_HOSTS="10.200.2.10 10.200.2.11 10.201.2.10 10.201.2.11 10.113.2.15"
starttmux() {
    if [ -z "$HOSTS" ]; then
       #echo -n "Please provide of list of hosts separated by spaces [ENTER]: "
       #read HOSTS
       HOSTS=$DEFAULT_HOSTS
    fi

    local hosts=( $HOSTS )


    tmux new-window "ssh  deployer@${hosts[0]}"
    unset hosts[0];
    for i in "${hosts[@]}"; do
        tmux split-window -h  "ssh  deployer@$i"
        tmux select-layout tiled > /dev/null
    done
    tmux select-pane -t 0
    tmux set-window-option synchronize-panes on > /dev/null

}

HOSTS=${HOSTS:=$*}

starttmux 
