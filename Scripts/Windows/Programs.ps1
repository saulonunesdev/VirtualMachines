#Programs Utils
choco install googlechrome -y
choco install winrar -y
choco install slack -y
choco install firefox -y
choco install steam -y
choco install foxitreader -y
choco install discord -y
choco install geforce-experience -y
#Programs DEV
choco install git.install -y
#Choose Your Favorite Editor or Install All of Them
choco install notepadplusplus.install -y
choco install visualstudiocode -y
#Git Configuration (Refresh PowerShell Environment Variables)
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
git config --global user.name "NOME"
git config --global user.email EMAIL
git config --list

#Start-Process cmd -Argument "/c Bats/GitConfig.bat"


choco install sourcetree -y
choco install putty -y
#choco install filezilla -y[


#choco install atom -y

#VSCODE PLUGINS
code --install-extension bierner.markdown-preview-github-styles
code --install-extension peterjausovec.vscode-docker
