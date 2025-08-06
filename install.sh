#!/bin/bash
set -e

echo "[INFO] Actualizando el sistema..."
sudo pacman -Syu --noconfirm

echo "[INFO] Instalando herramientas de redes..."
sudo pacman -S --noconfirm \
  net-tools iproute2 traceroute mtr \
  openvpn wireguard-tools \
  tcpdump wireshark-qt \
  nmap aircrack-ng \
  ethtool iperf3 \
  bind netcat \
  curl wget \
  openssh \
  dnsutils \
  socat \
  speedtest-cli \
  arp-scan

echo "[INFO] Instalando entorno gráfico (i3-gaps + LightDM + Polybar)..."
sudo pacman -S --noconfirm \
  xorg-server xorg-xinit i3-gaps \
  lightdm lightdm-gtk-greeter \
  polybar rofi picom feh

echo "[INFO] Habilitando LightDM..."
sudo systemctl enable lightdm

echo "[INFO] Creando configuración de i3..."
mkdir -p ~/.config/i3
cat > ~/.config/i3/config <<'EOF'
exec_always --no-startup-id picom
exec_always --no-startup-id feh --bg-fill /usr/share/backgrounds/xfce/xfce-blue.jpg
exec_always --no-startup-id polybar example

set $mod Mod4
bindsym $mod+Return exec alacritty
bindsym $mod+d exec rofi -show run
bindsym $mod+Shift+q kill
EOF

echo "[INFO] Creando configuración de Polybar..."
mkdir -p ~/.config/polybar
cat > ~/.config/polybar/config.ini <<'EOF'
[bar/example]
width = 100%
height = 30
background = #222
foreground = #fff
modules-left = date
modules-right = network cpu memory

[module/date]
type = internal/date
date = %Y-%m-%d %H:%M:%S

[module/network]
type = internal/network
interface = eth0
format-connected = %{F#0f0} %downspeed% %upspeed%

[module/cpu]
type = internal/cpu

[module/memory]
type = internal/memory
EOF

echo "[INFO] Instalación completada ✅"
echo "Reinicia el sistema para entrar en i3."
