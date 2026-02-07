#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install zsh git curl ripgrep stow tmux npm xclip unzip -y

echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.zshenv

brew install nvim lazygit asdf starship rust-analyzer anomalyco/tap/opencode

git config --global core.editor nvim

asdf plugin add golang
asdf install golang latest
asdf set -u golang latest

export GOPATH=~/go

~/.asdf/shims/go install github.com/go-delve/delve/cmd/dlv@latest

git clone https://github.com/wellingtonlope/dotfiles.git $HOME/
cd $HOME/dotfiles

stow --adopt base
stow --adopt nvim

git reset --hard

chmod +x $HOME/.scripts/*

mkdir $HOME/.scripts_untracked
curl -L git.io/antigen >$HOME/.scripts_untracked/antigen.zsh
chsh -s $(which zsh) $USER
zsh

# Install docker and MesloLGM Nerd Font :)
