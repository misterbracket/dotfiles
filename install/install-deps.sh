#!/bin/zsh

#Powerlevel10k
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

#mise
curl https://mise.run | sh
eval "$(~/.local/bin/mise activate zsh)"
mise install

#Git Branch Utils
npm install -g git-branch-utils

#Zsh Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-autosuggestions

#Zsh Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

#TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
