#! /bin/sh

echo "Update Linux"
apt-get update
apt-get upgrade -y

echo "Installing Dependencies"
apt-get install -y vim
apt-get install -y wget
apt-get install -y curl
apt-get install -y g++
apt-get install -y git
apt-get install -y build-essential
apt-get install -y libxml2-dev
apt-get install -y libxslt-dev

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

echo "Installing Node"
apt-get install -y nodejs

echo "Install Packages"
npm install -g gulp-cli
npm install -g yarn
npm install -g bower
npm install -g grunt-cli

cd /
cd root