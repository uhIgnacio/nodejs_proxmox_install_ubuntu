echo "make sure this is run in root (sudo su)"

apt-get update -y && apt-get upgrade -y
apt-get install qemu-guest-agent
systemctl start qemu-guest-agent
echo "you may have to reboot"
passwd
echo "Setting the ssh config"
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

echo "restarting the ssh"
sudo service ssh restart

echo "all done thanks for using this script"

echo "you can now exit the ssh and login as root user with the password you put"

curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs -y
