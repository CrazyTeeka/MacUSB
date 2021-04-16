#!/bin/bash

EFI="OpenCore/Series-9"

sh update-clover.sh
sh update-opencore.sh
sudo mkdir -p /media/$USER/EFI
sudo mount /dev/sdb1 /media/$USER/EFI
echo "Copying EFI Folder..."
sudo rm -rf /media/$USER/EFI/*
sudo cp -rf $EFI/EFI /media/$USER/EFI/
sudo eject /dev/sdb
sudo rm -rf /media/$USER/*
echo "Done"
