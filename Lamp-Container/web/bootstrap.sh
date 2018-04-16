#Update VM
sudo apt-get update
sudo apt-get upgrade -y
#Uncomment to Upgrade Distro
#sudo apt-get dist-upgrade -y

#Apache
sudo apt-get install apache2 apache2-utils -y

#PHP 7 Installation
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update
sudo apt-get install php7.0-fpm php7.0-mysql php7.0-common php7.0-gd php7.0-json php7.0-cli php7.0-curl libapache2-mod-php7.0 -y

#Configuration
sudo a2enmod php7.0
sudo service apache2 restart
