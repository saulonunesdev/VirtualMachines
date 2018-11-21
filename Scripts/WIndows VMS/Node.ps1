# Installation Node
choco install -y nodejs.install
#choco install -y jdk8

#Packages
choco install yarn -y
RefreshEnv
npm install --global --production windows-build-tools
npm config set msvs_version 2015 --global
npm install -g gulp-cli
npm install -g bower
npm install -g grunt-cli
npm install -g http-server