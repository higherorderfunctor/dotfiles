# Dotfiles

## Setup

```console
git clone --bare git@github.com:higherorderfunctor/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout main

.local/bin/dotfiles-update

# restart shell
```

## Update

```console
dotfiles-update
```

## Backup

```console
# unlock (start new shell)
vault unlock

# lock
exit

# show file locks (slow)
lsof | grep /path/to/mount

# show file locks for common culprits (fast)
lsof -p $(pidof xdg-document-portal) | grep /path/to/mount
```
