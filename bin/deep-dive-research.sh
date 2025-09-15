#!/bin/sh

sudo xorriso -as mkisofs \
  -V "Ubuntu 24.04 Custom" -volid "UBUNTU_CST" \
  -r -J -joliet-long -iso-level 3 \
  --protective-msdos-label \
  -partition_offset 16 --grub2-mbr \
  --interval:local_fs:0s-15s:zero_mbrpt,zero_gpt \
  --mbr-force-bootable \
  -append_partition 2 0xEF image/efi.img \
  -appended_part_as_gpt \
  -c /boot.catalog \
  -b /boot/grub/i386-pc/eltorito.img \
  -no-emul-boot -boot-load-size 4 -boot-info-table \
  --grub2-boot-info \
  -eltorito-alt-boot \
  -e '--interval:appended_partition_2:all::' \
  -no-emul-boot \
  -o ubuntu-24.04-custom.iso \
  image
