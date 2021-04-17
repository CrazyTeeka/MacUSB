#!/bin/bash

EFI="Clover/Series-9"
#EFI="OpenCore/Series-9"

sh update-clover.sh
sh update-kexts.sh
sh update-opencore.sh

sudo mkdir -p /media/$USER/EFI
sudo mount /dev/sdb1 /media/$USER/EFI

sudo rm -rf /media/$USER/EFI/*
sudo cp -rf $EFI/EFI /media/$USER/EFI/

sudo eject /dev/sdb
sudo rm -rf /media/$USER/*
