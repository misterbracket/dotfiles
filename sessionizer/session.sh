#!/usr/bin/env bash

#Basically the same as the TMUX_SESSIONIZER but uses fzf-tmux
#and it is a proper shell script that uses bash

SESSION_CWD=$(fd . ~/myCode --maxdepth 2 --type directory | fzf-tmux --print-query | tail -1)

if [ -z $SESSION_CWD ]; then
	echo "No directory selected"
	exit 1
fi

SESSION_NAME=$(basename $SESSION_CWD | tr . _)
DIRECTORY_EXISTS=$(fd . ~/myCode --maxdepth 2 --type directory | grep -c "$SESSION_CWD")

if [ $DIRECTORY_EXISTS -eq 0 ]; then
	mkdir -p ~/myCode/private/$SESSION_CWD
	SESSION_CWD=~/myCode/private/$SESSION_CWD
	echo "Created new directory $SESSION_CWD"
fi

TMUX_RUNNING=$(pgrep tmux)

# If tmux is not running and you and you are not in a tmux session, start a new session
if [[ -z $TMUX ]] && [[ -z $TMUX_RUNNING ]]; then
	tmux new-session -s $SESSION_NAME -c $SESSION_CWD
	exit 0
fi

if ! tmux has-session -t=$SESSION_NAME 2>/dev/null; then
	tmux new-session -ds $SESSION_NAME -c $SESSION_CWD
fi

# Check whether you are inside a TMUX Session
if [ -z "$TMUX" ]; then
	tmux attach -t $SESSION_NAME
else
	tmux switch-client -t $SESSION_NAME
fi
