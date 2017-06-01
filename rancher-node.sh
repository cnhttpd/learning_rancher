#! /bin/bash

yum update -y
yum install net-tools vim -y
curl -fsSL https://get.docker.com/ | sh
sudo systemctl enable docker.service
sudo systemctl start docker
# <replace this line with the saved registration command from the previous stage>
