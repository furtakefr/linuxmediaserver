get_disks | while read dev label; do
    echo "Unmounting $dev if mounted..."
    umount $dev || true

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
