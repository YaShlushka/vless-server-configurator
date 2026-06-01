source $HOME/vless-server-configurator/defines.sh
echo -e "$PASSWORD\n$PASSWORD" | passwd
apt update && apt upgrade -y
useradd -m -s /bin/bash "$USERNAME"
echo "$USERNAME:$PASSWORD" | chpasswd
sed -i '/#Port 22/c\Port $SSH_PORT' /etc/ssh/sshd_config
sed -i '/PermitRootLogin/c\PermitRootLogin no' /etc/ssh/sshd_config
systemctl restart sshd
apt install git nmap net-tools curl docker.io docker-compose openssl -y
git clone https://github.com/MHSanaei/3x-ui.git
