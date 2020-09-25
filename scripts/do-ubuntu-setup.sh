#!/bin/sh

apt update && 
apt upgrade -y &&
adduser azar &&
usermod -aG sudo azar &&
ufw allow OpenSSH &&
ufw enable &&
rsync --archive --chown=azar:azar ~/.ssh /home/azar &&
echo "Great success"

