#!/bin/sh

echo "==> install basic tool"
sudo apt-get update
#sudo apt-get upgrade -y
sudo apt-get install -y g++ make build-essential
sudo apt-get install -y git vim htop curl tree


echo "==> install python"
sudo apt-get install -y python-pip python-dev python-software-properties
sudo apt-get autoremove -y

echo "==> pip install python package"
sudo pip install virtualenv
sudo pip intall --upgrade virtualenv

sudo pip install jupyter
sudo pip install --upgrade jupyter

sudo pip install requests
sudo pip install --upgrrade requests


echo "==> install node and npm"
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "==> npm install javascript package"


echo "==> install meteorjs"
curl https://install.meteor.com/ | sh


echo "==> install ultimate vimrc (github.com/amix/vimrc)"
#git clone https://github.com/amix/vimrc.git ~/.vim_runtime
#sh ~/.vim_runtime/install_awesome_vimrc.sh

echo "==> update ultimate vimrc"
cd ~/.vim_runtime
git pull --rebase
cd


echo "==> install atom"
wget https://github.com/atom/atom/releases/download/v1.4.3/atom-amd64.deb
sudo dpkg --install atom-amd64.deb

echo "==> install atom package"
apm install minimap color-picker meteor-api meteor-snippets
apm install linter 

echo "==> install lint"
sudo pip install pylint 

echo "==> update and fininsh installation"
sudo apt-get update
sudo apt-get autoremove
