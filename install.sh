#! /bin/bash

cd "$(dirname ${BASH_SOURCE[0]})" || exit 1

sudo ./mc-server-setup.sh
sudo ./mcrcon-install.sh
sudo ./mc-server-jar-install.sh

tail -F /opt/minecraft-server/logs/latest.log
