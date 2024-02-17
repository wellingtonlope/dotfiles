source $HOME/.scripts/antigen.zsh

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# starship
eval "$(starship init zsh)"

# GO
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

# $PATH
export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:$HOME/.asdf/shims
export PATH=$PATH:$GOBIN
export PATH=$PATH:$(asdf where rust)/bin
