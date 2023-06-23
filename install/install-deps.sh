#!/bin/zsh

# AstroNvim 
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim

#Powerlevel10k
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

#asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
source $HOME/.asdf/asdf.sh
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
NODEJS_CHECK_SIGNATURES=no asdf install nodejs 16.17.0
asdf global nodejs $(asdf list nodejs | tail -1 | sed 's/^ *//g')

#Git Branch Utils
npm install -g git-branch-utils

#Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Zsh Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#Zsh Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

