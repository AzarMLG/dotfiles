#!/bin/sh

apt update && 
apt upgrade -y &&
apt install -y ufw &&
adduser azar &&
usermod -aG sudo azar &&
ufw allow OpenSSH &&
ufw enable &&
cp -r ~/.ssh /home/azar &&
chown -R azar:azar /home/azar/.ssh
echo "Great success"

