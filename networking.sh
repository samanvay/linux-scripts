# open port centos 7
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-all

# Setting up NTP
https://www.tecmint.com/install-ntp-server-in-centos/

# Tools
## Ports listening
nmap -sT -O localhost