#!/bin/bash

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

apt-get update -y && apt-get upgrade -y
apt-get install qemu-guest-agent
systemctl start qemu-guest-agent
echo "you may have to reboot"
passwd
echo "Setting the ssh config"
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

echo "restarting the ssh"
service ssh restart

echo "all done thanks for using this script"

echo "you can now exit the ssh and login as root user with the password you put"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install node
apt-get install gcc g++ make
