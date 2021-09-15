# Docker Setup

```
# clone the repo (auth)
git clone --recurse-submodules -j8 git@github.com:higherorderfunctor/dotfiles.git

# clone the repo (no-auth)
git clone --recurse-submodules -j8 https://github.com/higherorderfunctor/dotfiles.git

# docker
docker build --target dotfiles -t dotfiles:latest .
```
