sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install oracle-java8-installer -y
echo JAVA_HOME="/usr/lib/jvm/java-8-oracle" >> /etc/environment
source /etc/environment
echo export JAVA_HOME="/usr/lib/jvm/java-8-oracle" >> ~/.bashrc
echo export PATH=$JAVA_HOME/bin:$PATH >> ~/.bashrc
source /etc/profile

sudo apt-get install -y unzip make
cd ~
wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
tar xf android-sdk*-linux.tgz
wget https://dl.google.com/android/repository/android-ndk-r12b-linux-x86_64.zip
unzip android-ndk*.zip
cd android-sdk-linux/tools
sudo ./android update sdk --no-ui
sudo ./android update sdk --all --no-ui --filter $(seq -s, 27)

echo 'export ANDROID_HOME=$HOME/android-sdk-linux' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools' >> ~/.bashrc

source ~/.bashrc

sudo update-ca-certificates -f

echo SUBSYSTEM=="usb", ATTR{idVendor}=="22b8", MODE="0666", GROUP="plugdev" | sudo tee /etc/udev/rules.d/51-android-usb.rules

sudo adb kill-server
sudo adb start-server
adb devices

cd /var/www/projects/

git clone https://saulonunes@github.com/crosoften/kolabe.git
cd kolabe/
sudo ln -s /home/vagrant/node_modules/ node_modules
echo sdk.dir = /home/vagrant/android-sdk-linux > android/local.properties
npm i -g react-native-cli
npm install
#sudo react-native run-android