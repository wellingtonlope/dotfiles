#! /bin/bash

SUDO=''
if (( $EUID -ne 0 )); then
	SUDO='sudo'
fi
$SUDO apt install git zsh curl vim -y

mkdir ~/.scripts

curl -L git.io/antigen > ~/.scripts/antigen.zsh
curl -L https://raw.githubusercontent.com/wellingtonlope/dotfiles/main/.ideavimrc > ~/.ideavimrc
curl -L https://raw.githubusercontent.com/wellingtonlope/dotfiles/main/.zshrc > ~/.zshrc
curl -L https://raw.githubusercontent.com/wellingtonlope/dotfiles/main/.p10k.zsh > ~/.p10k.zsh

$SUDO chsh -s /bin/zsh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install nvim lazygit

git clone https://github.com/wellingtonlope/my-neovim.git
mkdir -p ~/.config/nvim
mv my-neovim ~/.config/nvim

echo $SUDO apt update -y && $SUDO apt upgrade -y && $SUDO apt autoremove -y && brew upgrade > ~/.scripts/up 
chmod +x ~/.scripts/up 
cd ~/.scripts
./up
