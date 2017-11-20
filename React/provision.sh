echo "Update Linux"
sudo apt-get update
echo "Installing Dependencies"
sudo apt-get install -y build-essential
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
echo "Installing Node"
sudo apt-get install -y nodejs
sudo ln -s /usr/bin/nodejs /usr/bin/node
echo "Upgrading"
sudo apt-get -y upgrade