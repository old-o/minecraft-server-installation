# minecraft-server-installation

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

## Upgrades 

To update the server.jar as new releases come out:
* Run ./mc-server-jar-install.sh
* It finds the newest stable release on mcversions.net

## Uninstall

* Run ./uninstall.sh as regular user
* You will be prompted to enter sudo password
