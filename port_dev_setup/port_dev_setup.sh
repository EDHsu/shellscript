#!/bin/sh

echo "==> 0 - install git, pip"
sudo apt-get install -y git curl python-dev python-pip build-essential

echo "==> 1 - install node"
curl -sL https://deb.nodesource.com/setup_5.5 | sudo -E bash -
sudo apt-get install -y npm
sudo apt-get install -y nodejs

cd ~/.vim/bundle/
git clone https://github.com/ternjs/tern_for_vim.git
cd

echo "==> 2 - install pathogen plugin manager (https://github.com/tpope/vim-pathogen)"
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "==> 3 - setup pathogen path manipulation"
# append row to ~/.vimrc
echo "execute pathogen#infect()" | sudo tee -a ~/.vimrc
source ~/.vimrc

echo "==> 4 - install jedi-vim"
cd ~/.vim/bundle/
git clone --recursive https://github.com/davidhalter/jedi-vim.git
cd

echo "==> 5 - install ultimate vimrc (https://github.com/amix/vimrc)"
#git clone https://github.com/amix/vimrc.git ~/.vim_runtime
#sh ~/.vim_runtime/install_awesome_vimrc.sh

echo "==> 6 - install vundle"
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "==> 7 - download YouCompleteMe"
cd ~/.vim/bundle
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe/
git submodule update --init --recursive
cd

echo "==> 8 - install build-essential cmake"
sudo apt-get install -y build-essential cmake
sudo apt-get update

echo "==> 9 - replace .vimrc"
rm ~/.vimrc
cp ~/shellscript/shellscript/port_dev_setup/.vimrc ~/
source ~/.vimrc


echo "==> 10 - install c-family language, go language, javascript language and rust"
#cd ~/.vim/bundle/YouCompleteMe
#./install.sh --clang-completer --tern-completer


