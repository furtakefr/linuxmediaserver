# Media Server for Raspberry Pi 5

This setup includes:
- Jellyfin (8096)
- Radarr (7878)
- Sonarr (8989)
- Overseerr (5055)
- qBittorrent (8080)
- Bazarr (6767)
- Jackett (9117)

## Installation

```bash
chmod +x install.sh mount-ssds.sh
sudo ./install.sh
```

All media is stored under:
- `/mnt/Media` for movies/TV
- `/mnt/Kamera` for camera footage
