#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "sh copy-efi.sh /dev/sdb OpenCore/Series-9"
  echo "sh copy-efi.sh /dev/sdb OpenCore/Series-100"
  echo "sh copy-efi.sh /dev/sdb OpenCore/Series-200"
  exit 0
fi

if [ "$1" = "/dev/sda" ]; then
  echo "You cannot write to boot drive."
  exit 0
fi

USB="$1"   # Target Device
EFI="$2"   # EFI Folder
P1=$USB"1" # Partition 1

sh update-kexts.sh
sh update-opencore.sh

sudo mkdir -p /media/$USER/EFI
sudo mount $P1 /media/$USER/EFI

sudo rm -rf /media/$USER/EFI/*
sudo cp -rf $EFI/EFI /media/$USER/EFI/

sudo eject $USB
sudo rm -rf /media/$USER/*
