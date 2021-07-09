# Install Docker
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce

# Install Docker Compose
curl -s https://api.github.com/repos/docker/compose/releases/latest \
  | grep browser_download_url \
  | grep docker-compose-$(uname -s)-$(uname -m) \
  | grep -v sha256 \
  | cut -d '"' -f 4 \
  | wget -qi -
mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#Add Linux User to Docker Group
sudo usermod -aG docker ${USER}

#Get PUID and PGID by running id

#Adding environmental variables
sudo echo "PUID=1000" >> /etc/environment 
sudo echo "PGID=998" >> /etc/environment
sudo echo "TZ=\"Asia/Singapore\"" >> /etc/environment
sudo echo "USERDIR=\"/home/${USER}\"" >> /etc/environment
sudo echo "MYSQL_ROOT_PASSWORD=\"password\"" >> /etc/environment