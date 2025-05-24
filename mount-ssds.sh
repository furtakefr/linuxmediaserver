#!/bin/bash
set -e

echo "Detecting and preparing SSDs..."

read -p "This will ERASE all data on the 800GB and 400GB SSDs. Proceed? (yes/no): " confirm
if [[ "$confirm" != "yes" ]]; then
    echo "Aborting."
    exit 1
fi

get_disks() {
    lsblk -b -d -o NAME,SIZE -n | while read name size; do
        size_gb=$((size / 1024 / 1024 / 1024))
        if [[ $size_gb -ge 700 ]]; then
            echo "/dev/$name MEDIA"
        elif [[ $size_gb -ge 300 && $size_gb -lt 700 ]]; then
            echo "/dev/$name KAMERA"
        fi
    done
}

get_disks | while read dev label; do
    echo "Formatting $dev as $label..."
    mkfs.ext4 -F $dev
    uuid=$(blkid -s UUID -o value $dev)

    if [ "$label" == "MEDIA" ]; then
        mkdir -p /mnt/Media
        grep -q "$uuid" /etc/fstab || echo "UUID=$uuid /mnt/Media ext4 defaults 0 2" >> /etc/fstab
    elif [ "$label" == "KAMERA" ]; then
        mkdir -p /mnt/Kamera
        grep -q "$uuid" /etc/fstab || echo "UUID=$uuid /mnt/Kamera ext4 defaults 0 2" >> /etc/fstab
    fi
done

echo "Mounting drives..."
mount -a

echo "Drives mounted successfully."
