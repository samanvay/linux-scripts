#!/usr/bin/env bash
adduser nhsrc

# may have to replace wheel with sudo
usermod -aG wheel nhsrc
su - nhsrc
mkdir .ssh
chmod 700 /home/nhsrc/.ssh

# copy your public key here
mkdir ~/.ssh
ssh-keygen
ssh-copy-id -i ~/.ssh/id_rsa.pub nhsrc1@10.31.37.23
chmod 600 ~/.ssh/authorized_keys

# %wheel  ALL=(ALL)       NOPASSWD: ALL
sudo visudo

service sshd reload
# Ubuntu
