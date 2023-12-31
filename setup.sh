sudo apt update -y

locale-gen en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

sudo apt remove iptables-persistent -y
sudo ufw disable
sudo iptables -F

timedatectl set-timezone Asia/Ho_Chi_Minh
sudo fallocate -l 4G /swapfile && sudo chmod 600 /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile && echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

curl -sSL https://get.docker.com | sh
sudo usermod -aG docker $(whoami)
sudo systemctl start docker
sudo systemctl enable docker
apt install docker-compose -y

sudo wget --no-check-certificate https://raw.githubusercontent.com/bibicadotnet/NeverIdle-Oracle/master/VM.Standard.E2.1.Micro.sh -O /usr/local/bin/bypass_oracle.sh
chmod +x /usr/local/bin/bypass_oracle.sh
nohup /usr/local/bin/bypass_oracle.sh >> ./out 2>&1 <&- &
crontab -l > bypass_oracle
echo "@reboot nohup /usr/local/bin/bypass_oracle.sh >> ./out 2>&1 <&- &" >> bypass_oracle
crontab bypass_oracle

wget https://raw.githubusercontent.com/bibicadotnet/alist-docker/main/docker-compose.yml

docker-compose up -d --build --remove-orphans --force-recreate

docker exec -it alist ./alist admin random
