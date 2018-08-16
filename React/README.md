# Node VM - v1.0.0

A Node Virtual Machine with Vagrant and VirtualBox

### Settings
  * Winndows Host
    Add Your User/All On SeCreateSymbolicLinkPrivilege privilege found under secpol.msc -> Local Policies\User Rights Assignment\
    ' Must Restart Computer '
  
### Commands
  Start ADB Server
  sudo /home/vagrant/android/platform-tools/adb start-server


  Install Packages with Sudo privileges
    $ sudo npm install
  
  Reload App in Android Device
    $ adb shell input keyevent 82

  Error Local.Properties (Run Inside Directory App)
  echo sdk.dir = /home/vagrant/android > android/local.properties