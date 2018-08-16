echo "Dependencies for Aws"
sudo apt-get install -y python3-pip

echo "Installing AWS"
sudo pip3 install awscli

echo "Install Kubernets | https://kubernetes.io/docs/tasks/tools/install-kubectl/"
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo "Install Kubernets Kops | https://github.com/kubernetes/kops/blob/master/docs/install.md"
wget -O kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
sudo chmod +x ./kops
sudo mv ./kops /usr/local/bin/

echo "Install Terraform | https://www.terraform.io/downloads.html"
wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip && unzip terraform_0.11.7_linux_amd64.zip
sudo rm -rf terraform_0.11.7_linux_amd64.zip
sudo mv terraform /usr/local/bin/

echo "Copy Keys AWS CENTAURO && Check User"
cp -R /Projetos/keys/aws/ /home/vagrant/.aws/
#aws iam get-user

#echo "Locate Serveer -> https://cloud-images.ubuntu.com/locator/ec2/"
#aws configure
#SET ID
#SET SECRET KEY
#SET REGION
#SET format json
#Check AWS        $ aws iam get-user

#Generate SSH Key $ ssh-keygcden -f ~/.ssh/saulonunes
#Check Zones      $ aws ec2 describe-availability-zones --region sa-east-1

#Command Line Execute
# kops.sh
# terraform init
# terraform apply
# kubectl get nodes (It takes 15~20 min to see the nodes after terraform apply)