#!/bin/bash
component=$1
env=$2
sudo dnf install ansible -y
cd /home/ec2-user
rm -rf ansible-robo-v3-terraform
git clone https://github.com/vinays2225/ansible-robo-v3-terraform.git
cd ansible-robo-v3-terraform
git pull
ansible-playbook -e component=$component -e environment=$env main.yaml