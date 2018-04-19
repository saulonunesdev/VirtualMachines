#Instructions Install PENTAHO 8.0    -> https://help.pentaho.com/Documentation/8.0/Setup/Installation/Manual/Linux_Environment
#Instruction Install TOMCAT   8.0.51 -> https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-8-on-ubuntu-14-04
#Check Linux Version                 ->$ lsb_release -irc
#Check Directory in Linux            ->$ pwd
#Check User Logged                   ->$ whoami
#User: pentaho Password: pentaho

#Update BM
echo "Update Virtual Machine"
sudo apt-get update
sudo apt-get upgrade -y

#Create User Pentaho -s Users Shell -g Users Group -m Create Home Directory
echo "Create User Pentaho -s Users Shell -g Users Group -m Create Home Directory"
sudo useradd pentaho -s /bin/bash -g sudo -m
echo "pentaho:pentaho" | sudo chpasswd

#Change Logged User
echo "Change Logged User"
sudo su pentaho
cd ~
mkdir -p server/pentaho-server
mkdir -p .pentaho

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
cd ~
cd pentaho
#PENTAHO-SERVER-CE
#sudo wget https://sourceforge.net/projects/pentaho/files/Pentaho%208.0/server/pentaho-server-ce-8.0.0.0-28.zip/download
#PDI-CE
#sudo wget https://sourceforge.net/projects/pentaho/files/latest/download?source=files
#PRD-CE
#sudo wget https://sourceforge.net/projects/pentaho/files/Pentaho%208.0/client-tools/prd-ce-8.0.0.0-28.zip/download
#PAD-CE
#sudo wget https://sourceforge.net/projects/pentaho/files/Pentaho%208.0/client-tools/pad-ce-8.0.0.0-28.zip/download
#PSW-CE
#sudo wget https://sourceforge.net/projects/pentaho/files/Pentaho%208.0/client-tools/psw-ce-8.0.0.0-28.zip/download
#PME-CE
#sudo wget https://sourceforge.net/projects/pentaho/files/Pentaho%208.0/client-tools/pme-ce-8.0.0.0-28.zip/download
