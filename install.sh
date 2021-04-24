#! /bin/bash

cd "$(dirname ${BASH_SOURCE[0]})"

sudo ./mc-server-setup.sh
sudo ./mcrcon-install.sh
sudo ./mc-server-jar-install.sh

less /opt/minecraft-server/logs/latest.log
