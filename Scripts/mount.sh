#!/bin/zsh

if [ -z "$1" ]; then
  echo "Mounting EFI..."
  sudo diskutil mount /dev/disk0s1 >/dev/null 2>/dev/null
elif [ "$1" = "u" ] || [ "$1" = "unmount" ]; then
  echo "Unmounting EFI..."
  sudo diskutil unmount /dev/disk0s1 >/dev/null 2>/dev/null
fi

echo "Done"
