#!/bin/bash

if [ -z "$1" ]; then
  echo "sh copy-efi.sh OpenCore/Series-9"
  exit 0
fi

EFI="$1" # EFI Folder

sh update-kexts.sh
sh update-opencore.sh

sudo mkdir -p /media/$USER/EFI
sudo mount /dev/sdb1 /media/$USER/EFI

sudo rm -rf /media/$USER/EFI/*
sudo cp -rf $EFI/EFI /media/$USER/EFI/

sudo eject /dev/sdb
sudo rm -rf /media/$USER/*
