#!/bin/sh
# docker
apt-get -y update
apt-get -y install curl
apt-get -y install apache2-utils
apt-get -y install python-pip python-dev build-essential
pip install --upgrade pip
pip install --upgrade virtualenv
pip install j2cli
curl -sSL https://get.docker.com/ | sh

echo "DOCKER_OPTS='-H tcp://127.0.0.1:4243 -H unix:///var/run/docker.sock'" >> /etc/default/docker
echo "export DOCKER_HOST=tcp://localhost:4243" >> /home/vagrant/.bashrc
echo "alias dc='docker-compose'" >> /home/vagrant/.bashrc

# docker-compose
curl -L https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
restart docker
