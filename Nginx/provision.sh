echo "Update Linux"
sudo apt-get update
sudo apt-get upgrade -y

echo "Installing Dependencies"
sudo apt-get install -y g++
sudo apt-get install -y git
sudo apt-get install -y build-essential
sudo apt-get install -y libxml2-dev
sudo apt-get install -y libxslt-dev
#sudo apt-get install -y libssl-dev

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

echo "Installing Node"
sudo apt-get install -y nodejs

echo "Install Packages"
sudo npm install -g gulp-cli
sudo npm install -g yarn
sudo npm install -g bower
sudo npm install -g grunt-cli

#npm install
#sudo yarn install
#bower install
#grunt compile