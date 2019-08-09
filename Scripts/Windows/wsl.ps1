#Habilitar Developer Mode
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"

#Instalar SubSistema do Windows para Linux
#Digite Y para aceitar e reiniciar o computador
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

#Baixar e Instalar Automaticamente o Ubuntu
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu.appx -UseBasicParsing
Add-AppxPackage .\Ubuntu.appx
ubuntu1804.exe

## SSH KEY
mkdir ${HOME}/.ssh
chmod 700 ~/.ssh
cp saulogit ~/.ssh/
cp saulogit.pub ~/.ssh
chmod 600 ~/.ssh/saulogit
chmod 600 ~/.ssh/saulogit.pub
eval $(ssh-agent -s)
ssh-add ~/.ssh/saulogit

#GIT TESTE
ssh -T git@github.com
ssh -vT git@gitlab.com