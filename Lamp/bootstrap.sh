#PHP7

sudo apt-get update
sudo apt-get upgrade

sudo apt-get dist-upgrade

sudo apt-get install apache2 apache2-utils -y

sudo service apache2 status
#sudo service apache2 stop
#sudo service apache2 start
#sudo service apache2 restart
apache2 -v

sudo chown www-data /var/www/html/ -R
sudo apt-get install mariadb-server mariadb-client -y

sudo service mysql status

sudo mysql_secure_installation
#password: vagrant

sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
#sudo apt search php7
sudo apt-get install php7.0-fpm php7.0-mysql php7.0-common php7.0-gd php7.0-json php7.0-cli php7.0-curl libapache2-mod-php7.0 -y

sudo a2enmod php7.0

sudo service apache2 restart

php –version

#sudo nano /var/www/html/test.php

#<?php phpinfo(); ?>
