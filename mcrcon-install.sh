#! /bin/bash

git clone https://github.com/Tiiffi/mcrcon.git

cd mcrcon
make
sudo make install

cd ..
sudo rm -rf mcrcon

# prompt for password
read -p "Set admin password for rcon access: " password

ensure_setting() {
  local file=$1
  local key=$2
  local value=$3
  if grep "^$key=" $file; then 
    sed -i --silent "s/^$key=.*$/$key=$value/" $file 
  else 
    echo "$key=$value" > $file
  fi
}

# ensure rcon setting in server.properties
file="/opt/minecraft-server/server.properties"
sudo ensure_setting $file "enable-rcon" true
sudo ensure_setting $file "rcon.password" "$password"
sudo ensure_setting $file "rcon.port" 25575

# ensure rcon password is set in bashrc
ensure_setting "$HOME/.bashrc" "export MCRCON_PASS" "$password"

