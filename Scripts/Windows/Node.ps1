# Installation Node
choco install -y nodejs.install
choco install -y python2
choco install -y yarn
choco install -y microsoft-build-tools-2013
#Packages And Configuration
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
npm install --global --production windows-build-tools
npm config set msvs_version 2015 --global
npm config set python python2.7
npm install -g http-server
npm install -g gulp-cli
npm install -g electron

#https://www.microsoft.com/en-us/download/details.aspx?id=40760 Microsoft Build Tools 2013
#https://www.microsoft.com/en-us/download/confirmation.aspx?id=48159