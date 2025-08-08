# archlinux-network
This repo is intended for using ArchLinux as a network administration environment.

### Install
Once you have arch installed you only have to execute this bash script to install and configure all the network tools & utilities.

```sh
curl -fsSL https://raw.githubusercontent.com/d4nilpzz/archlinux-network/main/install.sh | bash
```

### Packages
This script will install to the machine the following packages

- `net-tools` → ifconfig, netstat, route, etc.
- `iproute2` → ip, ss, etc.
- `ethtool` → parámetros de interfaces
- `mtr` → traceroute + ping en tiempo real
- `traceroute` → rastreo de rutas
- `nmap` → escaneo de red y puertos
- `arp-scan` → descubrimiento en LAN
- `whois` → información WHOIS
- `bind` → dig, nslookup
- `openbsd-netcat` → conexiones TCP/UDP manuales
- `curl` → solicitudes HTTP/HTTPS
- `wget` → descarga de archivos
- `iperf3` → pruebas de ancho de banda
- `tcpdump` → captura de paquetes
