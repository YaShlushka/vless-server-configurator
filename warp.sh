WARP_PORT="45000"
curl -fsSL https://cloudflareclient.com | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://cloudflareclient.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-warp.list
sudo apt update
sudo apt install cloudflare-warp
warp-cli registration new
warp-cli mode proxy
warp-cli proxy port 45000
warp-cli connect
echo "warp-cli connect" >> $HOME/.bashrc
