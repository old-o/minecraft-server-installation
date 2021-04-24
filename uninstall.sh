#! /bin/bash

echo "Stopping minecraft service ..."
sudo service minecraft stop

echo "Deleting /opt/minecraft-server ..."
sudo rm -rf /opt/minecraft-server

echo "Deleting minecraft user ..."
sudo deluser --quiet minecraft

echo "Deleting minecraft.service and mcrcon files ..."
sudo rm -f /etc/systemd/system/minecraft.service
sudo rm -f /usr/local/bin/mcrcon
sudo rm -f /usr/local/share/man/man1/mcrcon.1
