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