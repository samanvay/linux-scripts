#!/usr/bin/env bash
adduser nhsrc

# may have to replace wheel with sudo
usermod -aG wheel nhsrc
su - nhsrc
mkdir .ssh
chmod 700 /home/nhsrc/.ssh

# copy your public key here
vi ~/.ssh/authorized_keys
chmod 600 /home/nhsrc/.ssh/authorized_keys

# RSAAuthentication and PubkeyAuthentication to yes
#Match User !root
#    PasswordAuthentication no
vi /etc/ssh/sshd_config

# %wheel  ALL=(ALL)       NOPASSWD: ALL
sudo visudo

service sshd reload