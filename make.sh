#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
   echo "Usage:   make.sh <target> <folder> <version>"
   echo "Example: make.sh /dev/sdb Clover.User/James 10.15.4"
   exit 0
fi

if [ "$1" = "/dev/sda" ]; then
   echo "You cannot write to boot drive."
   exit 0
fi

USB="$1" # Target Device (USB)
EFI="$2" # EFI Folder    (Clover.User)
VER="$3" # MacOS Version (10.15.4)

P1=$USB"1" # Partition 1 (USB)
P2=$USB"2" # Partition 2 (USB)
P3=$USB"3" # Partition 3 (USB)

sh update.sh

sudo umount $P1
sudo umount $P2
sudo umount $P3

sudo gdisk $USB < macOS.gdisk
sudo mkfs.fat -F 32 -n EFI -v $P1
sudo mkfs.hfsplus -v BaseSystem $P2
sudo mkfs.hfsplus -v macOS $P3

sudo dmg2img -i ../MacOS/$VER/BaseSystem.dmg -p 4 -o $P2

sudo mkdir -p /media/$USER/EFI
sudo mkdir -p /media/$USER/macOS

sudo rm -rf /media/$USER/EFI/*
sudo rm -rf /media/$USER/macOS/*

sudo mount $P1 /media/$USER/EFI
sudo mount $P3 /media/$USER/macOS

sudo cp -rf $EFI/EFI /media/$USER/EFI/
sudo cp -rf $EFI/EFI /media/$USER/macOS/

sudo mkdir -p /media/$USER/macOS/SharedSupport
sudo cp -rf ../MacOS/$VER/* /media/$USER/macOS/SharedSupport/

sudo cp -rf Scripts  /media/$USER/macOS/
sudo cp -rf Tools    /media/$USER/macOS/

sudo chown -R $USER:$USER /media/$USER/macOS/*
sudo chmod +x /media/$USER/macOS/Scripts/*

sudo eject $USB
