source $HOME/vless-server-configurator/defines.sh
echo -e "$PASSWORD\n$PASSWORD" | passwd
apt update && apt upgrade -y
useradd -m -s /bin/bash "$USERNAME"
echo "$USERNAME:$PASSWORD" | chpasswd
sed -i "/#Port 22/c\Port $SSH_PORT" /etc/ssh/sshd_config
sed -i "/PermitRootLogin/c\PermitRootLogin no" /etc/ssh/sshd_config
systemctl restart sshd
apt install git nmap net-tools curl docker.io docker-compose openssl -y
curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh -o $HOME/vless-server-configurator/install.sh
bash $HOME/vless-server-configurator/install.sh v2.9.4 --ci --port "$PANEL_PORT" --username "$USERNAME" --password "$PASSWORD"
