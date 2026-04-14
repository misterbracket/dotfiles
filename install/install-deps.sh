#!/bin/zsh

#mise
curl https://mise.run | sh
eval "$(~/.local/bin/mise activate zsh)"
mise install

#Git Branch Utils
npm install -g git-branch-utils

#TPM
mkdir -p ~/.config/tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
