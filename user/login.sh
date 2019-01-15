#!/usr/bin/env bash
# Create user sam
adduser sam
passwd sam

# Add to sudo group
usermod -aG sudo sam # UBUNTU
usermod -aG wheel sam # CENTOS
visudo
### add following line
sam           ALL=(ALL)       NOPASSWD: ALL

# Copy sam's public key
mkdir ~/.ssh
ssh-copy-id -i ~/.ssh/id_rsa_sam.pub sam@$SERVER

# Public key authentication
vi /etc/ssh/sshd_config
### Update following
PubkeyAuthentication yes
PasswordAuthentication no