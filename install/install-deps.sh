#!/bin/zsh

# NVIM 
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim

#Powerlevel10k
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

#ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
source $HOME/.asdf/asdf.sh
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
NODEJS_CHECK_SIGNATURES=no asdf install nodejs 16.17.0
asdf global nodejs $(asdf list nodejs | tail -1 | sed 's/^ *//g')

#Git Branch Utils
npm install -g git-branch-utils

