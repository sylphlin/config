#!/bin/sh
# AWS CodeDeploy Installation for CentOS 7

# Install Pre-request
sudo yum -y install wget ruby

# Install CodeDeploy Agent
wget https://s3.amazonaws.com/aws-codedeploy-us-east-1/latest/install
sudo chmod +x ./install
sudo ./install auto
