# Linux Media Server Stack na Raspberry Pi 5

Tento projekt obsahuje kompletný balík pre inštaláciu a spustenie mediálneho servera so službami:  
- Jellyfin (media server)  
- Radarr (filmy)  
- Sonarr (seriály)  
- Overseerr (správa požiadaviek)  
- Bazarr (automatické titulky)  
- Jackett (indexery pre torrent a NZB)  

---

## Predpoklady

- Raspberry Pi 5 s Raspberry Pi OS (Debian-based)  
- Docker a Docker Compose nainštalované  
- SSD disky pripojené a namountované napr. na `/mnt/Media`  
- Používateľ s právami sudo  
- Základné znalosti práce s Linuxom  

---

## 1. Vytvorenie priečinkov

Spusti skript, ktorý vytvorí potrebné adresáre:

```bash
chmod +x setup_folders.sh
./setup_folders.sh
