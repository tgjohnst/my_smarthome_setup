# **NAS setup notes**
These are notes on how I set up my NAS. Detail will be fleshed out eventually, for now they are at least all the essential notes to self I'd need to recreate the setup starting from scratch.

## Initial Setup

- Install 4 8TB drives after [shucking](https://theinventory.com/drive-shucking-a-cheaper-way-to-fill-your-nas-1828843337) some WD Reds
- Install 1 256GB SSD (old) for read cache
- Plug NAS into UPS and start up NAS
- Run SMART extended tests on all 4 drives
- Create storage pool of those 4 drives
- Create btrfs volume for that storage pool
- Wait for parity check to complete (24+ hrs)
- Enable SSH in settings -> Terminal & SNMP
- Enable UPS support (automatic shutdown) in Settings -> UPS -> Enable UPS Support
- Enable User Home Folders (User -> Advanced -> Enable User Home Folders)
- Create shared folder called media (/media)

## Install useful packages

In **Package Sources** , add SynoCommunity (*https://packages.synocommunity.com/*)

## Preparation for docker services

### Install Docker

Install Docker via synology package manager

### Configure Docker

- Add me to docker group so I don't have to run docker as root

```
sudo synogroup --add docker blacklotus90
sudo chown root:docker /var/run/docker.sock
```

- Update Docker-compose to latest version

```
sudo su
cd /var/packages/Docker/target/usr/bin/
mv docker-compose docker-compose_bak
curl -L https://github.com/docker/compose/releases/download/1.26.2/docker-compose-`uname -s`-`uname -m` -o docker-compose
chmod +x docker-compose
exit

docker-compose --version
```

- Add docker aliases to .bashrc - see the [.bashrc file](example_bashrc.sh) here. 

- Free up ports 80 and 443 since they are just redirects and not actually serving anything
  -  This will sometimes have to be redone when DSM is updated

```
sudo su
cd /usr/syno/share/nginx
cp server.mustache server.mustache.bak
cp DSM.mustache DSM.mustache.bak
cp WWWService.mustache WWWService.mustache.bak
sed -i "s/80/8880/g" server.mustache
sed -i "s/80/8880/g" DSM.mustache
sed -i "s/80/8880/g" WWWService.mustache
sed -i "s/443/8881/g" server.mustache
sed -i "s/443/8881/g" DSM.mustache
sed -i "s/443/8881/g" WWWService.mustache
synoservicecfg --restart nginx # restart the webserver
exit
```

### Preparing filesystem

Create config directories for all services

```
cd /volume1/docker
mkdir organizr
mkdir portainer
mkdir deluge
mkdir jackett
mkdir sonarr
mkdir radarr
mkdir lidarr
mkdir embyserver
cd ~
```

Build out media directory tree

```
cd /volume1/media/
mkdir tv
mkdir music
mkdir movies
mkdir downloads
mkdir downloads/torrent_drop
```

### Create a Docker User

Create a docker user e.g. DockerUser in synology GUI. Make sure they're a member of docker group. Grab the docker user and group id from /etc/passwd and /etc/group for the next step

### Preparing Docker compose file

A full docker compose file is [here](docker_services/docker_compose.yml)

At a future point I'll break down the file, but for now it's there.

Clone this repo (my_smarthome_setup) into volume1/docker/ and navigate to NAS/docker_services/

Edit .env to use dockeruser and dockergroup from the previous step

### Starting the services

`docker compose up -d` runs docker compose up in "detached mode". This is aliased above as dcu

## Configuring Services

I'm not going to walk through configuration of every service in detail as this will be dependent on your setup and should be self explanatory. here are the out-of-ordinary or gotcha things to set up

Portainer

- set endpoint (e.g. home.lan) so that port urls resolve properly, before doing anything else

Deluge

- For organizr integration, install webapi python 3.6 plugin egg from [here](https://github.com/idlesign/deluge-webapi/tree/master/dist) by placing in config directory (web ui settings page doesn't work) and restarting
- Make sure to set download location (/downloads)

**TODO** finish this
