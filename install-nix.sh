#!/bin/bash

nix-env -iA nixpkgs.stow

git clone https://github.com/LazyVim/starter $HOME/.config/nvim
rm -rf $HOME/.config/nvim/.git

git clone https://github.com/wellingtonlope/dotfiles.git
cd dotfiles

stow --adopt base
stow --adopt nvim

git reset --hard

nix-env -irf $HOME/env.nix

git config --global core.editor nvim

mkdir $HOME/.scripts_untracked
curl -L git.io/antigen >$HOME/.scripts_untracked/antigen.zsh
chsh -s $(which zsh) $USER
zsh