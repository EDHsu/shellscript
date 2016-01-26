#!/bin/sh

echo "==> 0 - initialize installation"
sudo apt-get update
sudo apt-get install -y git curl build-essential python-pip

echo "==> 1 - install npm and node"
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential npm

echo "==> 2 - install ultimate vimrc (https://github.com/amix/vimrc)"
#git clone https://github.com/amix/vimrc.git ~/.vim_runtime
#sh ~/.vim_runtime/install_awesome_vimrc.sh

echo "==> 3 - install vundle"
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "==> 4 - replace .vimrc, and add plugin into .vimrc"
cd ~/
rm ~/.vimrc
cp ~/shellscript/port_dev_setup/.vimrc ~/

echo "==> 5 - start to install vim's plugin via vundle"
vim +PluginInstall +qall

echo "==> 6 - install meteorjs"
curl https://install.meteor.com/ | sh

echo "==> 7 - auto-remove"
sudo apt-get autoremove

