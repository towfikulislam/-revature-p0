#!/bin/bash

## ubuntu
apt update
apt upgrade
apt install build-essential curl file git

echo 'Ubuntu setup is complete'

## brew
## brew/script link

## echo -ne '\n' | -this could be used so i dont have to hit enter to continue 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"


## to set path to ~/.profile
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

##install git, az-cli and node and node/tolls

## or everyting could be in one line line brew install gcc node etc
brew install gcc 
brew install git
brew install azure-cli
brew install node
