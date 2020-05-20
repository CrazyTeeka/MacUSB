#!/bin/zsh

sudo diskutil mount /dev/disk0s1 >/dev/null 2>/dev/null

sudo rm -rf /Volumes/EFI/EFI
sudo mkdir  /Volumes/EFI/EFI

if [ "$1" = "oc" ] || [ "$1" = "opencore" ]; then
  echo "Copying OpenCore..."
  sudo cp -rf /Volumes/macOS/EFI-OPENCORE/* /Volumes/EFI/EFI/
else
  echo "Copying Clover..."
  sudo cp -rf /Volumes/macOS/EFI-CLOVER/*   /Volumes/EFI/EFI/
fi

echo "Done"
