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
# mount encrypted local directory
mkdir -p ~/.local/share/rclone/mnt/Personal && rclone mount -v \
  --progress \
  --stats 5s \
  --transfers 32 \
  --vfs-cache-mode full \
  crypt-personal: ~/.local/share/rclone/mnt/Personal

# mount encrypted remote directory
mkdir -p ~/.local/share/rclone/mnt/Personal && rclone mount -v \
  --progress \
  --stats 5s \
  --transfers 32 \
  --vfs-cache-mode full \
  crypt-b2-personal: ~/.local/share/rclone/mnt/Personal

# unmount encrypted directory
fusermount -u ~/.local/share/rclone/mnt/Personal

# force unmount encrypted directory
fusermount -uz ~/.local/share/rclone/mnt/Personal

# TODO needs further work of when to use resync

# check for changes between local and remote
rclone bisync ~/Backups/Personal b2:caubut-b2-personal --verbose --dry-run --resync

# check for changes with filesnames between local and remote
rclone bisync crypt-personal: crypt-b2-personal: --verbose --dry-run --resync

# sync local and remote (without decrypting/encrypting)
rclone bisync ~/Backups/Personal b2:caubut-b2-personal --verbose
```
