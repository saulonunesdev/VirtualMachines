echo "Update Linux"
sudo apt-get update
sudo apt-get upgrade -y

echo "Installing Dependencies and Essencials"
sudo apt-get install -y g++ unzip git make
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

echo "Installing Node"
sudo apt-get install -y nodejs

#sudo chown -R $USER:$(id -gn $USER) /home/vagrant/.config

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

echo "Install Packages"
sudo npm install -g gulp-cli
sudo npm install -g yarn