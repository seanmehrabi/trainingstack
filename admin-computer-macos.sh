#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update                           # Fetch latest version of homebrew and formula.
brew install --cask firefox
brew install --cask google-chrome 
brew install docker docker-compose docker-machine xhyve docker-machine-driver-xhyve
brew install kubernetes-cli 
brew install --cask atom 
brew install --cask sublime-text 
brew install python
sudo easy_install pip
brew install jq 
brew install yq 
brew install --cask powershell
brew install git 
brew install curl
brew install putty 
brew install bash-completion
brew install --cask chef/chef/chefdk
brew install ansible
brew install terraform
brew install --cask visual-studio-code
#install some cool software 
brew install --cask spectacle

#AWS 
brew install awscli
brew install aws-iam-authenticator

#Azure 
brew install azure-cli

#Google 
brew install --cask google-cloud-sdk 

#AliCloud
brew install aliyun-cli
