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
#emulator -avd Marsh23