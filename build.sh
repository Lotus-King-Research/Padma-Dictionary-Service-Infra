MIKKOKOTILA_TOKEN=$1

sudo apt-get update -y
sudo apt install unzip
sudo apt install git
sudo journalctl --rotate

curl https://raw.githubusercontent.com/mikkokotila/Padma-Dictionary-Service-Infra/_deploy_/Padma-Dictionary-Service.conf > Padma-Dictionary-Service.conf

sudo mv Padma-Dictionary-Service.conf /etc/nginx/sites-enabled/Padma-Dictionary-Service.conf
sudo nginx -s reload

# setup and run docker
sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update -y

sudo snap install core
sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot

git clone https://github.com/Lotus-King-Research/Padma-Dictionary-Service
cd Padma-Dictionary-Service

