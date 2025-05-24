#!/bin/bash

echo "Vytváram potrebné priečinky..."

mkdir -p /mnt/Media/movies
mkdir -p /mnt/Media/tv
mkdir -p /mnt/Media/downloads

mkdir -p ~/docker-configs/jellyfin
mkdir -p ~/docker-configs/radarr
mkdir -p ~/docker-configs/sonarr
mkdir -p ~/docker-configs/overseerr
mkdir -p ~/docker-configs/bazarr
mkdir -p ~/docker-configs/jackett

echo "Priečinky vytvorené."
