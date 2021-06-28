#! /bin/bash 

sudo apt install wget

install_dir="/opt/minecraft-server"

usage() {
  echo "Usage: $(basename $0) [version]"
  echo "Specify no version for latest stable release"
}

confirm() {
  read -n 1 -p "$1 [y/n] " accepted      
  test $accepted = 'y' && echo || exit
}

test $# -gt 1 && usage && exit 2

if [ $# -eq 1 ]; then
  version=$1
else 
  version=$(wget -qO - "https://mcversions.net/" \
          | grep -oP '(?<=href\=\"/download/)[0-9\.]*(?=\")' \
          | sort -rV -t'.' \
          | head -1)
fi

test -z $version && echo "Could not determine latest stable release" && exit 1

confirm "Download release: $version ?"

if [ -d "$install_dir" ]; then
  cd "$install_dir"
else
  confirm "Directory $install_dir missing. Download jar anyway ?" 
fi

page="https://mcversions.net/download/$version"
pattern="https://launcher.mojang.com/v1/objects/.*/server.jar"
server_jar_url="$(wget -O - "$page" | grep -o "$pattern")"

jar="minecraft_server.$version.jar"

wget -O "$jar" "$server_jar_url"

id minecraft &>/dev/null && chown minecraft.minecraft "$jar"

if [ "$(pwd)" = "$install_dir" ]; then
  rm -f server.jar
  ln -s "$jar" server.jar
fi

if systemctl list-unit-files | grep minecraft ; then
  service minecraft restart
fi
