#!/bin/bash

# 001-Install Docker
sudo yum update -y
sudo amazon-linux-extras install docker
sudo yum install docker
sudo chkconfig docker on
sudo service docker start
sudo usermod -a -G docker ec2-user
docker --version
sudo docker images

# 002-Install git
sudo yum install git

# 003-Pull & Run Jenkins image 
sudo docker pull jenkins/jenkins
sudo docker run -p 11011:8080 --name=jenkins-master jenkins/jenkins


# 004-Copy the slave node’s public key to master node’s known_hosts file.(Do after 005 on Slave!!!)
sudo mkdir -p /var/jenkins_home/.ssh
cd /var/jenkins_home/.ssh
sudo ssh-keyscan -H PrivateIpSlave >>/var/jenkins_home/.ssh/known_hosts
sudo chmod 700 known_hosts