source $HOME/vless-server-configurator/defines.sh
echo -e "$PASSWORD\n$PASSWORD" | passwd
apt update && apt upgrade -y
useradd -m -s /bin/bash "$USERNAME"
echo "$USERNAME:$PASSWORD" | chpasswd
usermod -aG sudo $USERNAME
sed -i "/Port 22/c\Port $SSH_PORT" /etc/ssh/sshd_config
sed -i "/PermitRootLogin/c\PermitRootLogin no" /etc/ssh/sshd_config
systemctl restart sshd
apt install git nmap net-tools curl sudo docker.io docker-compose openssl gnupg -y
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh) v2.9.4 << EOF
1
4
y
EOF
x-ui << EOF
8
y

6
y
$USERNAME
$PASSWORD
y
y

9
$X_UI_PORT
y
EOF

