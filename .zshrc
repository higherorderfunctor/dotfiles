export ZSH="$HOME/.oh-my-zsh"

# theme
ZSH_THEME="robbyrussell"

# static plugins
plugins=(
  git
)

# poetry
[[ -f ~/.local/bin/poetry ]] && plugins+=('poetry')

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# vim bindings
bindkey -v

# history
setopt HIST_IGNORE_SPACE

# bitwarden
eval "$(bw completion --shell zsh); compdef _bw bw;"

# envs
export PATH="$HOME/.local/bin:$PATH"
export MANPATH="$HOME/.local/man:$MANPATH"
export EDITOR="nvim"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
