# minecraft-server-installation

These scripts and config files automate installation of latest stable vanilla Minecraft server.

### Dependencies

* Your OS must be Linux, or at least have java, bash, sudo, git, wget, systemd, grep, sed, make, adduser/deluser commands.
* The mcrcon admin tool will be downloaded from https://github.com/Tiiffi/mcrcon.git and built from source.
* The default memory allocation for the server process is 4 Gb of RAM.

## Initial installation

* Download https://github.com/odoepner/minecraft-server-installation/archive/refs/heads/main.zip
* Unzip it 
* In a terminal, cd into the unzipped directory
* Run ./install.sh as regular user

You will be prompted to 
* enter sudo password
* confirm the Minecraft version that will be installed
* specify an admin password for mcrcon access

The installation concludes by tailing the server log.
Wait until you see something like this:

```
[20:34:01] [Server thread/INFO]: Done (307.755s)! For help, type "help"
[20:34:01] [Server thread/INFO]: Starting remote control listener
[20:34:01] [Server thread/INFO]: Thread RCON Listener started
[20:34:01] [Server thread/INFO]: RCON running on 0.0.0.0:25575
```
## Administration

* Run mcrcon command in a terminal 
* Use "help" to see what is available
* For example, to add a user to the whitelist:
```
$ mcrcon 
Logged in. Type 'quit' or 'exit' to quit.
>help whitelist
/whitelist add <targets>/whitelist list/whitelist off/whitelist on/whitelist reload/whitelist remove <targets>
>whitelist add pubjub
Added Pubjub to the whitelist
```
Usernames can be looked up like this: https://mcuuid.net/?q=pubjub

## Upgrades 

To update the server.jar as new releases come out:
* Run ./mc-server-jar-install.sh
* It finds the newest stable release on mcversions.net
* Prompts you for confirmation
* Downloads and installs the jar 
* Restarts the server process

## Uninstall

* Run ./uninstall.sh as regular user
* You will be prompted to enter sudo password
* This will remove the minecraft server, system user and mcrcon files
