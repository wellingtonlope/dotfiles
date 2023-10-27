#! /bin/bash

SUDO=''
if (( $EUID -ne 0 )); then
	SUDO='sudo'
fi
$SUDO apt install git zsh curl vim podman -y

mkdir ~/.scripts

curl -L git.io/antigen > ~/.scripts/antigen.zsh
curl -L https://raw.githubusercontent.com/wellingtonlope/dotfiles/main/.ideavimrc > ~/.ideavimrc
curl -L https://raw.githubusercontent.com/wellingtonlope/dotfiles/main/.zshrc > ~/.zshrc
curl -L https://raw.githubusercontent.com/wellingtonlope/dotfiles/main/.p10k.zsh > ~/.p10k.zsh

$SUDO chsh -s /bin/zsh

echo $SUDO apt update -y && $SUDO apt upgrade -y && $SUDO apt autoremove -y && flatpak update -y > ~/.scripts/up 
chmod +x ~/.scripts/up 
cd ~/.scripts
./up
