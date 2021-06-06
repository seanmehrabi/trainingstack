#installing DevOps Admin Tools in Windows using Choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco upgrade chocolatey
choco install -y nano
choco install -y python
choco install -y notepadplusplus
choco install -y git.install
choco install -y googlechrome
choco install -y firefox
choco install -y curl
choco install -y atom
choco install -y putty
choco install -y visualstudiocode

#Adding Azure 
choco install -y azure-cli
choco install -y azurepowershell
choco install -y microsoftazurestorageexplorer

#AWS
choco install -y awscli
choco install -y awstools.powershell
choco install -y aws-iam-authenticator

#Rackspace 
choco install -y rack

#Ali Cloud
choco install -y aliyun-cli 

#Google Cloud SDK (cli)
choco install -y gcloudsdk

# Docker
choco install -y docker-desktop
choco install -y docker-compose


#Kubernetes Kubectl
choco install -y kubernetes-cli

# Installing Linux Sub in Windows 
choco install -y wsl 
choco install -y wsl-ubuntu-1804

#Adding Chef
choco install -y chefdk

#Adding Puppet 
choco install -y pdk

#Adding HashiCorp 
choco install -y terraform
choco install -y packer
choco install -y vault
