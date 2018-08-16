#Instructions Install PENTAHO 8.0    -> https://help.pentaho.com/Documentation/8.0/Setup/Installation/Manual/Linux_Environment
#Instruction Install TOMCAT   8.0.51 -> https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-8-on-ubuntu-14-04
#Download Files: https://sourceforge.net/projects/pentaho/files/
#PentahoLogin: admin password

#Update BM
echo "Update Virtual Machine"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install unzip -y

cd ~
sudo mkdir /opt/pentaho8051ee
#sudo mkdir /home/vagrant/server
#sudo mkdir /home/vagrant/.pentaho

#Install JAVA 8
echo "Installing JAVA8"
sudo apt-get install -y python-software-properties debconf-utils
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer
sudo echo export JAVA_HOME="/usr/lib/jvm/java-8-oracle" >> ~/.bashrc
source ~/.bashrc
sudo echo export PATH=$JAVA_HOME/bin:$PATH >> ~/.bashrc
source ~/.bashrc
echo "Java Installed"

#TOMCAT Install
echo "Add Tomcat User"
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
wget http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-8/v8.0.51/bin/apache-tomcat-8.0.51.tar.gz
sudo mkdir /opt/tomcat
echo "Tomcat Installation"
sudo tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1

#TOMCAT Configuration
echo "Tomcat Configuration"
cd /opt/tomcat
sudo chgrp -R tomcat conf
sudo chmod g+rwx conf
sudo chmod g+r conf/*
sudo chown -R tomcat work/ temp/ logs/
#sudo chown -R tomcat /opt/tomcat/webapp
sudo cp /var/www/tomcat.conf /etc/init/tomcat.conf

#TOMCAT Start Server
sudo initctl reload-configuration
sudo initctl start tomcat
sudo cp /var/www/tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml
sudo initctl restart tomcat
sudo initctl stop tomcat
echo "TOMCAT Installed"
#http://localhost:8080/host-manager/html

#Installation Mysql
echo "Installing Mysql"
sudo apt-get update
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get install -y vim curl python-software-properties
sudo apt-get update
sudo apt-get -y install mysql-server
sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES; SET GLOBAL max_connect_errors=10000;"
sudo /etc/init.d/mysql restart

#Installation PENTAHO
echo "Installing PENTAHO"
cd /var/www/
#if you want to download manually send the zip file to APP Folder and Comment the line below
sudo wget https://sourceforge.net/projects/pentaho/files/Pentaho%208.0/server/pentaho-server-ce-8.0.0.0-28.zip
sudo unzip /var/www/pentaho-server-ce-8.0.0.0-28.zip -d /opt/pentaho8051ee
cd /opt/pentaho8051ee/pentaho-server
sudo ./set-pentaho-env.sh
sudo ./start-pentaho.sh
echo "Installation Complete - Wait ~3 min before prompt http://localhost:8080/