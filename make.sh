#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
   echo "Usage:   make.sh <target> <version> <folder>"
   echo "Example: make.sh /dev/sdb 10.15.4 Clover.Folder/"
   exit 0
fi

if [ "$1" = "/dev/sda" ]; then
   echo "You cannot write to boot drive."
   exit 0
fi

USB="$1"   # Target Device
VER="$2"   # MacOS Version
EFI="$3"   # EFI Folder
P1=$USB"1" # Partition 1
P2=$USB"2" # Partition 2
P3=$USB"3" # Partition 3

echo "Updating Clover..."
sh update.sh

echo "Unmounting..."
sudo umount $P1
sudo umount $P2
sudo umount $P3

echo "Formatting..."
sudo gdisk $USB < macOS.gdisk
sudo mkfs.fat -F 32 -n EFI -v $P1
sudo mkfs.hfsplus -v BaseSystem $P2
sudo mkfs.hfsplus -v macOS $P3

echo "Writing Base System..."
sudo dmg2img -i ../MacOS/$VER/BaseSystem.dmg -p 4 -o $P2

echo "Preparing..."
sudo mkdir -p /media/$USER/EFI
sudo mkdir -p /media/$USER/macOS
sudo rm -rf   /media/$USER/EFI/*
sudo rm -rf   /media/$USER/macOS/*

echo "Mounting..."
sudo mount $P1 /media/$USER/EFI
sudo mount $P3 /media/$USER/macOS

echo "Copying EFI..."
sudo cp -rf $EFI/EFI /media/$USER/EFI/
sudo cp -rf $EFI/EFI /media/$USER/macOS/

echo "Copying MacOS..."
sudo mkdir -p /media/$USER/macOS/SharedSupport
sudo cp -rf ../MacOS/$VER/* /media/$USER/macOS/SharedSupport/

echo "Copying Scripts..."
sudo cp -rf Scripts  /media/$USER/macOS/

echo "Copying Tools..."
sudo cp -rf Tools    /media/$USER/macOS/

echo "Cleaning Up..."
sudo chown -R $USER:$USER /media/$USER/macOS/*
sudo chmod +x /media/$USER/macOS/Scripts/*

echo "Ejecting..."
sudo eject $USB

echo "Done"
