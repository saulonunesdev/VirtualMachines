#Vagrant and Virtualbox Installation
choco install vagrant -y
choco install virtualbox -y
#Refresh PowerShell Environment Variables
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

#Change VirtualBox VIRTUALMACHINES Directory
D:
md VirtualBox\VirtualMachines
#Check Current VM Folder
vboxmanage list systemproperties
#Change VM Folder 
vboxmanage setproperty machinefolder D:\VirtualBox\VirtualMachines

#Change VAGRANT BOXES Directory
D:
md Vagrant\Boxes
Get-ChildItem Env:
[Environment]::SetEnvironmentVariable("VAGRANT_HOME", "D:\Vagrant\Boxes", "Machine")
#Check Current BOX Folder
refreshenv
Get-ChildItem Env:
#Get-ChildItem Env:VAGRANT_HOME


vagrant plugin install vagrant-vbguest