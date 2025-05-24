#!/bin/bash
set -e

echo "Detecting and preparing SSDs..."

read -p "This will ERASE all data on the 800GB and 400GB SSDs. Proceed? (yes/no): " confirm
if [[ "$confirm" != "yes" ]]; then
    echo "Aborting."
    exit 1
fi

get_uuid() {
    lsblk -o NAME,SIZE,UUID -dn | while read name size uuid; do
        sizegb=$(echo $size | grep -o '[0-9]*')
        if [[ "$sizegb" -ge 700 && "$uuid" == "" ]]; then
            echo "/dev/$name MEDIA"
        elif [[ "$sizegb" -ge 300 && "$sizegb" -lt 700 && "$uuid" == "" ]]; then
            echo "/dev/$name KAMERA"
        fi
    done
}

for line in $(get_uuid); do
    dev="/dev/$(echo $line | cut -d' ' -f1)"
    label="$(echo $line | cut -d' ' -f2)"

    echo "Formatting $dev as $label..."
    mkfs.ext4 -F $dev
    uuid=$(blkid -s UUID -o value $dev)

    if [ "$label" == "MEDIA" ]; then
        mkdir -p /mnt/Media
        echo "UUID=$uuid /mnt/Media ext4 defaults 0 2" >> /etc/fstab
    elif [ "$label" == "KAMERA" ]; then
        mkdir -p /mnt/Kamera
        echo "UUID=$uuid /mnt/Kamera ext4 defaults 0 2" >> /etc/fstab
    fi
done

echo "Mounting drives..."
mount -a

echo "Drives mounted successfully."
