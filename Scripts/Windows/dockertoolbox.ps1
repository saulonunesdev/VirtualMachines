choco install docker-toolbox -y
docker-machine create --driver virtualbox --engine-insecure-registry nexus.dc.sbnet:5000 docker-host
#docker-machine create --driver virtualbox --virtualbox-boot2docker-url https://github.com/boot2docker/boot2docker/releases/download/v19.03.1/boot2docker.iso --engine-insecure-registry nexus.dc.sbnet:5000 docker-host

##ENABLE VOLUME
docker-machine stop docker-host
vboxmanage sharedfolder add docker-host --name "Projetos" --hostpath "D:\Saulo\Documents\Work" --automount
docker-machine start docker-host
docker-machine ssh docker-host
sudo vi /mnt/sda1/var/lib/boot2docker/profile
#	mkdir /projetos
#	sudo mount -t vboxsf -o uid=1000,gid=50 Projetos /projetos
docker-machine stop docker-host
docker-machine start docker-host

#HOW TO USE COMPOSE
#volumes:
#      - /home/docker/projetos/EstoqueEstendido:/Projetos/EstoqueEstendido/

docker-machine regenerate-certs docker-host
docker-machine env docker-host

#copy to ~/.zshrc
#export DOCKER_TLS_VERIFY="1"
#export DOCKER_HOST="tcp://192.168.99.100:2376"
#export DOCKER_CERT_PATH="/c/Users/saulo/.docker/machine/machines/docker-host"
#export DOCKER_MACHINE_NAME="docker-host"
#export COMPOSE_CONVERT_WINDOWS_PATHS="true"

source ~/.zshrc

#docker-machine.exe stop docker-host
#docker-machine.exe start docker-host

#Add docker and docker-compose to the plugins list in ~/.zshrc
#plugins=(git docker docker-compose)
#add at the end of file ~/.zshrc
#autoload -Uz compinit
#compinit

#Enable VOLUME
#sudo nano /etc/wsl.conf

# Now make it look like this and save the file when you're done:
#[automount]
#root = /
#options = "metadata"

