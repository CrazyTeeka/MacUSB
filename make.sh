#!/bin/bash

if [ -t 1 ]; then
  tty_escape() { printf "\033[%sm" "$1"; }
else
  tty_escape() { :; }
fi

tty_mkbold() { tty_escape "1;$1"; }
tty_underline="$(tty_escape "4;39")"
tty_blue="$(tty_mkbold 34)"
tty_red="$(tty_mkbold 31)"
tty_bold="$(tty_mkbold 39)"
tty_reset="$(tty_escape 0)"

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  echo "${tty_bold}Usage:${tty_blue} make.sh${tty_bold} <${tty_blue}target${tty_bold}> <${tty_blue}version${tty_bold}> <${tty_blue}folder${tty_bold}>${tty_reset}"
  exit 0
fi

if [ "$1" = "/dev/sda" ]; then
  echo "${tty_red}You cannot write to boot drive.${tty_reset}"
  exit 0
fi

USB="$1"   # Target Device
VER="$2"   # MacOS Version
EFI="$3"   # EFI Folder
P1=$USB"1" # Partition 1
P2=$USB"2" # Partition 2
P3=$USB"3" # Partition 3

sudo -v

echo "${tty_blue}==>${tty_bold} Updating Clover...${tty_reset}"
sh clover-update.sh

echo "${tty_blue}==>${tty_bold} Unmounting...${tty_reset}"
sudo umount $P1 >/dev/null 2>/dev/null
sudo umount $P2 >/dev/null 2>/dev/null
sudo umount $P3 >/dev/null 2>/dev/null

echo "${tty_blue}==>${tty_bold} Formatting...${tty_reset}"
sudo gdisk $USB < macOS.gdisk >/dev/null 2>/dev/null
sudo mkfs.fat -F 32 -n EFI -v $P1 >/dev/null 2>/dev/null
sudo mkfs.hfsplus -v BaseSystem $P2 >/dev/null 2>/dev/null
sudo mkfs.hfsplus -v macOS $P3 >/dev/null 2>/dev/null

echo "${tty_blue}==>${tty_bold} Mounting...${tty_reset}"
sudo mkdir -p  /media/$USER/EFI
sudo mkdir -p  /media/$USER/macOS
sudo rm -rf    /media/$USER/EFI/*
sudo rm -rf    /media/$USER/macOS/*
sudo mount $P1 /media/$USER/EFI
sudo mount $P3 /media/$USER/macOS

echo "${tty_blue}==>${tty_bold} Copying BaseSystem...${tty_reset}"
sudo apt-get -y install dmg2img >/dev/null 2>/dev/null
sudo dmg2img -i $HOME/MacOS/$VER/BaseSystem.dmg -p 4 -o $P2 >/dev/null 2>/dev/null

echo "${tty_blue}==>${tty_bold} Copying EFI...${tty_reset}"
sudo mkdir -p          /media/$USER/macOS/EFI-CLOVER/
sudo cp -rf $EFI/EFI   /media/$USER/EFI/
sudo cp -rf $EFI/EFI/* /media/$USER/macOS/EFI-CLOVER/

echo "${tty_blue}==>${tty_bold} Copying macOS...${tty_reset}"
sudo mkdir -p /media/$USER/macOS/SharedSupport
sudo cp -rf $HOME/MacOS/$VER/* /media/$USER/macOS/SharedSupport/

echo "${tty_blue}==>${tty_bold} Copying DSDT...${tty_reset}"
sudo cp -rf Clover.Config/DSDT /media/$USER/macOS/

echo "${tty_blue}==>${tty_bold} Copying Scripts...${tty_reset}"
sudo cp -rf Scripts  /media/$USER/macOS/

echo "${tty_blue}==>${tty_bold} Copying Tools...${tty_reset}"
sudo cp -rf Tools    /media/$USER/macOS/

if [ -d "$HOME/KeePassXC" ]; then
echo "${tty_blue}==>${tty_bold} Copying KeePassXC...${tty_reset}"
sudo cp -rf $HOME/KeePassXC /media/$USER/macOS/
fi

sudo chown -R $USER:$USER /media/$USER/macOS/*
sudo chmod +x /media/$USER/macOS/Scripts/*

echo "${tty_blue}==>${tty_bold} Unmounting...${tty_reset}"
sudo umount $P1 >/dev/null 2>/dev/null
sudo umount $P2 >/dev/null 2>/dev/null
sudo umount $P3 >/dev/null 2>/dev/null

echo "${tty_blue}==>${tty_bold} Ejecting...${tty_reset}"
sudo eject $USB

echo "${tty_blue}==>${tty_bold} Done${tty_reset}"
