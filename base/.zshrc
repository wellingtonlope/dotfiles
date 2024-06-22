source $HOME/.scripts/antigen.zsh

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen apply

eval "$(starship init zsh)"

# $PATH
export PATH=$PATH:$HOME/.scripts