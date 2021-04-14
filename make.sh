#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  echo "Usage: sh make.sh /dev/sdb Catalina OpenCore/Series-9"
  echo "       sh make.sh /dev/sdb Catalina OpenCore/Series-100"
  echo "       sh make.sh /dev/sdb Catalina OpenCore/Series-200"
  echo "       sh make.sh /dev/sdb Catalina OpenCore/Series-300"
  echo "       sh make.sh /dev/sdb Catalina OpenCore/Series-400"
  echo "       sh make.sh /dev/sdb Catalina OpenCore/Series-500"
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

echo "Unmounting $USB..."
sudo umount $P1 >/dev/null 2>/dev/null
sudo umount $P2 >/dev/null 2>/dev/null
sudo umount $P3 >/dev/null 2>/dev/null

echo "Formatting $USB..."
sudo gdisk $USB < make.gdisk >/dev/null 2>/dev/null
sudo mkfs.fat -F 32 -n EFI -v $P1 >/dev/null 2>/dev/null
sudo mkfs.hfsplus -v BaseSystem $P2 >/dev/null 2>/dev/null
sudo mkfs.hfsplus -v macOS $P3 >/dev/null 2>/dev/null

echo "Mounting EFI..."
sudo mkdir -p  /media/$USER/EFI
sudo rm -rf    /media/$USER/EFI/*
sudo mount $P1 /media/$USER/EFI

echo "Mounting macOS..."
sudo mkdir -p  /media/$USER/macOS
sudo rm -rf    /media/$USER/macOS/*
sudo mount $P3 /media/$USER/macOS

echo "Copying BaseSystem..."
sudo apt-get -y install dmg2img >/dev/null 2>/dev/null
sudo dmg2img -i $HOME/MacOS/$VER/BaseSystem.dmg -p 4 -o $P2 >/dev/null 2>/dev/null

echo "Copying $3..."
sudo mkdir -p /media/$USER/macOS/EFI
sudo cp -rf $EFI/EFI   /media/$USER/EFI/
sudo cp -rf $EFI/EFI/* /media/$USER/macOS/EFI/

echo "Copying macOS..."
sudo mkdir -p /media/$USER/macOS/SharedSupport
sudo cp -rf $HOME/MacOS/$VER/* /media/$USER/macOS/SharedSupport/

echo "Copying Scripts..."
sudo cp -rf Scripts /media/$USER/macOS/

echo "Copying Tools..."
sudo cp -rf Tools /media/$USER/macOS/

echo "Finalizing..."
sudo chown -R $USER:$USER /media/$USER/macOS/*
sudo chmod +x /media/$USER/macOS/Scripts/*

echo "Unmounting $USB..."
sudo umount $P1 >/dev/null 2>/dev/null
sudo umount $P2 >/dev/null 2>/dev/null
sudo umount $P3 >/dev/null 2>/dev/null

echo "Ejecting $USB..."
sudo eject $USB

echo "Done"
