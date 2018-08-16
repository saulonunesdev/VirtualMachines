echo "Dependencies for Node"
sudo apt-get install -y g++
sudo apt-get install -y build-essential

echo "Installing Node"
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "Install Packages"
sudo npm install -g gulp-cli
sudo npm install -g yarn
sudo npm install -g bower
sudo npm install -g grunt-cli