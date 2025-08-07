#!/bin/bash
# Arch Linux Network & Security Toolkit Installer

if [ "$EUID" -ne 0 ]; then
  echo "You must execute this with root !"
  exit 1
fi

pacman -Syu --noconfirm

pacman -S --needed --noconfirm \
  net-tools iproute2 ethtool mtr traceroute \
  nmap arp-scan whois bind openbsd-netcat \
  curl wget iperf3 tcpdump \
  htop iftop nload bmon vnstat glances iptraf-ng \
  ufw fail2ban openssh lynis rkhunter wireshark-qt \
  aircrack-ng hydra john \
  openvpn wireguard-tools proxychains-ng stunnel \
  iw wireless_tools wpa_supplicant kismet reaver \
  hping scapy mtr speedtest-cli \
  python python-pip bash-completion tmux screen rsync ansible \
  polybar

if ! command -v yay &> /dev/null; then
  sudo -u $(logname) bash -c "
    cd /tmp &&
    git clone https://aur.archlinux.org/yay.git &&
    cd yay &&
    makepkg -si --noconfirm
  "
fi

sudo -u $(logname) yay -S --needed --noconfirm \
  masscan zmap amass dnsenum theharvester

ufw default deny incoming
ufw default allow outgoing
ufw enable

systemctl enable --now ufw
systemctl enable --now fail2ban
systemctl enable --now vnstat

echo "Arch Linux Network & Security Toolkit Installer"
echo "v1.0.0 | by d4nilpzz"
echo " "
echo "done"
