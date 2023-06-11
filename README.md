# Dotfiles

[Here's a description of how my dotfiles work](https://shaky.sh/simple-dotfiles/).

## Install

```
git clone <this-repo>
cd <this-repo>
./install/install-deps-macos.sh
./install/install-deps.sh
./install/bootstrap.sh
```

## To Do
[] Add Terminal and zshrc config to repo
[] Explore Git Submodules

## Local ZSH Config

If there's customization you want ZSH to load on startup that is specific to 
this machine (stuff you don't want to commit into the repo), create `~/.env.sh`
and put it in there. It will be loaded near the top of `.zshrc`.
