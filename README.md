# dotfiles

```
# install dependencies
sudo apt-get install git zsh tmux vim-gtk

# install nord (Gnome Terminal)
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git
cd nord-gnome-terminal/src
./nord.sh
cd ../..
rm -rf nord-gnome-terminal

# install font
https://github.com/powerline/fonts/blob/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf

# update nord profile as default and use powerline font

# install nodejs
VERSION=v15.0.1
DISTRO=linux-x64
wget https://nodejs.org/dist/$VERSION/node-$VERSION-$DISTRO.tar.xz
sudo mkdir /opt/nodejs
sudo tar -xJvf node-$VERSION-$DISTRO.tar.xz -C /opt/nodejs
sudo ln -sfn /opt/nodejs/node-$VERSION-$DISTRO /opt/nodejs/node-current
sudo update-alternatives --install /usr/bin/node node /opt/nodejs/node-current/bin/node 1
sudo update-alternatives --install /usr/bin/npm npm /opt/nodejs/node-current/bin/npm 1
sudo update-alternatives --install /usr/bin/npx npx /opt/nodejs/node-current/bin/npx 1
sudo -i
npm install -g npm@latest
npm install -g yarn
exit
sudo update-alternatives --install /usr/bin/yarn yarn /opt/nodejs/node-current/bin/yarn 1
sudo update-alternatives --install /usr/bin/yarnpkg yarnpkg /opt/nodejs/node-current/bin/yarnpkg 1
sudo rm node-$VERSION-$DISTRO.tar.xz

# clone the repo (auth)
git clone --recurse-submodules -j8 git@github.com:higherorderfunctor/dotfiles.git

# clone the repo (no-auth)
git clone --recurse-submodules -j8 https://github.com/higherorderfunctor/dotfiles.git

# pull submodules if doing regular clone
git submodule update --init --recursive -j8

# update all submodules
git submodule update --recursive --remote

# dotfilesA (assuming clones to ~/Documents)
ln -s $HOME/Documents/dotfiles/.vimrc $HOME/
ln -s $HOME/Documents/dotfiles/.vim $HOME/
ln -s $HOME/Documents/dotfiles/.tmux.conf $HOME/
ln -s $HOME/Documents/dotfiles/.tmux $HOME/

# in vim
:call coc#util#install()

# zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
rm $HOME/.zshrc && ln -s $HOME/Documents/dotfiles/.zshrc $HOME/

# poetry
sudo apt-get install python3-pip python3-distutils
wget https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py -qO - | python3
mkdir $ZSHi_CUSTOM/plugins/poetry
$HOME/.poetry/bin/poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --completion --key-bindings --no-update-rc
```
