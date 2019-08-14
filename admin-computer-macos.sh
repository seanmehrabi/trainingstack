#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update                           # Fetch latest version of homebrew and formula.
brew cask install firefox
brew cask install google-chrome 
brew install docker docker-compose docker-machine xhyve docker-machine-driver-xhyve
brew cask install atom 
brew cask install sublime-text 
brew install python
brew cask install minikube
brew install kubernetes-cli 
brew install azure-cli
brew install awscli
sudo easy_install pip
brew install jq 
brew install yq 
brew cask install powershell
brew install git 
brew install curl
brew install putty 
brew cask install chef/chef/chefdk
brew install ansible
brew install terraform
brew cask install visual-studio-code
#install some cool software 
brew cask install spectacle
