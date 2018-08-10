#installing DevOps Admin Tools in Windows using Choco
$script = New-Object Net.WebClient
$script.DownloadString("https://chocolatey.org/install.ps1")
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | iex
choco upgrade chocolatey
choco install -y nano
choco install -y python
choco install -y notepadplusplus
choco install -y git.install
choco install -y googlechrome
choco install -y firefox
choco install -y awscli
choco install -y awstools.powershell
choco install -y curl
choco install -y atom
choco install -y putty
choco install -y visualstudiocode
#Adding Chef
choco install -y chefdk
choco install -y terraform
