#!/bin/bash

nix-env -iA nixpkgs.stow

git clone https://github.com/LazyVim/starter $HOME/.config/nvim
rm -rf $HOME/.config/nvim/.git

git clone https://github.com/wellingtonlope/dotfiles.git
cd dotfiles

stow base
stow nvim

nix-env -irf $HOME/env.nix

git config --global core.editor nvim

curl -L git.io/antigen >$HOME/.scripts/antigen.zsh
chsh -s $(which zsh) $USER
zsh