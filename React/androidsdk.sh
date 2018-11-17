echo "Installing ANDROID SDK Dependencies"
sudo apt-get install -y libc6-dev-i386 lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6

echo "Installing ANDROID SDK"
cd /home/vagrant
mkdir android
cd android
wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
unzip sdk-tools-linux-4333796.zip
rm sdk-tools-linux-4333796.zip
cd tools/bin

yes | sudo ./sdkmanager --licenses

#Grant SUDO Permission to SdkManager
sudo chmod +x sdkmanager
#See SDKMANAGER Permission Status -> ls -l sdkmanager
sudo ./sdkmanager "platform-tools" "platforms;android-26" "build-tools;23.0.1" 
sudo ./sdkmanager "add-ons;addon-google_apis-google-23" "platforms;android-23" "system-images;android-23;default;x86_64" "system-images;android-23;google_apis;x86_64"

cd /home/vagrant
sudo echo export ANDROID_HOME=/home/vagrant/android >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc
sudo echo export PATH=$PATH:/home/vagrant/android/tools:/home/vagrant/android/platforms:/home/vagrant/android/platform-tools:/home/vagrant/android/build-tools/23.0.1:/home/vagrant/android/tools/bin >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc

sudo chmod -R 777 /home/vagrant/

echo "END"
echo "Check Your Enviroment Variables echo $ANDROID_HOME and echo $PATH"
echo "EXECUTE: sudo /home/vagrant/android/platform-tools/adb start-server"