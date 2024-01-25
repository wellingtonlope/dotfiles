#!/bin/bash

SUDO=''
if [ "$UID" -ne 0 -o "$EUID" -ne 0 ]; then
	SUDO='sudo'
fi
$SUDO apt update
$SUDO apt install git zsh curl vim build-essential -y

mkdir ~/.scripts

curl -L git.io/antigen > ~/.scripts/antigen.zsh
curl -L https://raw.githubusercontent.com/wellingtonlope/dotfiles/main/.ideavimrc > ~/.ideavimrc
curl -L https://raw.githubusercontent.com/wellingtonlope/dotfiles/main/.zshrc > ~/.zshrc
curl -L https://raw.githubusercontent.com/wellingtonlope/dotfiles/main/.p10k.zsh > ~/.p10k.zsh

$SUDO chsh -s /bin/zsh

echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.zshrc

brew install nvim lazygit asdf

asdf plugin add golang
asdf plugin add nodejs
asdf install golang latest
asdf install nodejs latest
asdf global golang latest
asdf global nodejs latest

~/.asdf/shims/go install github.com/go-delve/delve/cmd/dlv@latest

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# git clone https://github.com/wellingtonlope/my-neovim.git
# mkdir -p ~/.config/nvim
# cp -R my-neovim/* ~/.config/nvim
# rm -r my-neovim

echo "$SUDO apt update -y && $SUDO apt upgrade -y && $SUDO apt autoremove -y && brew upgrade" > ~/.scripts/up 
chmod +x ~/.scripts/up 
~/.scripts/up

nvim --headless "+Lazy! sync" +qa

zsh
