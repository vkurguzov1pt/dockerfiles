#Let's update the package database:
sudo apt-get update

#install Docker
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

#Add the Docker repository to APT sources:
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
apt-cache policy docker-engine

#Finally, install Docker:
sudo apt-get install -y docker-engine
sudo systemctl status docker

#Executing the Docker Command Without Sudo 
sudo usermod -aG docker $(whoami)
