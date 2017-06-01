#! /bin/bash

yum update -y
curl -fsSL https://get.docker.com/ | sh
sudo systemctl enable docker.service
sudo systemctl start docker
docker run -d -v /var/lib/mysql:/var/lib/mysql --restart=unless-stopped -p 8080:8080 rancher/server