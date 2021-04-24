#! /bin/bash

sudo service minecraft stop

sudo rm -rf /opt/minecraft-server
sudo deluser --quiet minecraft

sudo rm -f /etc/systemd/system/minecraft.service

sudo rm -f /usr/local/bin/mcrcon
sudo rm -f /usr/local/share/man/man1/mcrcon.1
