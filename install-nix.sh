#!/bin/bash

nix-env -iA stow git

mkdir git
cd git

git clone https://github.com/wellingtonlope/dotfiles.git
cd dotfiles

stow base
stow nvim

nix-env -irf ~/env.nix

git config --global core.editor nvim

chsh -s $(which zsh) $USER

zsh