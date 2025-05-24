#!/bin/bash
set -e

echo "Mounting and formatting SSDs..."
sudo bash mount-ssds.sh

echo "Creating necessary folders..."
mkdir -p /mnt/Media/movies /mnt/Media/tv /mnt/Kamera

echo "Starting Docker containers..."
docker compose up -d

echo "All done! Access Jellyfin at http://<RPi-IP>:8096"
