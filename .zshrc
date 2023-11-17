export ZSH="$HOME/.oh-my-zsh"

# theme
ZSH_THEME="robbyrussell"

# static plugins
plugins=(
  git
)

# poetry plugin
[[ -f ~/.local/bin/poetry ]] && plugins+=('poetry')

# fzf plugin
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# custom completions
fpath=("$ZSH_CUSTOM/completions" $fpath)

# vim bindings
bindkey -v

# history
setopt HIST_IGNORE_SPACE

# envs
export PATH="$HOME/.local/bin:$PATH"
export MANPATH="$HOME/.local/man:$MANPATH"
export EDITOR="nvim"
export LESS='--mouse -R'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# bitwarden
if command -v bw > /dev/null; then
  #eval "$(bw completion --shell zsh); compdef _bw bw;"
fi
