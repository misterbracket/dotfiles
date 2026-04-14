#!/bin/zsh

#mise
curl https://mise.run | sh
eval "$(~/.local/bin/mise activate zsh)"
mise install

#Git Branch Utils
npm install -g git-branch-utils

#TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
