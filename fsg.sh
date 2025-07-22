sudo apt update && sudo apt upgrade -y && sudo apt install nano -y && sudo apt install curl -y && sudo apt install git -y && sudo apt install openssh-server -y && sudo apt install net-tools -y && sudo apt install htop -y && sudo apt install # Create the keyrings directory

# Make keyring directory
sudo mkdir -p /etc/apt/keyrings

# Import the Cloudflare GPG key
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/cloudflare-warp.gpg

# Add the Cloudflare repo for amd64 only
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/cloudflare-warp.gpg] https://pkg.cloudflareclient.com/ noble main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list > /dev/null

# Update package lists
sudo apt update

#Cloudflare WARP Connector Commands
curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list

sudo apt-get update && sudo apt-get install cloudflare-warp -y

sudo sysctl -w net.ipv4.ip_forward=1
