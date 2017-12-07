echo "Installing JAVA8"
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install oracle-java8-installer -y
sudo echo export JAVA_HOME="/usr/lib/jvm/java-8-oracle" >> ~/.bashrc
source ~/.bashrc
sudo echo export PATH=$JAVA_HOME/bin:$PATH >> ~/.bashrc
source ~/.bashrc

echo "installing Android Studio"
cd ~
sudo apt-get install libc6-dev-i386 lib32z1 ia32-libs -y
wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
tar xf android-sdk*-linux.tgz
cd android-sdk-linux/tools
sudo ./android update sdk --no-ui
cd ~
sudo echo export ANDROID_HOME=$HOME/android-sdk-linux >> ~/.bashrc
source ~/.bashrc
sudo echo export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/27.0.1:$ANDROID_HOME/tools/bin >> ~/.bashrc
source ~/.bashrc

sudo touch ~/.android/repositories.cfg

sudo update-ca-certificates -f

echo SUBSYSTEM=="usb", ATTR{idVendor}=="22b8", MODE="0666", GROUP="plugdev" | sudo tee /etc/udev/rules.d/51-android-usb.rules


#sudo apt-get install android-tools-adb
sudo adb kill-server
sudo adb start-server
sudo adb devices


#cd /var/www/projects/
#git clone project
#cd project/
#sudo ln -s /home/vagrant/node_modules/ node_modules
echo sdk.dir = /home/vagrant/android-sdk-linux > android/local.properties
npm install
#sudo react-native run-android