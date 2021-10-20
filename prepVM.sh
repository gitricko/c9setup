#!/bin/bash

# increase size of disk
source ${BASH_SOURCE%/*}/resize.sh 100

# install binaries
sudo apt-get -y install docker-compose jq zsh
sudo snap install liquibase

# install homebrew
mkdir $HOME/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/homebrew
echo "export PATH=$HOME/homebrew/bin:$PATH" >> ~/.bashrc

# install miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
eval "$(~/miniconda/bin/conda shell.bash hook)" 
conda init

source ~/.bashrc
brew update

# install helm and other tools
brew install helm kubectl kind certbot
brew install cloudfoundry/tap/cf-cli@6

# install kubectl in root
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# .profile
echo "source ~/.bashrc" >> ~/.profile