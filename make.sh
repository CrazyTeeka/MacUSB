#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
   echo "Usage: make.sh <target> <version> <folder>"
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

sudo -v

echo "Updating Clover..."
sh clover-update.sh

echo "Unmounting USB Flash Drive..."
sudo umount $P1 &> /dev/null
sudo umount $P2 &> /dev/null
sudo umount $P3 &> /dev/null

echo "Formatting USB Flash Drive..."
sudo gdisk $USB < macOS.gdisk &> /dev/null
sudo mkfs.fat -F 32 -n EFI -v $P1 &> /dev/null
sudo mkfs.hfsplus -v BaseSystem $P2 &> /dev/null
sudo mkfs.hfsplus -v macOS $P3 &> /dev/null

echo "Writing BaseSystem to USB Flash Drive..."
sudo apt-get -y install dmg2img &> /dev/null
sudo dmg2img -i $HOME/MacOS/$VER/BaseSystem.dmg -p 4 -o $P2 &> /dev/null

echo "Mounting USB Flash Drive..."
sudo mkdir -p  /media/$USER/EFI
sudo mkdir -p  /media/$USER/macOS
sudo rm -rf    /media/$USER/EFI/*
sudo rm -rf    /media/$USER/macOS/*
sudo mount $P1 /media/$USER/EFI
sudo mount $P3 /media/$USER/macOS

echo "Copying EFI to USB Flash Drive..."
sudo cp -rf $EFI/EFI /media/$USER/EFI/
sudo cp -rf $EFI/EFI /media/$USER/macOS/

echo "Copying MacOS to USB Flash Drive..."
sudo mkdir -p /media/$USER/macOS/SharedSupport
sudo cp -rf $HOME/MacOS/$VER/* /media/$USER/macOS/SharedSupport/

echo "Copying Scripts to USB Flash Drive..."
sudo cp -rf Scripts  /media/$USER/macOS/

echo "Copying Tools to USB Flash Drive..."
sudo cp -rf Tools    /media/$USER/macOS/

if [ -d "$HOME/KeePassXC" ]; then
   echo "Copying KeePassXC to USB Flash Drive..."
   sudo cp -rf $HOME/KeePassXC /media/$USER/macOS/
fi

sudo chown -R $USER:$USER /media/$USER/macOS/*
sudo chmod +x /media/$USER/macOS/Scripts/*

echo "Unmounting USB Flash Drive..."
sudo umount $P1 &> /dev/null
sudo umount $P2 &> /dev/null
sudo umount $P3 &> /dev/null

echo "Ejecting USB Flash Drive..."
sudo eject $USB

echo "Done"
