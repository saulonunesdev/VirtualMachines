#MongoDB Installation
$dir = "D:\Mongo"
$mongo = "mongodb-win32-x86_64-2008plus-ssl-4.0.4"
$url = "https://fastdl.mongodb.org/win32/"+$mongo+".zip"
$output = $dir+$mongo+".zip"

md $dir
md $dir"\data\db"
md $dir"\logs"

Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $output

Expand-Archive $output -DestinationPath $dir

Remove-Item –path $output

$oldPath=(Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path
$newPath=$oldPath+’;’+$dir+"\"+$mongo+"\bin\"
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH –Value $newPath
refreshenv
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

mongod --version
mongo -version

#mongod --dbpath=D:\Mongo\data\db –-logpath D:\Mongo\logs\mongo.log