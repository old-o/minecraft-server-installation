#! /bin/sh

dir="/opt/minecraft-server"
user=minecraft

adduser --system --no-create-home --group --disabled-login $user

mkdir -p $dir
cp config/* $dir

ln -s $dir/minecraft.service /etc/systemd/system
echo 'eula=true' > $dir/eula.txt

chown -R $user.$user $dir

systemctl daemon-reload
