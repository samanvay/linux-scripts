#!/usr/bin/env bash
# UBUNTU
adduser --system --group --disabled-password --home /home/app --shell /bin/bash app
# CENTOS
adduser -d /home/app -m -r -U app
usermod -L app