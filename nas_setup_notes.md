# **NAS setup notes**

## Initial Setup

- Install 4 8TB drives after shucking WD Reds
- Install 1 256GB SSD (old) for read cache
- Plug NAS into UPS and start up NAS
- Run SMART extended tests on all 4 drives
- Create storage pool of those 4 drives
- Create btrfs volume for that storage pool
- Wait for parity check to complete (24+ hrs)
- Enable SSH in settings -> Terminal & SNMP
- Enable User Home Folders (User -> Advanced -> Enable User Home Folders)
- Create shared folder called media (/media)

## Preparation for docker services

### Install Docker

Install Docker via synology package manager

### Configure Docker

Add me to docker group so I don't have to run docker as root

```
sudo synogroup --add docker blacklotus90
sudo chown root:docker /var/run/docker.sock
```

Update Docker-compose to latest version

```
sudo su
cd /var/packages/Docker/target/usr/bin/
mv docker-compose docker-compose_bak
curl -L https://github.com/docker/compose/releases/download/1.26.2/docker-compose-`uname -s`-`uname -m` -o docker-compose
chmod +x docker-compose
exit

docker-compose --version
```

Add docker aliases to .bashrc

```
# DOCKER
alias dstopcont='sudo docker stop $(docker ps -a -q)'
alias dstopall='sudo docker stop $(sudo docker ps -aq)'
alias drmcont='sudo docker rm $(docker ps -a -q)'
alias dvolprune='sudo docker volume prune'
alias dsysprune='sudo docker system prune -a'
alias ddelimages='sudo docker rmi $(docker images -q)'
alias docerase='dstopcont ; drmcont ; ddelimages ; dvolprune ; dsysprune'
alias docprune='ddelimages ; dvolprune ; dsysprune'
alias dexec='sudo docker exec -ti'
alias docps='sudo docker ps -a'
alias dcrm='dcrun rm'
alias docdf='sudo docker system df'
alias dclogs='sudo docker logs -tf --tail="50" '
```

Free up ports 80 and 443 since they are just redirects and not actually serving anything

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
exit
# then, change any setting in the Syno UI to restart the webserver
```

### Preparing filesystem

Create config directories for all services

```
mkdir -p /volume1/services/config
cd /volume1/services/config
mkdir organizr
mkdir portainer
mkdir deluge
mkdir jackett
mkdir sonarr
mkdir radarr
mkdir bazarr
mkdir lidarr
cd ~
```

Build out media directory tree

```
cd /volume1/media/
mkdir tv
mkdir music
mkdir movies
mkdir downloads
mkdir downloads/deluge
mkdir downloads/torrent_drop

```

### Preparing Docker compose file

A full docker compose file is [here](docker_services/docker_compose.yaml)

At a future point I'll break down the file, but for now it's there.

