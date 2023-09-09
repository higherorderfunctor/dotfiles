# Dotfiles

## Setup

### Secure System

```console
git clone --bare git@github.com:higherorderfunctor/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout main

.local/bin/dotfiles-update

# restart shell
```

### Insecure System

```console
git clone --bare https://github.com/higherorderfunctor/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout main

.local/bin/dotfiles-update --no-secure

# restart shell
```

## Update

```console
# secure system
dotfiles-update

# insecure system
dotfiles-update --no-secure

# update environment
source "$HOME/.zshrc" && rehash
```

## Backup

```console
# unlock (start new shell)
vault unlock

# lock
exit

# mount caching flag for remotes
--vfs-cache-mode full

# clear out vfs cache
rm -rf .cache/rclone/vfs/*

# show file locks (slow)
lsof | grep /path/to/mount

# show file locks for common culprits (fast)
lsof -p $(pidof xdg-document-portal) | grep ~/.local/share/rclone/mnt/<MOUNT>

# proton 2fa flag
--protondrive-2fa=

# proton replace failed upload
--protondrive-replace-existing-draft=true

# whole disk backup
sudo dd if=/dev/<DISK> bs=128K status=progress |
  gzip -c >~/.local/share/rclone/mnt/<MOUNT>/<PATH/TO/IMAGE>.gz
```
