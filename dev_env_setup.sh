#!/bin/sh

echo "==> 0 - install git, python3 and pip3"
sudo apt-get install -y git python3 python3-pip

echo "==> 1 - install virtualenv via pip"
sudo pip3 install virtualenv

echo "==> 2 - create a virtualenvs directory to store all virtual environments"
mkdir dev
mkdir dev/VENV

echo "==> 3 - make a new virtual environment with no packages"
virtualenv dev/VENV/ --no-site-packages

echo "==> 4 - install ultimate vimrc (https://github.com/amix/vimrc)"
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

echo "==> 5 - install pathogen plugin manager (https://github.com/tpope/vim-pathogen)"
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "==> 6 - setup pathogen path manipulation"
# append row to ~/.vimrc
echo "execute pathogen#infect()" | sudo tee -a ~/.vimrc

echo "==> 7 - install jedi-vim (https://github.com/davidhalter/jedi-vim)"
cd ~/.vim/bundle/
git clone --recursive https://github.com/davidhalter/jedi-vim.git
cd
