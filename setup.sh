# update ubuntu
sudo apt update
sudo apt upgrade -y

# update timezone
sudo timedatectl set-timezone Asia/Jakarta

# install ufw (firewall, and apache2 utils for htpasswd)
sudo apt install ufw apache2-utils -y

# install tailscale
sudo curl -fsSL https://tailscale.com/install.sh | sh

# remove unused package ubuntu
sudo chmod +x ubuntu-cleaner.sh
sudo chmod +x clean.sh
sudo sh ubuntu-cleaner.sh
sudo sh clean.sh

# install docker
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install unzip docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo usermod -aG docker $USER

sudo docker network create backend

# setup portainer
sudo docker compose -f "docker-compose/portainer/docker-compose.yml" up -d
