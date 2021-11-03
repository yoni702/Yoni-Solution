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

# 002-Install Git
sudo yum install git

# 003-Install Java 11 
sudo yum install java 11

# 004-Pull & Run Jenkins image 
sudo docker pull jenkins/jenkins
sudo docker run -p 11011:8080 --name=jenkins-master jenkins/jenkins


# 005-SSH-KEYGEN on Slave
ssh-keygen -t rsa -N "" -f /home/ec2-user/.ssh/id_rsa
cd .ssh
cat id_rsa.pub > authorized_keys
chmod 700 authorized_keys