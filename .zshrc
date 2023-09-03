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

export EDITOR="vim"

export PATH="$HOME/.local/bin:$PATH"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
