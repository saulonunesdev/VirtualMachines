sudo apt-get update
sudo apt-get upgrade -y

echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
apt-get update
apt-get install openjdk-8-jre elasticsearch
sudo /usr/share/elasticsearch/bin/elasticsearch-plugin install ingest-attachment
systemctl restart elasticsearch
systemctl enable elasticsearch

apt-get install apt-transport-https locales sudo wget
locale-gen en_US.UTF-8
echo "LANG=en_US.UTF-8" > /etc/default/locale

wget -qO- https://dl.packager.io/srv/zammad/zammad/key | sudo apt-key add -
sudo wget -O /etc/apt/sources.list.d/zammad.list https://dl.packager.io/srv/zammad/zammad/stable/installer/ubuntu/16.04.repo
sudo apt-get update
sudo apt-get install zammad