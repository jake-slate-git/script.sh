#!/bin/bash
# TAK Server Uninstall & Cleanup Script

set -e

echo "[+] Stopping and disabling TAK server service (if running)..."
sudo systemctl stop takserver 2>/dev/null || true
sudo systemctl disable takserver 2>/dev/null || true

echo "[+] Removing TAK server package (if installed)..."
sudo apt purge -y takserver || true
sudo apt autoremove -y

echo "[+] Removing TAK files, config, logs, and certs..."
sudo rm -rf /opt/tak /etc/tak /var/tak /var/log/tak /var/log/takserver

echo "[+] Removing leftover installTAK directories (user and root)..."
sudo rm -rf ~/installTAK /root/installTAK

echo "[+] Removing TAK server .deb and GPG/policy files (if present)..."
sudo rm -f ~/TAKSERVER_*.deb ~/TAKSERVER-PUBLIC-GPG.key ~/DEB_POLICY.POL
sudo rm -f /root/TAKSERVER_*.deb /root/TAKSERVER-PUBLIC-GPG.key /root/DEB_POLICY.POL

echo "[+] Checking for user cert artifacts in home directory..."
sudo rm -f ~/FedCA.pem ~/webadmin.p12 ~/enrollmentDP.zip ~/enrollmentDP-QUIC.zip

echo "[+] Removing TAK log directory (if present)..."
sudo rm -rf /tmp/fullstack_logs

echo "[✓] TAK server has been uninstalled and all associated files have been removed."
