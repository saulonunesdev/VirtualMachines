#Run These Commands Manually in Windows PowerShell Admin Mode
Get-ExecutionPolicy
Set-ExecutionPolicy RemoteSigned -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco upgrade chocolatey
choco -v