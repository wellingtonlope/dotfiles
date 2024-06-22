#!/bin/bash

nix-env -iA nixpkgs.stow nixpkgs.git

git clone https://github.com/wellingtonlope/dotfiles.git
cd dotfiles

stow base
stow nvim

nix-env -irf $HOME/env.nix

git config --global core.editor nvim

curl -L git.io/antigen >$HOME/.scripts/antigen.zsh
chsh -s $(which zsh) $USER
zsh