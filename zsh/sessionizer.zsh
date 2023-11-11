#!/usr/bin/env bash

function sessionizer() {
  SESSION_CWD=$(fd . ~/myCode --maxdepth 2 --type directory | fzf)
  SESSION_NAME=$(basename $SESSION_CWD | tr . _)

  #Creates a new Zellij Sessions in the CWD
  #It automatically detects if a session exists already and reattaches to it
  zellij options \
  	--attach-to-session true \
  	--session-name "$SESSION_NAME" \
  	--default-cwd "$SESSION_CWD"
}



bindkey -s ^f "sessionizer\n"
