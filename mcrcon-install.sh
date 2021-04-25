#! /bin/bash

git clone https://github.com/Tiiffi/mcrcon.git

cd mcrcon || exit 1
make
sudo make install

cd ..
sudo rm -rf mcrcon

# prompt for password
read -p "Set admin password for rcon access: " password

cd "$(dirname ${BASH_SOURCE[0]})" || exit 1

ensure_setting() {
  local file=$1
  local key=$2
  local value=$3
  if grep -q "^$key=" $file; then
    sed -i "s/^$key=.*$/$key=$value/" $file 
  else
    echo "$key=$value" >> $file
  fi
  echo "Updated $file to contain $key=$value" 
}

# ensure rcon setting in server.properties
file="server.properties"
cp "/opt/minecraft-server/$file" .
ensure_setting $file "enable-rcon" true
ensure_setting $file "rcon.password" "$password"
ensure_setting $file "rcon.port" 25575

sudo cp "$file" "/opt/minecraft-server/$file"
sudo chown minecraft.minecraft "/opt/minecraft-server/$file"

# ensure rcon password is set in bashrc
ensure_setting "$HOME/.bashrc" "export MCRCON_PASS" "$password"

