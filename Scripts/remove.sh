#!/bin/zsh

if [ "$1" = "dsdt" ] || [ "$1" = "DSDT" ]; then
  echo "Removing DSDT..."
  sudo diskutil mount /dev/disk0s1 >/dev/null 2>/dev/null
  sudo rm -f /Volumes/EFI/EFI/CLOVER/ACPI/patched/DSDT.aml
  sudo rm -f /Volumes/EFI/EFI/OC/ACPI/DSDT.aml
fi

echo "Done"
