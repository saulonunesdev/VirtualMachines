#Run These Commands Manually in Windows PowerShell Admin Mode
Get-ExecutionPolicy
Set-ExecutionPolicy AllSigned -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco upgrade chocolatey

#Programs
choco install googlechrome -y
choco install winrar -y
choco install git.install -y
#Git Configuration
# git config --global user.name "NAME"
# git config --global user.email EMAIL
# git config --list
choco install steam -y
choco install vagrant -y
choco install virtualbox -y
choco install slack -y
choco install firefox -y
choco install putty -y
choco install filezilla -y
#Choose Your Favorite Editor or Install All of Them
choco install notepadplusplus.install -y
choco install visualstudiocode -y
choco install atom -y
choco install sourcetree -y

#Change VirtualBox VIRTUALMACHINES Directory !Need To Close/Open Windows PowerShell As Administrator!
D:
md VirtualBox\VirtualMachines
#Check Current VM Folder
# $ vboxmanage list systemproperties
#Change VM Folder 
# $ vboxmanage setproperty machinefolder D:\VirtualBox\VirtualMachines

#Change VAGRANT BOXES Directory !Need To Close/Open Windows PowerShell As Administrator! 
D:
md Vagrant\Boxes
Get-ChildItem Env:
[Environment]::SetEnvironmentVariable("VAGRANT_HOME", "D:\Vagrant\Boxes", "Machine")
#Check Current BOX Folder
refreshenv
Get-ChildItem Env:VAGRANT_HOME

# Installation Steps For React Native 
choco install -y nodejs.install python2 jdk8 -y

#Install Reach Native !Need To Close/Open Windows PowerShell!
npm install -g react-native-cli
npm install -g gulp-cli

#Install Bower - https://bower.io/
npm install -g bower

#Installation and Configution of SDK MANAGER and Dependencies
choco install android-sdk -y
Out-File -FilePath $env:USERPROFILE\.android\repositories.cfg
$oldPath=(Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path
$newPath=$oldPath+’;C:\Android\android-sdk\tools\bin’
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH –Value $newPath
refreshenv
Get-ChildItem Env:path

#Restart Computer
Restart-Computer

sdkmanager "platform-tools" "platforms;android-26"
sdkmanager "build-tools;23.0.1" 

#Update TOOLS
C:
cd /
cd Android\android-sdk
ren tools tools.old
tools.old\bin\sdkmanager.bat "tools"
dir tools*
del tools.old /q /s
tools\bin\sdkmanager.bat --list

#SDKMANAGER Manual Installation Of Packages Google APIs | Android SDK Platform 23 | Intel x86 Atom_64 System Image | Google APIs Intel x86 Atom_64 System Image
sdkmanager "add-ons;addon-google_apis-google-23" "platforms;android-23" "system-images;android-23;default;x86_64" "system-images;android-23;google_apis;x86_64" "extras;intel;Hardware_Accelerated_Execution_Manager"
C:\Android\android-sdk\extras\intel\Hardware_Accelerated_Execution_Manager\intelhaxm-android.exe


#Creating AVD Marshmallow API 23 
avdmanager create avd -n Marsh23 -k "system-images;android-23;google_apis;x86_64"

emulator -list-avds
emulator -avd Marsh23

#VSCODE PLUGINS
choco install plantuml -y
code --install-extension jebbs.plantuml
code --install-extension vsmobile.vscode-react-native
code --install-extension bierner.markdown-preview-github-styles
code --install-extension liximomo.sftp
