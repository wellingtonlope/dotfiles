source $HOME/.scripts_untracked/antigen.zsh

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen apply

eval "$(starship init zsh)"

# GO
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

# $PATH
export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:$GOBIN
