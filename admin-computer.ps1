mkdir c:\temp\install\

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 

$webClient = New-Object –TypeName System.Net.WebClient

$webClient.DownloadFile('https://github.com/git-for-windows/git/releases/download/v2.17.1.windows.2/Git-2.17.1.2-64-bit.exe','c:\temp\install\git-setup.exe')

$webClient.DownloadFile('https://notepad-plus-plus.org/repository/7.x/7.5.6/npp.7.5.6.Installer.x64.exe','c:\temp\install\npp-setup.exe')

$webClient.DownloadFile('https://az764295.vo.msecnd.net/stable/6a6e02cef0f2122ee1469765b704faf5d0e0d859/VSCodeSetup-x64-1.24.0.exe','c:\temp\install\vc-setup.exe')


$pathvargs = {c:\temp\install\git-setup.exe /verysilent /S /v/qn }
Invoke-Command -ScriptBlock $pathvargs

$pathvargs = {c:\temp\install\npp-setup.exe  /S /v/qn }
Invoke-Command -ScriptBlock $pathvargs

$pathvargs = {c:\temp\install\vc-setup.exe /verysilent /S /v/qn }
Invoke-Command -ScriptBlock $pathvargs

Install-Module -Name AWSPowerShell
