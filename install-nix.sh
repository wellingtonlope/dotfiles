#!/bin/bash

nix-channel --add https://nixos.org/channels/nixpkgs-unstable userpkgs
nix-channel --update

nix-env -iA userpkgs.stow

git clone https://github.com/LazyVim/starter $HOME/.config/nvim
rm -rf $HOME/.config/nvim/.git

git clone https://github.com/wellingtonlope/dotfiles.git
cd dotfiles

stow --adopt base
stow --adopt nvim

git reset --hard

nix-env -if $HOME/env.nix

git config --global core.editor nvim

chmod +x $HOME/.scripts/*

mkdir $HOME/.scripts_untracked
curl -L git.io/antigen >$HOME/.scripts_untracked/antigen.zsh
chsh -s $(which zsh) $USER
zsh
