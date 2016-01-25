#!/bin/sh

echo "==> 0 - install git, pip"
sudo apt-get install -y git curl python-dev python-pip

echo "==> 1 - install ultimate vimrc (https://github.com/amix/vimrc)"
#git clone https://github.com/amix/vimrc.git ~/.vim_runtime
#sh ~/.vim_runtime/install_awesome_vimrc.sh

echo "==> 8 - install vundle"
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# https://github.com/VundleVim/Vundle.vim#about
#echo "set nocompatible" | sudo tee -a ~/.vimrc
#echo "filetype off" | sudo tee -a ~/.vimrc
#echo "set rtp+=~/.vim/bundle/Vundle.vim" | sudo tee -a ~/.vimrc
#echo "call vundle#begin()" | sudo tee -a ~/.vimrc
#echo "Plugin 'VundleVim/Vundle.vim'" | sudo tee -a ~/.vimrc
#echo "Plugin 'tpope/vim-fugitive'" | sudo tee -a ~/.vimrc
#echo "Plugin 'L9'" | sudo tee -a ~/.vimrc
#echo "Plugin 'git://git.wincent.com/command-t.git'" | sudo tee -a ~/.vimrc
#echo "Plugin 'file:///home/gmarik/path/to/plugin'" | sudo tee -a ~/.vimrc
#echo "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}" | sudo tee -a ~/.vimrc
#echo "Plugin 'user/L9', {'name': 'newL9'}" | sudo tee -a ~/.vimrc
#echo "call vundle#end()" | sudo tee -a ~/.vimrc
#echo "filetype plugin indent on" | sudo tee -a ~/.vimrc

source ~/.vimrc




echo "==> 9 - install youcompleteme"
#sudo apt-get install build-essential cmake
#sudo apt-get install python-dev
