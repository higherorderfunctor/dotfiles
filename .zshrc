export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
)

[[ -f ~/.local/bin/poetry ]] && plugins+=('poetry')

source $ZSH/oh-my-zsh.sh

bindkey -v
setopt HIST_IGNORE_SPACE

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PATH=./node_modules/.bin:/usr/lib/jvm/jdk-20/bin:$PATH

export EDITOR="vim"

export PATH="$HOME/.local/bin:$PATH"
