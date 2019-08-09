#Installation and Configution of SDK MANAGER and Dependencies
choco install -y jre8
choco install android-sdk -y
Out-File -FilePath $env:USERPROFILE\.android\repositories.cfg
$oldPath=(Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path
$newPath=$oldPath+’;C:\Android\android-sdk\tools\bin’
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH –Value $newPath
refreshenv
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

start "C:\Program Files\Git\git-bash.exe" -d "D:\Saulo\Documents\Work\VirtualMachines\Scripts\Windows\skdmanager-licenses.sh"

#Update TOOLS
sdkmanager "platform-tools" "platforms;android-26"
sdkmanager "build-tools;23.0.1" 
sdkmanager "tools"
sdkmanager "--list"
sdkmanager "add-ons;addon-google_apis-google-23" "platforms;android-23" "system-images;android-23;default;x86_64" "system-images;android-23;google_apis;x86_64" "extras;intel;Hardware_Accelerated_Execution_Manager"
start C:\Android\android-sdk\extras\intel\Hardware_Accelerated_Execution_Manager\silent_install.bat