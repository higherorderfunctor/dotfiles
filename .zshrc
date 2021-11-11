export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
)

[[ -d ~/.poetry ]] && plugins+=('poetry')

source $ZSH/oh-my-zsh.sh

bindkey -v
setopt HIST_IGNORE_SPACE

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -d ~/.poetry ] && export PATH=$HOME/.poetry/bin:$PATH

PATH=./node_modules/.bin:$PATH

export EDITOR="vim"
