#Run These Commands Manually in Windows PowerShell Admin Mode
Get-ExecutionPolicy
Set-ExecutionPolicy AllSigned -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco upgrade chocolatey

#Programs Utils
choco install googlechrome -y
choco install winrar -y
choco install slack -y
choco install firefox -y
choco install steam -y

#Programs DEV
choco install git.install -y
#Git Configuration
# git config --global user.name "NAME"
# git config --global user.email EMAIL
# git config --list
choco install sourcetree -y
choco install putty -y
#choco install filezilla -y[

#Choose Your Favorite Editor or Install All of Them
choco install notepadplusplus.install -y
choco install visualstudiocode -y
#choco install atom -y

#VSCODE PLUGINS
code --install-extension bierner.markdown-preview-github-styles