ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# GO
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

# $PATH
export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:$HOME/.scripts_untracked
export PATH=$PATH:$GOBIN
export PATH=$PATH:$HOME/.asdf/shims

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit load zdharma-continuum/history-search-multi-word

eval "$(starship init zsh)"
