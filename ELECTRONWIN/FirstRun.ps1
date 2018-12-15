#Run These Commands Manually in Windows PowerShell Admin Mode
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco upgrade chocolatey
choco -v