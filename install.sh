#! /bin/bash

SUDO=''
if (( $EUID -ne 0 )); then
	SUDO='sudo'
fi
$SUDO apt install git zsh curl -y

mkdir ~/.scripts

curl -L git.io/antigen > ~/.scripts/antigen.zsh
curl -L https://raw.githubusercontent.com/wellingtonlope/dotfiles/main/.ideavimrc > ~/.ideavimrc
curl -L https://raw.githubusercontent.com/wellingtonlope/dotfiles/main/.zshrc > ~/.zshrc
curl -L https://raw.githubusercontent.com/wellingtonlope/dotfiles/main/.p10k.zsh > ~/.p10k.zsh

zsh
