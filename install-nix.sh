#!/bin/bash

nix-env -iA nixpkgs.stow nixpkgs.git

git clone https://github.com/wellingtonlope/dotfiles.git
cd dotfiles

stow base
stow nvim

nix-env -irf ~/env.nix

git config --global core.editor nvim

chsh -s $(which zsh) $USER

zsh