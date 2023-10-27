#! /bin/bash

if ["$EUID" -ne 0]; then
	apt install git zsh curl -y
else
	sudo apt install git zsh curl -y
fi

mkdir ~/.scripts

curl -L git.io/antigen > ~/.scripts/antigen.zsh
curl -L https://raw.githubusercontent.com/wellingtonlope/dotfiles/main/.ideavimrc > ~/.ideavimrc
curl -L https://raw.githubusercontent.com/wellingtonlope/dotfiles/main/.zshrc > ~/.zshrc
curl -L https://raw.githubusercontent.com/wellingtonlope/dotfiles/main/.p10k.zsh > ~/.p10k.zsh

zsh
