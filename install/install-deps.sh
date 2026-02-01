#!/bin/zsh

#Powerlevel10k
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

#asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
source $HOME/.asdf/asdf.sh
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
NODEJS_CHECK_SIGNATURES=no asdf install nodejs latest
asdf global nodejs $(asdf list nodejs | tail -1 | sed 's/^ *//g')

#Git Branch Utils
npm install -g git-branch-utils

#Zsh Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-autosuggestions

#Zsh Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

#TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
