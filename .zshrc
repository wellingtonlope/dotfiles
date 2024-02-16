source ~/.scripts/antigen.zsh

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
export GOPATH=~/go

# $PATH
export PATH=$PATH:~/.scripts
export PATH=$PATH:~/.asdf/shims
export PATH=$PATH:~/go/bin
export PATH=$PATH:$(asdf where rust)/bin
