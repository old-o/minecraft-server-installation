#! /bin/sh

default_dir="/opt/minecraft-server"
user=minecraft

dir="${1:-/opt/minecraft-server}"

adduser --system --no-create-home --group --disabled-login $user

mkdir -p $dir

cp config/* $dir

test "$dir" = "$default_dir" \
  || sed -i "s|$default_dir|$dir|g" "$dir/minecraft.service"

ln -s $dir/minecraft.service /etc/systemd/system
echo 'eula=true' > $dir/eula.txt

chown -R $user.$user $dir

systemctl daemon-reload
