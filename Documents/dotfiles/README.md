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

## Unlocking Rclone with Bitwarden

```console
. /dev/fd/3 3<<EOF
$(vault unlock)
EOF
```
