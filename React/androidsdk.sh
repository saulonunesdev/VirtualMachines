echo "Installing ANDROID SDK Dependencies"
sudo apt-get install -y libc6-dev-i386 lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6

echo "Installing ANDROID SDK"
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

cd ~
sudo echo export ANDROID_HOME=$HOME/android >> ~/.bashrc
source ~/.bashrc
sudo echo export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platforms:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/23.0.1:$ANDROID_HOME/tools/bin >> ~/.bashrc
source ~/.bashrc

sudo chmod -R 777 /home/vagrant/

echo "END"
echo "Check Your Enviroment Variables echo $ANDROID_HOME and echo $PATH"
echo "EXECUTE: sudo /home/vagrant/android/platform-tools/adb start-server"