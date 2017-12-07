echo "Update Linux"
sudo apt-get update

echo "Installing Git"
sudo apt-get install git -y

echo "Installing Dependencies"
sudo apt-get install -y unzip make
sudo apt-get install -y g++
sudo apt-get install -y build-essential
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

echo "Installing Node"
sudo apt-get install -y nodejs
#sudo ln -s /usr/bin/nodejs /usr/bin/node

#echo "Creating Node Modules"
#mkdir /home/vagrant/node_modules

#echo "Permissions to Nod Modules"
sudo chmod -R ugo+rw /home/vagrant/

echo "Installing WatchMan"
sudo apt-get install python-dev -y
sudo apt-get install autoconf autogen -y
git clone https://github.com/facebook/watchman.git
cd watchman
git checkout v4.1.0
./autogen.sh
./configure
make
sudo make install

echo "Installing React Native Cli"
sudo npm install -g react-native-cli
sudo npm install -g flow-bin