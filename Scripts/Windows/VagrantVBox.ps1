#Vagrant and Virtualbox Installation
choco install vagrant -y
choco install virtualbox -y
#Change VirtualBox VIRTUALMACHINES Directory !Need To Close/Open Windows PowerShell As Administrator!
D:
md VirtualBox\VirtualMachines
#Check Current VM Folder
vboxmanage list systemproperties
#Change VM Folder 
vboxmanage setproperty machinefolder D:\VirtualBox\VirtualMachines

#Change VAGRANT BOXES Directory !Need To Close/Open Windows PowerShell As Administrator! 
D:
md Vagrant\Boxes
Get-ChildItem Env:
[Environment]::SetEnvironmentVariable("VAGRANT_HOME", "D:\Vagrant\Boxes", "Machine")
#Check Current BOX Folder
refreshenv
Get-ChildItem Env:VAGRANT_HOME