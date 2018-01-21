#!/usr/bin/env bash
#https://unix.stackexchange.com/questions/370568/how-to-add-default-yum-repositories-for-centos-7-3
sudo yum install git
sudo yum install wget
sudo yum install bash-completion
# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion