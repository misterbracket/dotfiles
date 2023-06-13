#!/bin/zsh

git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim


git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.11.3

source $HOME/.asdf/asdf.sh

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
NODEJS_CHECK_SIGNATURES=no asdf install nodejs 16.17.0
asdf global nodejs $(asdf list nodejs | tail -1 | sed 's/^ *//g')

npm install -g git-branch-utils

