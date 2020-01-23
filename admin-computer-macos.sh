#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update                           # Fetch latest version of homebrew and formula.
brew cask install firefox
brew cask install google-chrome 
brew install docker docker-compose docker-machine xhyve docker-machine-driver-xhyve
brew install kubernetes-cli 
brew cask install atom 
brew cask install sublime-text 
brew install python
sudo easy_install pip
brew install jq 
brew install yq 
brew cask install powershell
brew install git 
brew install curl
brew install putty 
brew install bash-completion
brew cask install chef/chef/chefdk
brew install ansible
brew install terraform
brew cask install visual-studio-code
#install some cool software 
brew cask install spectacle

#AWS 
brew install awscli
brew install aws-iam-authenticator

#Azure 
brew install azure-cli

#Google 
brew cask install google-cloud-sdk 

#AliCloud
brew install aliyun-cli
